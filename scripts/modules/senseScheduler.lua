local oo = require "loop.simple"

local List = require "pl.List"
local tablex = require "pl.tablex"

local hlp = require "helpers"

---@class CSense
---@field value boolean
---@field parent CSenseScheduler
---@field func fun():boolean
local CSense = {}

---@class CSenseScheduler
---@field enemies table<CCharacter, boolean>
---@field friends table<CCharacter, boolean>
---@field neutrals table<CCharacter, boolean>
---@field ignores table<CCharacter, boolean>
---@field corpses table<CCharacter, boolean>
---@field thoseWhoSenseMe table<CCharacter, boolean>
---@field onDestroySubscriptions table<CCharacter, table>
---@field senses table<string, CSense>
---@field owner CCharacter
---@field curZone vec3
---@field curEnemy CCharacter
---@field lastEnemy CCharacter
---@field currentCorpse CCorpseDummy
local CSenseScheduler = oo.class()

function CSenseScheduler:__new(members)
   self = oo.rawnew(self, members)
   return self
end

function CSenseScheduler:init()
   self.friends  = {}
   self.enemies  = {}
   self.neutrals = {}
   self.ignores  = {}
   self.corpses  = {}

   -- make it a weak reference table, to prevent cyclic references
   -- hindering garbage collection of destroyed character objects
   self.thoseWhoSenseMe = setmetatable({}, { __mode="k"})
   self.onDestroySubscriptions = {}

   self:setCurZone(self.owner:getSpawnPos())
end

-- value: init value
-- object: owner of the callback (checkFunc)
-- checkFunc: callback will check current state of sense
function CSenseScheduler:addSense(senseName, value, object, checkFunc)
   if not self.senses then
      self.senses = {}
   end
   self.senses[senseName] = {}
   self.senses[senseName].value  = value
   self.senses[senseName].parent = object
   self.senses[senseName].func   = checkFunc
   self.senses[senseName].onChangeFunc = nil
   self.senses[senseName].onChangeOwnerFunc = nil
end

function CSenseScheduler:addEnemyDetectSense()
   self:addSense("enemyDetect", false, self, self.checkDetect)
end

function CSenseScheduler:addPlayerDetectSense()
   self:addSense("playerDetect", false, self, self.checkDetectPlayer)
end

function CSenseScheduler:addDistanceSense(senseName, entity, paramName)
   local sensePredicates = {
      enemy = "enemyDetect",
      player = "playerDetect",
   }
   local function worker(self)
      local predicate = sensePredicates[entity]
      if predicate then
         if not self:getSense(predicate) then
            return false
         end
      end

      local obj
      if entity == "enemy" then
         obj = self:getCurEnemy()
      elseif entity == "player" then
         obj = getPlayer()
      end

      if not obj then
         return false
      end

      local ownerPos = self.owner:getPose():getPos()
      local objPos = obj:getPose():getPos()
      return objInDist(ownerPos, objPos, self.owner.parameters[paramName])
   end
   self:addSense(senseName, false, self, worker)
end

function CSenseScheduler:deleteSense(senseName)
   if not self.senses then
      return
   end
   self.senses[senseName] = nil
end

function CSenseScheduler:setOnChangeSenseFunc(senseName, func)
   if not self.senses then
      return
   end
   if not self.senses[senseName] then
      return
   end
   self.senses[senseName].onChangeFunc = func
end

function CSenseScheduler:setOnChangeSenseOwnerFunc(senseName, func)
   if not self.senses then
      return
   end
   if not self.senses[senseName] then
      return
   end
   self.senses[senseName].onChangeOwnerFunc = func
end

function CSenseScheduler:setCurZone(obj)
   self.curZone = obj
end

function CSenseScheduler:getCurZone()
   return self.curZone
end

-- checks if there was changes of senses' states, and calls appropriate callback
function CSenseScheduler:checkSenses()
   if not self.senses then
      return
   end

   for senseName, sense in pairs(self.senses) do
      local senseChanged = self:setSense(senseName, sense.func(sense.parent))
      if senseChanged then
         if sense.onChangeFunc then
            sense.onChangeFunc(self)
         end
         if sense.onChangeOwnerFunc then
            sense.onChangeOwnerFunc(self.owner)
         end
      end
   end
