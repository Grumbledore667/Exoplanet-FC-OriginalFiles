local _M = {}

local CCoroutineManager   = require "coroutines.manager"

_M.handlers = require "coroutines.handlers"
_M.helpers  = require "coroutines.helpers"

local defaultMgr = CCoroutineManager("defaultManager")

function _M.getDefaultManager()
   return defaultMgr
end

_M.CCoroutineManager      = CCoroutineManager

return _M
