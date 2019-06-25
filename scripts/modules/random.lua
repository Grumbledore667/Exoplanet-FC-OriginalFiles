local rng = require "rng"
local tablex = require "pl.tablex"

local defaultSeed = rng()
defaultSeed:setseed(os.time())

local _M = {}
--TODO: copy docs from stdlib with overload
function _M.random(m, n)
   if m == nil and n == nil then
      return defaultSeed:next()
   elseif n == nil then
      assert(1 <= m, "interval is empty")
      return math.floor(defaultSeed:next() * m) + 1
   else
      assert(m <= n, "interval is empty")
      return math.floor(defaultSeed:next() * (n - m + 1)) + m
   end
end


---@generic T : any
---@param list T[]
---@return T
function _M.choice(list)
   return list[_M.random(#list)]
end

function _M.shuffle(t)
   local res = {}
   if #t > 0 then
      local copy = tablex.copy(t)
      repeat
         local i = _M.random(#copy)
         table.insert(res, table.remove(copy, i))
      until #copy == 0
   end
   return res
end

--- Infinite shuffled list iterator.
--- Generates a function that when called returns the next element of
--- a shuffled version of the list-like sequence. Upon reaching the shuffled sequence's
--- end the sequence is reshuffled. Elements do not repeat unless sequence is
--- too short or has dupe elements.
---@param seq table
---@return function
function _M.shuffledSequenceGenerator(seq)
   local i, last
   seq = _M.shuffle(seq)
   i = 1
   return function ()
      if i < #seq then
         i = i + 1
      else
         i = 1
         seq = _M.shuffle(seq)
         if seq[1] == last and #seq > 2 then
            i = 2
         end
      end
      last = seq[i]
      return last
   end
end

-- get random number using normal (gaussian distribution)
-- supports all math.random modes
--TODO: type and param info with overloads
function _M.normal(...)
   local accu = 0
   for _=1,3 do
      accu = accu + _M.random(...)
   end
   return accu / 3
end

return _M
