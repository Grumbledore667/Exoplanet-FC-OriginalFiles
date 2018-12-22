TClear()
TPrint("Loading: main.lua\n")
TPrint(string.format("Lua version: %s\n", _VERSION))

math.randomseed(os.clock())

kPathGlobalFunctions = "./gdata/scripts/modules/global/"
kPathGlobalDialogs   = "./gdata/scripts/dialogs/"
kPathGlobalQuests    = "./gdata/scripts/quests/"

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

TPrint("Loading: keys.lua\n")
local keys    = require "global.keys"
keys.init()

_G.setButtonCode           = keys.setButtonCode
_G.getButtonCode           = keys.getButtonCode
_G.getButton               = keys.getButton
_G.setButton               = keys.setButton
_G.getButtonWaitDouble     = keys.getButtonWaitDouble
_G.setButtonWaitDouble     = keys.setButtonWaitDouble
_G.resetButtonsWaitDouble  = keys.resetButtonsWaitDouble
_G.getKeysMap              = keys.getKeysMap
_G.saveKeysMap             = keys.saveKeysMap
_G.restoreDefaultKeys      = keys.restoreDefaultKeys
_G.getButtonCurrentKeyName = keys.getButtonCurrentKeyName

TPrint("Loading: gameOptions.lua\n")
local gameOptions = require "global.gameOptions"
gameOptions.init()

_G.setGameOption = gameOptions.setGameOption
_G.getGameOption = gameOptions.getGameOption
_G.getGameOptions = gameOptions.getGameOptions

TPrint("Loading: globalFunctions.lua\n")
dofile(kPathGlobalFunctions .. "globalFunctions.lua")

TPrint("Loading: constants.lua\n")
dofile(kPathGlobalFunctions .. "constants.lua")
