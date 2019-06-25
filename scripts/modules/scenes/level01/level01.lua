local oo = require "loop.simple"
local CScene = (require "scenes.sceneBase").CScene

local scenes = {}

scenes.CLevel01 = oo.class({}, CScene)

return scenes