end

-- set new value for sense and notify owner about it
function CSenseScheduler:setSense(senseName, value)
   if not self.senses then
      return false
   end

   if self.senses[senseName].value ~= value then
      self.senses[senseName].value = value
      self.owner.notificationCenter:postNotification("setSense")
      return true
   else
      return false
   end
end

function CSenseScheduler:getSense(sense)
   if not self.senses or not self.senses[sense] then
      return false
   end

   return self.senses[sense].value
end


-- Feel and Visual functions

function CSenseScheduler:setFeelRadius(radius)
   self.owner:setFeelRadius(radius)
end

-- Events ----------------------------------------------------------------------

function CSenseScheduler:OnIdle()
   if self.owner:getState("engineSleep") then
      return
   end
   self:resetCurEnemy()
   self:resetCurrentCorpse()
   self:checkSenses()
end

function CSenseScheduler:OnHit(charAttacker, itemName, damageValue)
   if self.owner:isEnemy(charAttacker) then
      self.owner:setState("hasEnemy", true)
      self.owner:setState("underAttack", true)
      if not self.enemies[charAttacker] then
         self.enemies[charAttacker] = true
         self:subscribeOnDestroyTracked(charAttacker)
         charAttacker:OnSenseInOther(self.owner)
      end
   end

   self:resetCurEnemy()
end

function CSenseScheduler:OnGuildChange()
   self:refreshGuilds()
   for char in pairs(self.thoseWhoSenseMe) do
      if char.senseScheduler then
         char.senseScheduler:refreshGuilds()
         char.senseScheduler:resetCurEnemy()
      end
   end
end

function CSenseScheduler:startTrackingCharacter(char)
   if char then
      if self.owner:isEnemy(char) then
         self.enemies[char] = true
      elseif self.owner:isFriend(char) then
         self.friends[char] = true
      elseif char:getGuild() == "GLD_CORPSE" then
         self.corpses[char] = true
      elseif self.owner:isIgnore(char) then
         self.ignores[char] = true
      else
         self.neutrals[char] = true
      end
   end
end

function CSenseScheduler:stopTrackingCharacter(char)
   if char then
      self.enemies[char] = nil
      self.friends[char] = nil
      self.ignores[char] = nil
      self.corpses[char] = nil
      self.neutrals[char] = nil
   end
end

function CSenseScheduler:subscribeOnDestroyTracked(char)
   if hlp.isOperable(char) and char.subscribeOnDestroy and not self.onDestroySubscriptions[char] then
      self.onDestroySubscriptions[char] = char:subscribeOnDestroy(self.OnSenseOut, self, char)
   end
end

function CSenseScheduler:unsubscribeOnDestroyTracked(char)
   if hlp.isOperable(char) and self.onDestroySubscriptions[char] then
      char:unsubscribeOnDestroy(self.onDestroySubscriptions[char])
   end
   self.onDestroySubscriptions[char] = nil
end

function CSenseScheduler:OnSenseIn(char)
   self:subscribeOnDestroyTracked(char)
   self:startTrackingCharacter(char)

   if self.owner:isEnemy(char) then
      self.owner:setState("hasEnemy", true)
   end

   self:resetCurEnemy()
   char:OnSenseInOther(self.owner)
end

function CSenseScheduler:OnSenseInOther(char)
   self.thoseWhoSenseMe[char] = true
end

function CSenseScheduler:OnSenseOut(char)
   self:unsubscribeOnDestroyTracked(char)
   self:stopTrackingCharacter(char)

   if char == self:getCurEnemy() then
      self:resetCurEnemy()
   end

   --log("curr enemy = ".. tostring(self:getCurEnemy()))

   if self:getCurEnemy() == nil then
      self.owner:setState("underAttack", false)
      self.owner:setState("hasEnemy", false)
   end
   char:OnSenseOutOther(self.owner)
