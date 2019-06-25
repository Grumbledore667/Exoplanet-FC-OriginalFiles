local oo = require "loop.base"
local tablex = require "pl.tablex"

-- allows subscribing to OnDestroy method call
---@class CDestroyable
local CDestroyable = oo.class()

function CDestroyable:OnCreate()
   self.onDestroyCallbacks = {}
end

function CDestroyable:OnDestroy()
   for _, callback in ipairs(tablex.copy(self.onDestroyCallbacks)) do
      callback.func(unpack(callback.args))
   end
end

function CDestroyable:subscribeOnDestroy(func, ...)
   local callback = {}
   callback.func = func
   callback.args = table.pack(...)
   table.insert(self.onDestroyCallbacks, callback)
   return callback
end

function CDestroyable:unsubscribeOnDestroy(callback)
   local index = tablex.find(self.onDestroyCallbacks, callback)
   if index then
      table.remove(self.onDestroyCallbacks, index)
   end
end

return CDestroyable
