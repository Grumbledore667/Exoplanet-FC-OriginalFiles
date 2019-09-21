local oo = require "loop.multiple"
local ItemsData = require "itemsData"
local SkySystem = (require "environment.sky").SkySystem

local stringx = require "pl.stringx"
local tablex = require "pl.tablex"
local path = require 'pl.path'

local helpers = {}

---@class CParam
---@field public name string
local CParam = oo.class({
   name = nil,
})

function CParam:set(value)
end

function CParam:get()
end

function CParam:inc(value)
   self:set(self:get() + value)
end


--Time unit class with onDemand conversion
local timeUnitTable = {MSecond = 0.01,Second = 1, Minute = 60, Hour = 3600}
timeUnitTable.Day   = timeUnitTable.Hour * SkySystem:getHoursPerDay()
timeUnitTable.Week  = timeUnitTable.Day * 7

local realDayLength = 3600 * 24

---@class CTime
local CTime = oo.class({})

function CTime:__new(value, timeType)
   return oo.rawnew(self, {value=value, timeType=timeType})
end

function CTime:set(value, timeType)
   self.value = value
   self.timeType = timeType
end

--Brings two lua objects to simple numbers of proper timeType
function CTime.normalize(lVal, rVal)
   local timeType
   if lVal and oo.isinstanceof(lVal, CTime) then
      timeType = lVal.timeType
      lVal = lVal:getAs(timeType)
   end
   if rVal and oo.isinstanceof(rVal, CTime) then
      timeType = timeType or rVal.timeType
      rVal = rVal:getAs(timeType)
   end
   return lVal, rVal
end

function CTime:inc(val)
   local lVal, rVal = self.normalize(self, val)
   self.value = lVal + rVal
   return self.value
end

function CTime:dec(val)
   local lVal, rVal = self.normalize(self, val)
   self.value = lVal - rVal
   return self.value
end

function CTime.__add(lVal, rVal)
   lVal, rVal = CTime.normalize(lVal, rVal)
   return lVal + rVal
end

function CTime.__sub(lVal, rVal)
   lVal, rVal = CTime.normalize(lVal, rVal)
   return lVal - rVal
end

function CTime.__mul(lVal, rVal)
   lVal, rVal = CTime.normalize(lVal, rVal)
   return lVal * rVal
end

function CTime.__div(lVal, rVal)
   lVal, rVal = CTime.normalize(lVal, rVal)
   return lVal / rVal
end

function CTime.convert(value, timeType1, timeType2)
   local prefix1 = timeType1:sub(1,1)
   local prefix2 = timeType2:sub(1,1)
   local timeUnit1 = timeType1:sub(2)
   local timeUnit2 = timeType2:sub(2)
   local mul = 1
   if prefix1 == "r" and prefix2 == "g" then
      mul = SkySystem:getTimeScale()
   elseif prefix1 == "g" and prefix2 == "r" then
      mul = 1 / SkySystem:getTimeScale()
   end
   if timeUnitTable[timeUnit1] ~= timeUnitTable[timeUnit2] then
      local denom1 = timeUnitTable[timeUnit1]
      local denom2 = timeUnitTable[timeUnit2]
      if timeType1 == "rDay" then denom1 = realDayLength end
      if timeType2 == "rDay" then denom2 = realDayLength end
      mul = mul / (denom2 / denom1)
   end
   return value * mul
end

function CTime:getAs(targetType)
   return self.convert(self.value, self.timeType, targetType)
end
helpers.CTime = CTime

--- global param
---@class CGParam : CParam
local CGParam = oo.class({}, CParam)

function CGParam:__new(name)
   return oo.rawnew(self, {name=name})
end

function CGParam:set(value)
   setGlobalParam(self.name, value)
end

function CGParam:get()
   return getGlobalParam(self.name)
end


--- quest param
---@class CQParam : CParam
---@field public questName string
local CQParam = oo.class({
   questName = nil,
}, CParam)

function CQParam:__new(questName, name)
   return oo.rawnew(self, {questName=questName, name=name})
end

function CQParam:set(value)
   setQuestParam(self.questName, self.name, value)
end

function CQParam:get()
   return getQuestParam(self.questName, self.name)
end


helpers.CGParam = CGParam
helpers.CQParam = CQParam

--- a safe destroyEntity wrapper
function helpers.safeDestroyEntity(entity)
   if entity then
      getScene():destroyEntity(entity)
   end
end

--- a safe createEntity wrapper
---@param entityName string
---@param entityClass string
---@param params table
function helpers.safeCreateEntity(entityName, entityClass, params)
   entityClass = entityClass or ""
   local entity, err
   if not entityName then
      err = "WARNING: can't create entity: bad name"
      log(err)
      return nil, err
   end
   entity = getScene():createEntity(entityName, entityClass, params)
   if not entity then
      err = "WARNING: can't create entity"
      log(err)
      return nil, err
   end
   return entity, nil
