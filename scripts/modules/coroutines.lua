local _M = {}

local CCoroutineManager   = require "coroutines.manager"
local CBTCoroutineManager = require "coroutines.behaviorTreeManager"

_M.handlers = require "coroutines.handlers"
_M.helpers  = require "coroutines.helpers"

local defaultMgr = CCoroutineManager("defaultManager")

function _M.getDefaultManager()
   return defaultMgr
end

_M.CCoroutineManager      = CCoroutineManager
_M.CBTCoroutineManager    = CBTCoroutineManager

return _M
