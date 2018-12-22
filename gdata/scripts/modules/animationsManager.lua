local oo = require "loop.simple"

local members =
   {
      owner = nil,
      animationCallbacks = nil,
      currentAnimations = nil,
      animationsTree = {},
      isCharacter = nil,
   }

local CAnimationsManager = oo.class(members)

function CAnimationsManager:init()
   self.animationCallbacks = {}
   self.currentAnimations = {}
   if not self.animationsTree.finished then
      self:getAnimations()
   end
end

function CAnimationsManager:getAnimations()
   local animationsTree = {}
   local animals = getFolderElements("\\gdata\\characters\\animals\\*", true, false)
   local people = getFolderElements("\\gdata\\characters\\people\\*", true, false)
   local tech = getFolderElements("\\gdata\\characters\\tech\\*", true, false)

   local function addAnimations( prefabName )
      local animTable = {}
      if inList( animals, prefabName ) then
         animTable = getFolderElements("\\gdata\\characters\\animals\\" .. prefabName .. "\\*.caf", false, true)
      elseif inList( people, prefabName ) then
         animTable = getFolderElements("\\gdata\\characters\\people\\" .. prefabName .. "\\*.caf", false, true)
      elseif inList( tech, prefabName ) then
         animTable = getFolderElements("\\gdata\\characters\\tech\\" .. prefabName .. "\\*.caf", false, true)
      end
      local animations = {}
      for _, anim in pairs(animTable) do
         animations[anim:lower()] = true
      end
      self.animationsTree[prefabName] = animations
   end

   for _, prefabName in pairs(animals) do
      addAnimations( prefabName )
   end
   for _, prefabName in pairs(people) do
      addAnimations( prefabName )
   end
   for _, prefabName in pairs(tech) do
      addAnimations( prefabName )
   end
   self.animationsTree.finished = true
end

function CAnimationsManager:hasAnimationCheck( animation )
   local prefabName = self.owner:getPrefabName():gsub(".cfg", "")

   if not animation then
      log("WARNING: " .. self.owner:getName() .. "(" .. prefabName .. ")" .. " has tried to execute nil as animation")
      log(debug.traceback())
      return
   end

   animation = animation:lower()
   local t = getWords( animation )
   for _, anim in pairs(t) do
      if not self.animationsTree[prefabName][anim] then
         log("WARNING: " .. self.owner:getName() .. "(" .. prefabName .. ")" .. " has tried to execute non-existing animation '" .. anim .. "'")
      end
   end
end

function CAnimationsManager:OnAnimationStop(animation)
   --log( "OnAnimationStop: " .. animation )
   self.currentAnimations[animation] = nil
   self:performAnimationCallbacks(animation, nil, "onAnimationStop")
end

function CAnimationsManager:OnAnimationEventIn(animation, event)
   self:performAnimationCallbacks(animation, event, "onAnimationEventIn")
end

function CAnimationsManager:OnAnimationEventOut(animation, event)
   self:performAnimationCallbacks(animation, event, "onAnimationEventOut")
end

function CAnimationsManager:loopAnimation(animation)
   self:loopAnimationDelay( animation, 0.5 )
end

function CAnimationsManager:loopAnimationDelay(animation, delay)
   self:hasAnimationCheck( animation )
   self.owner:execAnimState(animation, delay)
end

function CAnimationsManager:playAnimation(animation, exclusively)
   self:hasAnimationCheck( animation )
   if (exclusively and (tableSize(self.currentAnimations) > 0)) then
      return
   end
   local animations = getWords(animation)
   if #animations == 1 then
      self.currentAnimations[animations[1]] = true
      self.owner:execAnimSingle(animations[1], false)
   elseif #animations == 2 then
      self.currentAnimations[animations[1]] = true
      self.owner:execAnimSingle(animations[1], false)

      self:subscribeAnimationEnd(animations[1], {["self"] = self, ["anim"] = animations[2]}, function (obj) obj.self.playAnimation(obj.self, obj.anim, false) end)
   end
end

function CAnimationsManager:playAnimationWithLock(animation)
   self:hasAnimationCheck( animation )
   self.currentAnimations[animation] = true
   self.owner:execAnimSingle(animation, true)
end

function CAnimationsManager:stopAnimation(animation)
   self:hasAnimationCheck( animation )
   self.owner:stopAnimState (animation)
   self.owner:stopAnimSingle(animation)
end

function CAnimationsManager:stopAnimations()
   for key in pairs(self.currentAnimations) do
      self:stopAnimation(key)
   end
   self.owner:stopAnimStates()
end

function CAnimationsManager:performAnimationCallbacks(animation, event, eventType)
   if self.owner and self.owner.eventManager then
      self.owner.eventManager:postNotification(eventType, {animation=animation, event=event})
   end
   if (not self.animationCallbacks[animation]) then
      return
   end
   for key, animationCallback in pairs(self.animationCallbacks[animation]) do
      if (((animationCallback.event == event) or (animationCallback.event == nil)) and (animationCallback.eventType == eventType)) then
         animationCallback.callback(animationCallback.target)
         self.owner.notificationCenter:postNotification(eventType)
      end
   end
   if (not event) then
      self.animationCallbacks[animation] = nil
   end
end

function CAnimationsManager:addAnimationCallback(animation, target, callback, event, eventType)
   if ((target == nil) or (callback == nil)) then
      log("CAnimationsManager::addAnimationCallback - invalid parameters")
      return
   end
   local animationCallback    = {}
   animationCallback.target   = target
   animationCallback.callback = callback
   animationCallback.event    = event
   if (not eventType) then
      animationCallback.eventType = "onAnimationStop"
   else
      animationCallback.eventType = eventType
   end

   local anims = getWords(animation)
   if #anims > 1 then
      animation = anims[#anims]
   end

   if (not self.animationCallbacks[animation]) then
      self.animationCallbacks[animation] = {}
   end
   table.insert(self.animationCallbacks[animation], animationCallback)
end

function CAnimationsManager:clearAllCallbacks()
   self.animationCallbacks = {}
end

function CAnimationsManager:clearCallbacks( animation )
   if animation then self.animationCallbacks[animation] = nil end
end

function CAnimationsManager:subscribeAnimationEnd(animation, object, callback)
   self:addAnimationCallback( animation, object, callback )
end

function CAnimationsManager:subscribeAnimationEventIn(animation, event, object, callback)
   self:addAnimationCallback( animation, object, callback, event, "onAnimationEventIn" )
end

function CAnimationsManager:subscribeAnimationEventOut(animation, event, object, callback)
   self:addAnimationCallback( animation, object, callback, event, "onAnimationEventOut" )
end

return {CAnimationsManager=CAnimationsManager}
