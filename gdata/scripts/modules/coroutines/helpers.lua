local handlers = require "coroutines.handlers"

local helpers = {}

function helpers.event(eventString)
   return handlers.CStringEventHandler(eventString)
end

function helpers.nextTick()
   return helpers.event("BehaviorTreeTick")
end

function helpers.charEvent(char, eventName)
   return handlers.CCharacterEventHandler(char.eventManager, eventName)
end

function helpers.triggerIn(trigger)
   return handlers.CTriggerEventHandler("OnTriggerEnter", trigger)
end

function helpers.triggerOut(trigger)
   return handlers.CTriggerEventHandler("OnTriggerLeave", trigger)
end

function helpers.timer(seconds)
   return handlers.CTimerEventHandler(seconds)
end

function helpers.questEvent(event_name, target_name, target_obj)
   return handlers.CQuestEventHandler(event_name, target_name, target_obj)
end

function helpers.animationEnd(char, animation)
   return handlers.CAnimationEventHandler(char.animationsManager, animation, nil, "onAnimationStop")
end

function helpers.animationEventIn(char, animation, event)
   return handlers.CAnimationEventHandler(char.animationsManager, animation, event, "onAnimationEventIn")
end

function helpers.animationEventOut(char, animation, event)
   return handlers.CAnimationEventHandler(char.animationsManager, animation, event, "onAnimationEventOut")
end

function helpers.waitNextTick()
   return coroutine.yield(helpers.nextTick())
end

function helpers.waitEvent(eventString)
   return coroutine.yield(helpers.event(eventString))
end

---@param char CCharacter
function helpers.waitTriggerIn(char, trigger)
   if char:isInTrigger(trigger) then
      return
   else
      return coroutine.yield(helpers.triggerIn(trigger))
   end
end

function helpers.waitTriggerOut(char, trigger)
   return coroutine.yield(helpers.triggerOut(trigger))
end

function helpers.wait(seconds)
   return coroutine.yield(helpers.timer(seconds))
end

function helpers.waitQuestEvent(event_name, target_name, target_obj)
   return coroutine.yield(helpers.questEvent(event_name, target_name, target_obj))
end

function helpers.waitAnimationEnd(char, animation)
   return coroutine.yield(helpers.animationEnd(char, animation))
end

function helpers.waitAnimationEventIn(char, animation, event)
   return coroutine.yield(helpers.animationEventIn(char, animation, event))
end

function helpers.waitAnimationEventOut(char, animation, event)
   return coroutine.yield(helpers.animationEventOut(char, animation, event))
end

function helpers.waitCharacterEvent(char, eventName)
   return coroutine.yield(helpers.charEvent(char, eventName))
end

function helpers.waitAny(...)
   local handler = handlers.CSelectorEventHandler(...)
   return coroutine.yield(handler)
end

return helpers
