local store = require "persistence".store

local _M = {}
local cache = {}

local function getCleanSavename(path)
   return string.gsub(path, "^.*[\\/]", "")
end

function _M.saveGameState(path, state)
   log(string.format("INFO: saving %s", getCleanSavename(path)))
   -- ignore error return value as it is printed to the log by the engine anyway
   local status = pcall(store, path, state)
   if not status then
      log(string.format("ERROR: failed to save to %s", getCleanSavename(path)))
      return false
   end
   cache[path] = state
   return true
end

function _M.loadGameState(path)
   local state = cache[path]
   if state then
      return state
   end

   local chunk, errMsg = loadfile(path)
   if chunk then
      local env = {}
      setfenv(chunk, env) -- support for legacy saves that store GameState in _G

      local status
      status, state = pcall(chunk)
      if not status then
         log(string.format("ERROR: failed to load from %s", getCleanSavename(path)))
         return nil
      end
      state = state or env.GameState -- support for legacy saves that store GameState in _G
      cache[path] = state
      return state
   end
   log(string.format("ERROR: failed to load chunk with data from %s", getCleanSavename(path)))
   log(errMsg)
   return nil
end

function _M.getLocationName(path)
   local state = _M.loadGameState(path)
   if state then
      return state.LocationFile
   end
   return nil
end

function _M.getSavegameParam(filename, paramName)
   local state = _M.loadGameState(string.format("%s\\%s.sav", getSavegamesFolder(), filename))
   if state then
      return state[paramName]
   end
   return nil
end

return _M