end

--- a safe entity.preActivate wrapper
function helpers.safePreActivateEntity(entity, activator)
   if entity and entity.preActivate then entity:preActivate(activator) end
end

--- a safe entity.activate wrapper
function helpers.safeActivateEntity(entity, activator)
   if entity and entity.activate then entity:activate(activator) end
end

--- a safe entity.deactivate wrapper
function helpers.safeDeactivateEntity(entity, activator)
   if entity and entity.deactivate then entity:deactivate(activator) end
end

function helpers.getPickupAnimationFor(char, obj)
   --During air time it's allowed to pickup one item with no animation
   if char:getState("inAir") or isDebug("fastLoot") then return nil end
   local difference = obj:getPose():getPos().y - char:getPose():getPos().y
   if difference > 130 then
      return "idle_takeobj_up"
   elseif difference > 70 then
      return "idle_takeobj_front"
   else
      return "idle_takeobj_down_fast"
   end
end

---@param parent shCharacter @spawner entity
---@return CCorpseDummy
function helpers.spawnCorpseDummy(parent)
   return helpers.safeCreateEntity("dummy.cfg", "CCorpseDummy", {parent = parent})
end

function helpers.safeCreateItemWithoutModel(itemName, itemClass, params)
   local _, ext = stringx.splitv(itemName, '%.')
   params = params or {itemName=itemName}
   return helpers.safeCreateEntity('.' .. ext, itemClass, params)
end

function helpers.safeCreateItemWithModel(itemName, itemClass, params)
   local model, ext = stringx.splitv(itemName, '%.')
   model = ItemsData.getItemModel(itemName)
   local texture = ItemsData.getItemTexture(itemName)

   -- TODO:FIXME: should add check if the model even exists as an .sbg
   local finalName
   if model == nil then
      local template = "WARNING: can't create item %s with model nil, creating with dummy model"
      local err = string.format(template, itemName)
      log(err)
      finalName = 'dummy_item.' .. ext
   else
      finalName = string.gsub(model, "%.sbg", "") .. '.' .. ext
   end

   params = params or {itemName=itemName}
   local entity = helpers.safeCreateEntity(finalName, itemClass, params)

   if entity then
      if model and texture then
         entity:setTexture(0, texture)
      end
   end

   return entity
end

---create weapons with model if there's a 'model' field and check for a special 'createModel' bool for other items
---@param itemName string
---@return CItem | CWeapon | CGun
function helpers.safeCreateItem(itemName)
   local item
   if (ItemsData.isItemWeapon(itemName) and ItemsData.getItemModel(itemName)) or ItemsData.getCreateModel(itemName) then
      item = helpers.safeCreateItemWithModel(itemName, ItemsData.getItemClass(itemName))
   else
      item = helpers.safeCreateItemWithoutModel(itemName, ItemsData.getItemClass(itemName))
   end
   if not item then
      local template = "WARNING: can't create item %s"
      local err = string.format(template, itemName)
      log(err)
   end
   return item
end

---check if instance is an instance descended from root character class CCharacter
---@param instance any
---@return boolean
function helpers.isCharacter(instance)
   local CCharacter = (require "character").CCharacter
   return oo.issubclassof(oo.getclass(instance), CCharacter)
end

---check if instance is an instance descended from CDestroyable
---@param instance any
---@return boolean
function helpers.isDestroyable(instance)
   local CDestroyable = require "mixins.destroyable"
   return oo.issubclassof(oo.getclass(instance), CDestroyable)
end

function helpers.getNameAndClass(obj)
   local name, class
   if helpers.isOperable(obj) then
      if obj.getName then
         name = obj:getName()
      end
      if obj.getScriptClass then
         class = obj:getScriptClass()
      end
   end

   return tostring(name), tostring(class)
end

--- checks if obj was not destroyed or isn't nil
---@param obj any
function helpers.isOperable(obj)
   return obj ~= nil and obj.__object ~= nil
end

--- check if obj is an engine entity
--- if it is, either its metatable should be in lua registry
--- or it has a userdata member __object
---@param obj any
function helpers.isGameEntity(obj)
   if type(obj) == "userdata" then
      local mt = getmetatable(obj)
      --TODO: replace with reverse check once engine register types according to lua standards
      --if mt and debug.getregistry()[mt] then
      if mt and tablex.find(tablex.values(debug.getregistry()), mt) then
         return true
      end
   end
   if obj.__object and type(obj.__object) == "userdata" then
      return true
   end
   return false
end

function helpers.initSound(obj, name, distance)
   local aspect = obj:createAspect(name)
   if aspect then
      aspect:setDistance(distance)
      return aspect
   else
      log("ERROR: couldn't create sound " .. tostring(name))
   end
end

