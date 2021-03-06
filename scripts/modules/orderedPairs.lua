--[[
Ordered table iterator, allow to iterate on the natural order of the keys of a
table.
]]

local _M = {}

local function cmp_multitype(op1, op2)
   local type1, type2 = type(op1), type(op2)
   if type1 ~= type2 then --cmp by type
      return type1 < type2
   elseif type1 == "number" and type2 == "number"
      or type1 == "string" and type2 == "string" then
      return op1 < op2 --comp by default
   elseif type1 == "boolean" and type2 == "boolean" then
      return op1 == true
   else
      return tostring(op1) < tostring(op2) --cmp by address
   end
end

local function __genOrderedIndex(t, cmp)
   local orderedIndex = {}
   for key in pairs(t) do
      table.insert(orderedIndex, key)
   end
   table.sort(orderedIndex, cmp)
   return orderedIndex
end

local function nextMaker(mixed)
   return function (t, state)
      -- Equivalent of the next function, but returns the keys in the alphabetic
      -- order. We use a temporary ordered key table that is stored in the
      -- table being iterated.

      local key = nil
      --print("orderedNext: state = "..tostring(state))
      if state == nil then
         -- the first time, generate the index
         t.__orderedIndex = __genOrderedIndex(t, mixed and cmp_multitype)
         key = t.__orderedIndex[1]
      else
         -- fetch the next value
         for i = 1,#t.__orderedIndex do
            if t.__orderedIndex[i] == state then
               key = t.__orderedIndex[i+1]
            end
         end
      end

      if key then
         return key, t[key]
      end

      -- no more value to return, cleanup
      t.__orderedIndex = nil
      return
   end
end

function _M.orderedPairs(t)
   -- Equivalent of the pairs() function on tables. Allows to iterate
   -- in order
   return nextMaker(), t, nil
end

function _M.orderedMixedPairs(t)
   -- Equivalent of the pairs() function on tables. Allows to iterate
   -- in order. Works on mixed index and key-value tables.
   return nextMaker(true), t, nil
end

return _M
