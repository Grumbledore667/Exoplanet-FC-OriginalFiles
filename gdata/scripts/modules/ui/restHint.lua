local oo = require "loop.simple"

local CBaseModule = require "ui.baseModule"

---@class CRestHintUI : CBaseModule
local CRestHintUI = oo.class({
   layoutName = "rest_hints.layout",
}, CBaseModule)

--Methods
function CRestHintUI:onShow()
   CBaseModule.onShow(self)

   local text = string.format("Press '%s' to leave camp          Press '%s' to skip time          Press '%s' to open inventory",
         getButtonCurrentKeyName("ACTIVATE"), getButtonCurrentKeyName("TIMESKIP"), getButtonCurrentKeyName("INVENTORY"))
   self.wnd:setText(text)
end

return CRestHintUI