end

function CSenseScheduler:OnSenseOutOther(char)
   self.thoseWhoSenseMe[char] = nil
end

function CSenseScheduler:OnFeelIn(char)
end

function CSenseScheduler:OnFeelOut(char)
   return self:OnSenseOut(char)
end

function CSenseScheduler:OnVisualIn(char)
   return self:OnSenseIn(char)
end

function CSenseScheduler:OnVisualOut(char)
end


-- Enemies

function CSenseScheduler:addEnemy(char)
   self.owner:setState("hasEnemy", true)
   self.owner:setState("underAttack", true)
   if not self.enemies[char] then
      self.enemies[char] = true
      self:subscribeOnDestroyTracked(char)
      char:OnSenseInOther(self.owner)
   end

   self:resetCurEnemy()
end

function CSenseScheduler:getClosestEnemy()
   local enemies = tablex.keys(self.enemies)
   local result = getClosestObjectInView(self.owner, enemies, self.owner.parameters.viewAngle)
   if not result then
      result = getClosestObject(self.owner, enemies)
   end
   return result
end

function CSenseScheduler:setCurEnemy(char)
   self.lastEnemy = self.curEnemy
   self.curEnemy = char

   if char then
      --log(self.owner:getName() .. " sees " .. char:getName())
   end
end

function CSenseScheduler:resetCurEnemy()
   self:setCurEnemy(self:getClosestEnemy())
end

function CSenseScheduler:getAllChars()
   local chars = List()
   local lists = {self.neutrals, self.friends, self.enemies, self.ignores}

   for _, t in pairs(lists) do
      if t then
         chars:extend(tablex.keys(t))
      end
   end

   return chars
end

function CSenseScheduler:getCharInFocus(maxDist)
   local chars = self:getAllChars()

   if #chars == 0 then
      return nil
   end

   local index   = 1
   local minDist = getDistance(self.owner:getPose():getPos(), chars[index]:getPose():getPos())
   local found   = false

   for key, value in pairs(chars) do
      local dist = getDistance(self.owner:getPose():getPos(), value:getPose():getPos())
      if checkPointInSector(self.owner:getCamera():getPose():getPos(), self.owner:getDir(), value:getPose():getPos(), 40, maxDist) then
         if dist <= minDist then
            minDist = dist
            index   = key
            found   = true
         end
      end
   end

   if not found then
      return nil
   end

   local char = chars[index]

   if char then
      return char
   end
   return nil
end

function CSenseScheduler:getCurEnemy()
   return self.curEnemy
end

function CSenseScheduler:getLastEnemy()
   return self.lastEnemy
end

-- Neutral

function CSenseScheduler:getClosestCharacter()
   local character = getClosestObjectInView(self.owner, tablex.keys(self.enemies), self.owner.parameters.viewAngle)

   if not character then
      character = getClosestObjectInView(self.owner, tablex.keys(self.friends), self.owner.parameters.viewAngle)

      if not character then
         character = getClosestObjectInView(self.owner, tablex.keys(self.neutrals), self.owner.parameters.viewAngle)
      end
   end

   return character
end

---@return CCorpseDummy
function CSenseScheduler:getClosestUnoccupiedCorpse()
   if not self:getSense("seesCorpses") then
      return
   end
   local corpses = tablex.filter(tablex.keys(self.corpses), function(c)
      return not c:getState("occupied")
   end)
   return getClosestObjectInView(self.owner, corpses, self.owner.parameters.viewAngle)
end

function CSenseScheduler:getCurrentCorpse()
   return self.currentCorpse
end

function CSenseScheduler:setCurrentCorpse(char)
   self.currentCorpse = char
end

function CSenseScheduler:resetCurrentCorpse()
   self:setCurrentCorpse(self:getClosestUnoccupiedCorpse())
end

-- Checks

function CSenseScheduler:seesCorpses()
   return next(self.corpses) ~= nil
end

