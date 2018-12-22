local eventHandlers = {}

eventHandlers.CEventHandler          = require "coroutines.handlers.base"
eventHandlers.CTimerEventHandler     = require "coroutines.handlers.timer"
eventHandlers.CQuestEventHandler     = require "coroutines.handlers.quest"
eventHandlers.CAnimationEventHandler = require "coroutines.handlers.animation"
eventHandlers.CTriggerEventHandler   = require "coroutines.handlers.trigger"
eventHandlers.CStringEventHandler    = require "coroutines.handlers.string"
eventHandlers.CCharacterEventHandler = require "coroutines.handlers.character"
eventHandlers.CSelectorEventHandler  = require "coroutines.handlers.selector"

return eventHandlers
