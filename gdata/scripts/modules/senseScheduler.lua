local oo = require "loop.simple"

local List = require "pl.List"
local tablex = require "pl.tablex"

local members =
   {
      owner   = nil,
      senses  = nil,
      curZone = nil,

      targetObj      = nil,
      targetObjDist  = 0,
      targetObjAngle = 0,

      activeVisualSense = true,

      curEnemy  = nil,
      lastEnemy = nil,
      friends   = nil,
      enemies   = nil,
      neutrals  = nil,
      ignores   = nil,

      hideoutsEnabled = false,
   }

local CSenseScheduler = oo.class(members)

function CSenseScheduler:init()
   --log( "CSenseScheduler:init" )
   self.friends  = {}
   self.enemies  = {}
   self.neutrals = {}
   self.ignores  = {}

   self:setCurZone( self.owner:getSpawnPos() )
end

-- value: init value
-- object: owner of the callback (checkFunc)
-- checkFunc: callback will check current state of sense
function CSenseScheduler:addSense( senseName, value, object, checkFunc )
   if ( not self.senses ) then
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

function CSenseScheduler:addDistanceSense( senseName, entity, paramName )
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
   if ( not self.senses ) then
      return
   end
   self.senses[senseName] = nil
end

function CSenseScheduler:setOnChangeSenseFunc(senseName, func)
   if ( not self.senses ) then
      return
   end
   if ( not self.senses[senseName] ) then
      return
   end
   self.senses[senseName].onChangeFunc = func
end

function CSenseScheduler:setOnChangeSenseOwnerFunc(senseName, func)
   if ( not self.senses ) then
      return
   end
   if ( not self.senses[senseName] ) then
      return
   end
   self.senses[senseName].onChangeOwnerFunc = func
end

function CSenseScheduler:setCurZone( obj )
   self.curZone = obj
end

function CSenseScheduler:getCurZone()
   return self.curZone
end

-- checks if there was changes of senses' states, and calls appropriate callback
function CSenseScheduler:checkSenses()
   if ( not self.senses ) then
      return
   end

   for key in pairs(self.senses) do
      if (self:setSense(key, self.senses[key].func(self.senses[key].parent))) then
         if ( self.senses[key].onChangeFunc ) then
            self.senses[key].onChangeFunc(self)
         end
         if ( self.senses[key].onChangeOwnerFunc ) then
            self.senses[key].onChangeOwnerFunc(self.owner)
         end
      end
   end
end

-- set new value for sense and notify owner about it
function CSenseScheduler:setSense( senseName, value )
   if ( not self.senses ) then
      return false
   end

   if ( self.senses[senseName].value ~= value ) then
      self.senses[senseName].value = value
      self.owner.notificationCenter:postNotification("setSense")
      return true
   else
      return false
   end
end

function CSenseScheduler:getSense( sense )
   if ( not self.senses or not self.senses[sense] ) then
      return false
   end

   return self.senses[sense].value
end


-- Feel and Visual functions

function CSenseScheduler:setFeelRadius( radius )
   self.owner:setFeelRadius( radius )
end

function CSenseScheduler:setActiveVisualSense( value )
   self.activeVisualSense = value
end

-- Target functions

function CSenseScheduler:setTargetObj( obj, zoneSize, angle )
   self.targetObj      = obj
   self.targetObjDist  = zoneSize
   self.targetObjAngle = angle
   --self.owner:addPublisher("setSense")
end

function CSenseScheduler:resetTargetObj()
   self:setTargetObj( nil, 0, 0 )
end

function CSenseScheduler:getTargetObj()
   return self.targetObj
end


-- Events ----------------------------------------------------------------------

function CSenseScheduler:OnIdle()
   self:resetCurEnemy()
   self:checkSenses()
end

function CSenseScheduler:OnHit( charAttacker, itemName, damageValue )

   if ( self.owner:isEnemy(charAttacker) ) then
      self.owner:setState("hasEnemy", true)
      self.owner:setState("underAttack", true)
      if ( not getKeyByValue(self.enemies, charAttacker) ) then
         table.insert( self.enemies, charAttacker )
      end
   end

   self:resetCurEnemy()
end

