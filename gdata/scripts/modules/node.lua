local oo = require "loop.simple"

local members =
   {
      predicate = nil,
      positive = nil,
      negative = nil,
   }

local CNode = oo.class(members)

function CNode:yes(func)
   if (not self.positive) then
      self.positive = {}
   end
   return self:node(self.positive, func)
end

function CNode:no(func)
   if (not self.negative) then
      self.negative = {}
   end
   return self:node(self.negative, func)
end

function CNode:node(tab, func)
   for key, value in pairs(tab) do
      if (value.predicate == func) then
         return value
      end
   end
   local node = CNode{predicate = func }
   table.insert(tab, node)
   return node
end

function CNode:searchAction(scheduler)
   if (type(self.predicate) == "table") then
      scheduler:setAction(self.predicate)
      return
   end
   if (self.predicate == nil) then
      self.predicate = self.rootPredicate
   end
   if (self.predicate(scheduler.owner)) then
      if (self.positive) then
         for key, value in pairs(self.positive) do
            value:searchAction(scheduler)
         end
      end
   else
      if (self.negative) then
         for key, value in pairs(self.negative) do
            value:searchAction(scheduler)
         end
      end
   end
end

function CNode:rootPredicate()
   return true
end

return {CNode=CNode}
