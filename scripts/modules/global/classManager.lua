local classManager = {}
--local string = require "string"
local classTable = {}
local objTable = {}
local objByClassesTable = {}

function classManager.loadScriptClass(className, scriptName)
   --TPrint(string.format("INFO: Loading class %s from module %s\n", className, scriptName))
   classTable[className] = require(scriptName)[className]
   objByClassesTable[className] = {}
end

--must return created object
function classManager.createScriptClass(objectName, className)
   --TPrint(string.format("INFO: Creating object %s with class %s\n", objectName, className))
   if not classTable[className] then
      return nil
   end

   local obj = classTable[className]()

   if objectName == "__glob__scene" then
      _G["__glob__scene"] = obj
   elseif objectName ~= "__glob__tmp_obj" then
      objTable[objectName] = obj
      table.insert(objByClassesTable[className], obj)
   end
   return obj
end

function classManager.registerObjectName(name, obj)
   objTable[name] = obj
end

function classManager.getClass(name)
   return classTable[name]
end

function classManager.getAllByClassName(className)
   return objByClassesTable[className]
end

function classManager.getAllByClassNameWithin(className, position, radius)
   local t = {}
   for _,obj in pairs(objByClassesTable[className]) do
      if obj.getPose and objInDist(position, obj:getPose():getPos(), radius) then
         table.insert(t, obj)
      end
   end
   return t
end

classManager.classTable = classTable
classManager.objTable = objTable
classManager.objByClassesTable = objByClassesTable

return classManager
