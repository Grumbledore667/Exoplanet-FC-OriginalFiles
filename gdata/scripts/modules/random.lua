local rng

do
   require "pl.compat"

   -- bitness function is taken from here https://github.com/ignacio/bitness
   local cached

   local function bitness()
      if cached then
         return cached
      end

      local dump = string.dump(function()
      end)

      local size

      -- check signature
      if dump:sub(2, 4) == "Lua" then
         local version = dump:sub(5, 5):byte()

         if version == 0x51 or version == 0x52 then
            size = dump:sub(9, 9):byte()
         elseif version == 0x53 then
            size = dump:sub(14, 14):byte()
         else
            error("Unknown Lua version (" .. _VERSION .. ")")
         end
      elseif dump:sub(2, 3) == "LJ" then
         local ffi = require "ffi"
         size = (ffi.abi("32bit") and 4) or (ffi.abi("64bit") and 8)
      else
         error("Unknown Lua version")
      end

      cached = (size == 4 and 32) or
         (size == 8 and 64) or error("Unknown bitness")

      return cached
   end

   if bitness() == 32 then
      rng = require "rng"
   elseif bitness() == 64 then
      local path = package.searchpath("rng64", package.cpath)
      if path then
         rng = package.loadlib(path, "luaopen_rng")()
      end
   end
end

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