function CSenseScheduler:checkZone()
   return objInDist(self.owner:getPose():getPos(), self:getCurZone(), math.max(100, self.owner.parameters.zoneSize))
end

function CSenseScheduler:checkClose()
   if not self:getSense("enemyDetect") then
      return false
   end
   local obj = self:getCurEnemy()
   if not obj then
      return false
   end
   return objInDist(self.owner:getPose():getPos(), obj:getPose():getPos(), self.owner.parameters.attackDist)
end

function CSenseScheduler:checkWarn()
   if not self:getSense("enemyDetect") then
      return false
   end
   local obj = self:getCurEnemy()
   if not obj then
      return false
   end
   return objInDist(self.owner:getPose():getPos(), obj:getPose():getPos(), self.owner.parameters.warnDist)
end

function CSenseScheduler:checkCloseAtZone()
   if not self:getSense("enemyDetect") then
      return false
   end
   local obj = self:getCurEnemy()
   if not obj then
      return false
   end

   return objInDist(obj:getPose():getPos(), self:getCurZone(), self.owner.parameters.zoneSize) and self:checkClose()
end

function CSenseScheduler:checkFront()
   if not self:getSense("enemyDetect") then
      return false
   end

   local obj = self:getCurEnemy()

   if not obj then
      return false
   end

   return checkPointInSector(self.owner:getPose():getPos(), self.owner:getDir(), obj:getPose():getPos(), self.owner.parameters.attackAngle, 10000)
end

function CSenseScheduler:checkDetect()
   local obj = self:getCurEnemy()
   if not obj then
      return false
   end

   local charPos      = self.owner:getPose():getPos()
   local objPos       = obj:getPose():getPos()
   local dist         = self.owner.parameters.viewDist
   local backViewDist = self.owner.parameters.backViewDist
   local angle        = self.owner.parameters.viewAngle

   if not self:getSense("enemyDetect") then
      local isInView      = inSector (self.owner, objPos, dist, angle)
      local isAtBackNoise = objInDist(charPos, objPos, backViewDist) and (not obj:getStealth())

      return (isInView or isAtBackNoise or self.owner:getState("underAttack"))
   else
      return (objInDist(charPos, objPos, dist) or self.owner:getState("underAttack"))
   end
end

function CSenseScheduler:checkDetectPlayer()
   local obj = getPlayer()

   if not self:getAllChars():contains(obj) then
      return false
   end

   local charPos      = self.owner:getPose():getPos()
   local objPos       = obj:getPose():getPos()
   local dist         = self.owner.parameters.viewDist
   local backViewDist = self.owner.parameters.backViewDist
   local angle        = self.owner.parameters.viewAngle

   local isInView      = inSector (self.owner, objPos, dist, angle)
   local isAtBackNoise = objInDist(charPos, objPos, backViewDist)

   return isInView or isAtBackNoise
end

function CSenseScheduler:checkDetectAtZone()
   local obj = self:getCurEnemy()
   if not obj then
      return false
   end

   return objInDist(obj:getPose():getPos(), self:getCurZone(), self.owner.parameters.zoneSize) and self:checkDetect()
end

function CSenseScheduler:refreshGuilds()
   local chars = {}

   for key in pairs(self.friends) do
      table.insert(chars, key)
   end
   local ownerPos = self.owner:getPose():getPos()
   local ownerFeelRadius = self.owner:getFeelRadius()
   for enemy in pairs(self.enemies) do
      --drop tracked enemies that are outside of engine-tracked radius
      if objInDist(enemy:getPose():getPos(), ownerPos, ownerFeelRadius) then
         table.insert(chars, enemy)
      else
         enemy:OnSenseOutOther(self.owner)
      end
   end
   for key in pairs(self.neutrals) do
      table.insert(chars, key)
   end
   for key in pairs(self.ignores) do
      table.insert(chars, key)
   end

   self.friends  = {}
   self.enemies  = {}
   self.neutrals = {}
   self.ignores  = {}

   for key in pairs(chars) do
      self:OnSenseIn(chars[key])
   end
end

return {CSenseScheduler=CSenseScheduler}