function helpers.insertSoundToTable(obj, filename, t, options)
   local snd = helpers.initSound(obj, filename, options.distance)
   if not snd then
      -- initSound logs error
      return
   end

   if options.delay then
      snd:setDelay(options.delay)
   end
   if options.volume then
      snd:setVolume(options.volume)
   end

   table.insert(t, snd)
end

--- show gibs and flies (typically when character dies and gets looted\eaten),
--- create if aspect don't exist yet, disable raycast interaction
---@param self CCharacter
function helpers.showGibs(self)
   if not self.gibs then
      self.gibs = self:createAspect("kabarog_carcass.sbg")
   end
   self.interactor:setRaycastActive(false)

   self.gibs:getPose():setParent(self:getPose())
   self.gibs:getPose():resetLocalPose()
   self.gibs:setVisible(true)
   self:setVisible(false)

   if not self.gibsFlies then
      self.gibsFlies = self:createAspect("flies.sps")
   end

   self.gibsFlies:getPose():setParent(self:getPose())
   self.gibsFlies:getPose():resetLocalPose()
   self.gibsFlies:play()

   if not self.gibsFliesSound then
      self.gibsFliesSound = self:createAspect("Play_flies")
   end

   self.gibsFliesSound:getPose():setParent(self:getPose())
   self.gibsFliesSound:getPose():resetLocalPose()
   self.gibsFliesSound:setDistance(500)
   self.gibsFliesSound:play()
end

---@param item CItem
---@param bonePose shTransformActor
---@return shRigidEntity
function helpers.spawnConsumeEntity(item, bonePose)
   local itemName = item:getItemName()
   local itemModel    = ItemsData.getItemModel(itemName)
   local consumeModel = ItemsData.getItemConsumeModel(itemName) or itemModel
   local texture      = ItemsData.getItemTexture(itemName)
   local attachInfo   = ItemsData.getItemAttachInfo(itemName)

   local consumeEntity
   if item:isInjector() then
      consumeEntity = helpers.safeCreateEntity(itemModel, "")
      for _, name in ipairs({"red", "blue", "green", "reserve1", "reserve2"}) do
         consumeEntity:getMeshByName(name):setVisible(false)
      end
      consumeEntity:getMeshByName(consumeModel):setVisible(true)
   else
      consumeEntity = helpers.safeCreateEntity(consumeModel, "")
   end

   consumeEntity:getPose():setParent(bonePose)
   consumeEntity:getPose():resetLocalPose()
   if attachInfo then
      consumeEntity:getPose():setLocalPos(attachInfo.pos)
   end
   if texture then
      consumeEntity:setTexture(0, texture)
   end
   return consumeEntity
end

---@param char CCharacter
function helpers.createJointSmokingEmitterAspect(char)
   local smokeAspect = char:createAspect("koster_smoke.sps")
   smokeAspect:setLoop(true)
   smokeAspect:getPose():setParent(char:getBonePose("head_slot"))
   smokeAspect:getPose():resetLocalPose()
   local offset
   if char:getPrefabName() == "abori.cfg" then
      offset = vec3New{z=-18, y=-18}
   elseif char:getPrefabName() == "human_male.cfg" then
      offset = vec3New{z=-13, y=-13}
   end
   if offset then
      smokeAspect:getPose():setLocalPos(offset)
   end
   smokeAspect:getPose():setLocalRotQuat(quatFromEuler(vec3New{x=-90}))
   smokeAspect:getPose():setLocalScale(vec3New(0.25, 0.25, 0.25))
   smokeAspect:disable()

   return smokeAspect
end

---Try to apply normal maps along with regular textures
---Example: for 'abori_dead_dif_3.dds' try to apply a generic 'abori_dead_nm.dds' first and more specific 'abori_dead_nm_3.dds' second
---@param obj shCharacter | shRigidEntity | shRigidMeshActor
---@param channel number @must be integer
---@param textureName string
---@param meshName string
function helpers.setTextureAndNormalMap(obj, channel, textureName, meshName)
   local fullName, ext = path.splitext(textureName)
   local name, suffix = string.match(fullName, "(.-)_?(%d*)$")
   local nmName = string.gsub(name, "dif$", "nm")

   if obj.getMeshByName or not meshName then
      if meshName then obj = obj:getMeshByName(meshName) end
      obj:setTexture(channel, textureName)
      if nmName ~= name then
         obj:setTexture(1, string.format("%s%s", nmName, ext))
         if suffix and suffix ~= "" then
            obj:setTexture(1, string.format("%s_%s%s", nmName, suffix, ext))
         end
      end
   elseif meshName then
      obj:setMeshTexture(meshName, channel, textureName)
      if nmName ~= name then
         obj:setMeshTexture(meshName, 1, string.format("%s%s", nmName, ext))
         if suffix and suffix ~= "" then
            obj:setMeshTexture(meshName, 1, string.format("%s_%s%s", nmName, suffix, ext))
         end
      end
   end
end

return helpers
