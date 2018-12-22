local f = require "fun"
require "pl.compat"

local helpers = {}

function helpers.assureLog()
   -- if running outside of simulation
   if not _G.log then
      if not _G.TPrint then
         -- TPrint doesn't auto append new lines '\n'
         _G.TPrint = function(str)
            io.stdout:write(str)
         end
      end
      _G.log = (require "global.debug").log
   end
end

-- returns a spy object that checks with which arguments the log was called,
-- and a function that restores _G.log to a previous value
function helpers.spylogReplace(spy)
   local _log = _G.log
   local spylog = spy(function () end)
   _G.log = spylog
   return spylog, function () _G.log = _log end
end

-- provide custom log functions to circumvent global log replacer above
function helpers.getEventsHandlerSimpleLogger(logger)
   return function(event, testname, assertmsg)
      if event == 'pass' then        -- assertion passed
         logger(string.format("OK: %s: %s", testname, assertmsg))
      elseif event == 'fail' then    -- assertion failed
         logger(string.format("FAIL: %s: %s", testname, assertmsg))
      elseif event == 'except' then  -- exception happened
         logger(string.format("ERROR: %s: %s", testname, assertmsg))
      elseif event == 'begin' then   -- new test started
      elseif event == 'end' then     -- test finished
      end
   end
end

local function errorHandler(...)
   return ...
end

function helpers.raises(fn)
   local ok, err
   if type(fn) == 'table' then
      local function dummy(fun, ...)
         return fun(...)
      end
      ok, err = xpcall(dummy, errorHandler)
   else
      ok, err = xpcall(fn, errorHandler)
   end
   return not ok
end

local coroutineManager = require "coroutines".getDefaultManager()
local test = require "gambiarra"

--TODO: use this corotest in all tests
function helpers.corotest(name, fn, async)
   local co = coroutineManager:createCoroutine(fn)
   test(name, function(next) coroutineManager:executeRoutine(co, next) end, async)
end

-- emulate built-in require function but contain loaded globals in a new table
-- the sandbox isn't perfect and doesn't prevent modules's own requires to
-- modify _G environment, but it's good enough for now
local function _sandboxedRequire(module)
   local path = package.searchpath(module, package.path)
   if not path then
      error(string.format("couldn't find module '%s'", module))
   end
   local env = setmetatable({}, {__index=_G})
   local chunk, err = loadfile(path, module)
   if not chunk then
      error(string.format("error loading module '%s': %s", module, err))
   end
   setfenv(chunk, env)
   chunk()
   return env
end

-- cache calls
helpers.sandboxedRequire = f.memoize(_sandboxedRequire)

return helpers
