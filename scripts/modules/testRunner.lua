local test = require "gambiarra"
local coro = require "coroutines.helpers"

local function ichain(...)
   local args = table.pack(...)
   return coroutine.wrap(function()
      local i = 1
      for n = 1, args.n do
         for _, v in ipairs(args[n]) do
            coroutine.yield(i, v)
            i = i + 1
         end
      end
   end)
end

local tests
local function runner(choice)
   tests = require "tests"
   local set
   local timed
   if not choice or choice == "minimal" then
      set = {tests.root}
   elseif choice == "debug" then
      set = {tests.root, tests.debugbuild}
   elseif choice == "all" then
      set = {tests.root, tests.debugbuild}
      timed = true
   end
   runTimerCo(function()
      for _, testChunk in ichain(unpack(set)) do
         coro.wait(0)
         pcall(testChunk)
      end
      test("finisher", function(next)
         setGameSpeed(1)
         next()
      end, true)
      if timed then
         for _, testChunk in ipairs(tests.timed) do
            coro.wait(0)
            pcall(testChunk)
         end
      end
   end)
end

return runner