function CSenseScheduler:OnSenseIn( char )
   if ( self.owner:isEnemy(char) ) then
      if ( getKeyByValue(self.enemies, char) ) then
         self.owner:setState("underAttack", false)
      else
         table.insert(self.enemies, char)
         self.owner:setState("hasEnemy", true)
      end
   elseif (self.owner:isFriend(char)) then
      table.insert(self.friends, char)
   elseif (self.owner:isIgnore(char)) then
      table.insert(self.ignores, char)
   else
      table.insert(self.neutrals, char)
   end
   --if (not self:getCurEnemy()) then
   self:resetCurEnemy()
   --end
end


function CSenseScheduler:OnSenseOut( char )
   -- when char dies OnFeelOut is called in all chars around him
   -- this is the only moment to capture dead chars, except iterating thru all chars
   if char:getState("dead") and char.getVisible and char:getVisible() then
      if not self.corpses then
         self.corpses = {}
      end
      if not tablex.find(self.corpses, char) then
         table.insert(self.corpses, char)
      end
   end

   if (self.owner:isEnemy(char)) then
      local index = getKeyByValue(self.enemies, char)
      if (not index) then
         return
      end
      table.remove(self.enemies, index)
   elseif (self.owner:isFriend(char)) then
      local index = getKeyByValue(self.friends, char)
      if (not index) then
         return
      end
      table.remove(self.friends, index)
   elseif (self.owner:isIgnore(char)) then
      local index = getKeyByValue(self.ignores, char)
      if (not index) then
         return
      end
      table.remove(self.ignores, index)
   else
      local index = getKeyByValue(self.neutrals, char)
      if (not index) then
         return
      end
      table.remove(self.neutrals, index)
   end
   if (char == self:getCurEnemy()) then
      self:resetCurEnemy()
   end

   --log("curr enemy = ".. tostring(self:getCurEnemy()))

   if ( self:getCurEnemy() == nil ) then
      self.owner:setState( "underAttack", false )
      self.owner:setState( "hasEnemy", false )
   end
end

function CSenseScheduler:OnFeelIn( char )

   if ( not self.activeVisualSense ) then
      --log( "CSenseScheduler:OnFeelIn: " .. tostring(char))
      self:OnSenseIn( char )
   end
end

function CSenseScheduler:OnFeelOut( char )

   if ( not self.activeVisualSense ) then
      --log( "CSenseScheduler:OnFeelOut: " .. tostring(char))
      self:OnSenseOut( char )
   end
end

function CSenseScheduler:OnVisualIn( char )

   if ( self.activeVisualSense ) then
      --log( "name = " .. self.owner:getName() )
      --log("CSenseScheduler:OnVisualIn: " .. tostring(char))
      self:OnSenseIn( char )
   end
end

function CSenseScheduler:OnVisualOut( char )
   if ( self.activeVisualSense ) then
      --log("CSenseScheduler:OnVisualOut: " .. tostring(char))
      self:OnSenseOut( char )
   end
end


-- Enemies

function CSenseScheduler:getClosestEnemy()
   local result = getClosestObjectInView( self.owner, self.enemies, self.owner.parameters.viewAngle )
   if not result then
      result = getClosestObject(self.owner, self.enemies)
   end
   return result
end

function CSenseScheduler:setCurEnemy( char )
   self.lastEnemy = self.curEnemy
   self.curEnemy  = char

   if ( char ) then
   -- log(  self.owner:getName() .. " sees " .. char:getName() )
   end
end

function CSenseScheduler:resetCurEnemy()
   -- log( self.owner:getName() .. " - resetCurEnemy" )
   self:setCurEnemy( self:getClosestEnemy() )
end

function CSenseScheduler:getAllChars()
   local chars = List()
   local lists = {self.neutrals, self.friends, self.enemies, self.ignores}

   for _, t in pairs( lists ) do
      if t then
         chars:extend(t)
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
   local minDist = getDistance( self.owner:getPose():getPos(), chars[index]:getPose():getPos() )
   local found   = false

   for key, value in pairs(chars) do
      local dist = getDistance( self.owner:getPose():getPos(), value:getPose():getPos() )
      if checkPointInSector(self.owner:getCamera():getPose():getPos(), self.owner:getDir(), value:getPose():getPos(), 40, maxDist) then
         if (dist <= minDist) then
            minDist = dist
            index   = key
            found   = true
         end
      end
   end

   if ( not found ) then
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
   local character = getClosestObjectInView( self.owner, self.enemies, self.owner.parameters.viewAngle )

   if ( not character ) then
      character = getClosestObjectInView( self.owner, self.friends, self.owner.parameters.viewAngle )

      if ( not character ) then
         character = getClosestObjectInView( self.owner, self.neutrals, self.owner.parameters.viewAngle )
      end
   end

   return character
