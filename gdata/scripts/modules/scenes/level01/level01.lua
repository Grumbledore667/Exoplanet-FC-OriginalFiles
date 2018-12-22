local oo = require "loop.simple"
local CScene = (require "scenes.sceneBase").CScene

local scenes = {}

scenes.CLevel01 = oo.class({}, CScene)

scenes.COldFriendBug = oo.class({}, CScene)
function scenes.COldFriendBug:OnLocationEnter()
   CScene.OnLocationEnter(self)
   runTimer(1, nil, function()
      gameplayUI.waiting.rates.sky = 1.02
      cbWaitAfternoon()
      runTimer(1, nil, function()
         cbWaitAfternoon()
      end, false)
   end, false)
end

return scenes
