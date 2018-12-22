local oo = require "loop.simple"
local ItemsData = require "itemsData"

local stringx = require "pl.stringx"
local tablex = require "pl.tablex"

local helpers = {}

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

-- global param
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


-- quest param
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

local function safeDestroyEntity(entity)
   if entity then
      getScene():destroyEntity(entity)
   end
   return nil
end
helpers.safeDestroyEntity = safeDestroyEntity

local function safeCreateEntity(entityName, entityClass)
   entityClass = entityClass or ""
   local entity, err
   if not entityName then
      err = "WARNING: can't create entity: bad name"
      log(err)
      return nil, err
   end
   entity = getScene():createEntity( entityName, entityClass )
   if not entity then
      err = "WARNING: can't create entity"
      log(err)
      return nil, err
   end
   return entity, nil
end
helpers.safeCreateEntity = safeCreateEntity

local function safeCreateItemWithoutModel(itemName, itemClass)
   local model, ext = stringx.splitv(itemName, '%.')
   local entity = safeCreateEntity( '.' .. ext, itemClass )
   if entity then
      entity:setItemName(itemName)
      entity:callAfterNameSet()
   end

   return entity
end
helpers.safeCreateItemWithoutModel = safeCreateItemWithoutModel

local function safeCreateItemWithModel(itemName, itemClass)
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

   local entity = safeCreateEntity( finalName, itemClass )

   if entity then
      entity:setItemName(itemName)
      entity:callAfterNameSet()
      if model and texture then
         entity:setTexture(0, texture)
      end
   end

   return entity
end
helpers.safeCreateItemWithModel = safeCreateItemWithModel

local function isCharacter(instance)
   local CCharacter = (require "character").CCharacter
   return oo.issubclassof(oo.getclass(instance), CCharacter)
end
helpers.isCharacter = isCharacter

local function tryGetter(obj, getterName)
   return obj[getterName](obj)
end

function helpers.getNameAndClass(obj)
   local name, class, result
   result, name = pcall(tryGetter, obj, "getName")
   if not result then
      name = "nil"
   end
   result, class = pcall(tryGetter, obj, "getScriptClass")
   if not result then
      class = "nil"
   end
   return name, class
end

function helpers.isGameEntity(obj)
   if type(obj) == "userdata" then
      if tablex.find(tablex.values(debug.getregistry()), getmetatable(obj)) then
         return true
      end
   end
   if obj.__object or obj.__object_actor then
      return true
   end
   return false
end

return helpers
