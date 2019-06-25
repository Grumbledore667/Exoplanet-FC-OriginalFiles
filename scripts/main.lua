TClear()
TPrint("Loading: main.lua\n")
TPrint(string.format("Lua version: %s\n", _VERSION))

math.randomseed(os.time())

kPathGlobalFunctions = "./gdata/scripts/modules/global/"
kPathGlobalDialogs   = "./gdata/scripts/dialogs/"
kPathGlobalQuests    = "./gdata/scripts/quests/"

-- defines table.pack for lua 5.1
require "pl.compat"
local f = require "fun"

TPrint("Loading: debug.lua\n")
local deb = require "global.debug"

deb.init()

_G.log          = deb.log
_G.clear        = deb.clear
_G.isDebug      = deb.isDebug
_G.setDebugMode = deb.setDebugMode
_G.getDebugMode = deb.getDebugMode
_G.versionStr   = deb.versionStr
_G.versionInt   = deb.versionInt
_G.saveDebug    = deb.saveDebug
_G.getLoadOption = deb.getLoadOption

TPrint(string.format("Build version:\n%s\n", deb.versionStr))
TPrint(string.format("versionInt: %d\n", deb.versionInt))

TPrint("Loading: persistentData.lua\n")
local pData = require "global.persistentData"

pData.init()

_G.addToPersistentTable  = pData.addToPersistentTable
_G.setPersistentTable    = pData.setPersistentTable
_G.getPersistentTable    = pData.getPersistentTable
_G.fetchPersistentTable  = pData.fetchPersistentTable
_G.commitPersistentTable = pData.commitPersistentTable

TPrint("Loading: keys.lua\n")
local keys    = require "global.keys"
keys.init()

_G.getButtonCode           = keys.getButtonCode
_G.getButton               = keys.getButton
_G.setButton               = keys.setButton
_G.getButtonDoubleTap     = keys.getButtonDoubleTap
_G.resetButtonsWaitDouble  = keys.resetButtonsWaitDouble
_G.getButtonCurrentKeyName = keys.getButtonCurrentKeyName

TPrint("Loading: gameOptions.lua\n")
local gameOptions = require "global.gameOptions"
gameOptions.init()

_G.setGameOption = gameOptions.setGameOption
_G.getGameOption = gameOptions.getGameOption
_G.getGameOptions = gameOptions.getGameOptions


TPrint("Loading: globalFunctions.lua\n")
dofile(kPathGlobalFunctions .. "globalFunctions.lua")

local coro = require "coroutines"
_G.runTimerCo = f.partial(coro.CCoroutineManager.runTimerCo, coro.getDefaultManager())

TPrint("Loading: constants.lua\n")
dofile(kPathGlobalFunctions .. "constants.lua")