end

function CSenseScheduler:getClosestCorpse()
   local result = getClosestObjectInView( self.owner, self.corpses or {}, self.owner.parameters.viewAngle )
   if result and result.getVisible and result:getVisible() then
      return result
   end
   return nil
end

-- Checks

function CSenseScheduler:checkTargetObjDist()
   return objInDist( self.owner:getPose():getPos(), self:getTargetObj():getPose():getPos(), self.targetObjDist )
end

function CSenseScheduler:checkZone()
   return objInDist( self.owner:getPose():getPos(), self:getCurZone(), self.owner.parameters.zoneSize )
end

function CSenseScheduler:checkClose()
   if (not self:getSense("enemyDetect")) then
      return false
   end
   local obj = self:getCurEnemy()
   if ( not obj ) then
      return false
   end
   return objInDist( self.owner:getPose():getPos(), obj:getPose():getPos(), self.owner.parameters.attackDist )
end

function CSenseScheduler:checkWarn()
   if (not self:getSense("enemyDetect")) then
      return false
   end
   local obj = self:getCurEnemy()
   if ( not obj ) then
      return false
   end
   return objInDist( self.owner:getPose():getPos(), obj:getPose():getPos(), self.owner.parameters.warnDist )
end

function CSenseScheduler:checkCloseAtZone()
   if (not self:getSense("enemyDetect")) then
      return false
   end
   local obj = self:getCurEnemy()
   if ( not obj ) then
      return false
   end

   return objInDist( obj:getPose():getPos(), self:getCurZone(), self.owner.parameters.zoneSize ) and self:checkClose()
end

function CSenseScheduler:checkFront()
   if (not self:getSense("enemyDetect")) then
      return false
   end

   local obj = self:getCurEnemy()

   if ( not obj ) then
      return false
   end

   return checkPointInSector(self.owner:getPose():getPos(), self.owner:getDir(), obj:getPose():getPos(), self.owner.parameters.attackAngle, 10000)
end

function CSenseScheduler:checkDetect()
   local obj = self:getCurEnemy()
   if ( not obj ) then
      return false
   end

   local charPos      = self.owner:getPose():getPos()
   local objPos       = obj:getPose():getPos()
   local dist         = self.owner.parameters.viewDist
   local backViewDist = self.owner.parameters.backViewDist
   local angle        = self.owner.parameters.viewAngle

   if ( not self:getSense("enemyDetect") ) then
      local isInView      = inSector ( self.owner, objPos, dist, angle )
      local isAtBackNoise = objInDist( charPos, objPos, backViewDist) and ( not obj:getStealth() )

      return ( isInView or isAtBackNoise or self.owner:getState("underAttack") )
   else
      return ( objInDist(charPos, objPos, dist) or self.owner:getState("underAttack") )
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

   local isInView      = inSector ( self.owner, objPos, dist, angle )
   local isAtBackNoise = objInDist( charPos, objPos, backViewDist)

   return isInView or isAtBackNoise
end

function CSenseScheduler:checkDetectAtZone()
   local obj = self:getCurEnemy()
   if ( not obj ) then
      return false
   end

   return objInDist( obj:getPose():getPos(), self:getCurZone(), self.owner.parameters.zoneSize ) and self:checkDetect()
end

function CSenseScheduler:setHideoutsEnabled( value )
   self.hideoutsEnabled = value
end

function CSenseScheduler:refreshRoles()
   local chars = {}

   for key in pairs(self.friends) do
      table.insert(chars, self.friends[key])
   end
   for key in pairs(self.enemies) do
      table.insert(chars, self.enemies[key])
   end
   for key in pairs(self.neutrals) do
      table.insert(chars, self.neutrals[key])
   end
   for key in pairs(self.ignores) do
      table.insert(chars, self.ignores[key])
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
