local oo = require "loop.simple"

local CTextManager = oo.class(
   {
      m_scene = nil,
   }
)


function CTextManager:init()
end


function CTextManager:clear()
   self:setText("")
end

function CTextManager:setText(text)
   self.m_scene:setSubTitleText(text)
end

return {CTextManager=CTextManager}
