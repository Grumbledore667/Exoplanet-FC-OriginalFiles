local oo = require "loop.simple"
local CSceneBase = require "scenes.sceneBase".CScene
local deb = require "global.debug"
local runner = require "testRunner"

local CSceneTestRunner = oo.class({}, CSceneBase)

function CSceneTestRunner:OnLocationEnter()
   CSceneBase.OnLocationEnter(self)
   deb.setDebugMode("all", false)
   setGameSpeed(100)
   runner("debug")
end

return {CSceneTestRunner=CSceneTestRunner}
