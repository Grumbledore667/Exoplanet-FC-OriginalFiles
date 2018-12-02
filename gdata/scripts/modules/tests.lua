local path = require "pl.path"

local testsPath = "gdata\\scripts\\modules\\tests"

local function walk(rootPath)
   local function walker(path)
      local dirs = getFolderElements(path .. '\\*', true, false)
      local files = getFolderElements(path .. '\\*', false, true)
      coroutine.yield(path, dirs, files)
      for _, dir in ipairs(dirs) do
         walker(path .. '\\' .. dir)
      end
   end
   return coroutine.wrap(walker), rootPath
end

local tests = {}
for dirpath, dirs, files in walk('.\\' .. testsPath) do
   local dirName, baseName = path.splitpath(dirpath)
   local category
   if baseName == "tests" then
      category = "root"
   else
      category = baseName
   end
   tests[category] = {}

   for _, testFileName in ipairs(files) do
      if path.extension(testFileName) == ".lua" then
         local chunk, err = loadfile(path.join(dirpath, testFileName))
         if chunk then
            table.insert(tests[category], chunk)
         else
            log(string.format("ERROR loading test '%s':\n  %s", testFileName, err))
            log(debug.traceback())
         end
      end
   end
end

return tests
