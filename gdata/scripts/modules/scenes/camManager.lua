local oo = require "loop.simple"

local CCamManager = oo.class({
   m_scene  = nil,
   m_curCam = nil,
})


function CCamManager:init()
end


function CCamManager:setCurCam( cam )
   self.m_curCam = cam
end


function CCamManager:getCurCam()
   return self.m_curCam
end


function CCamManager:setCamPlayer()
   if ( not getPlayer() ) then
      return
   end

   self:setCam( getPlayer():getCamera() )
   getPlayer():setCameraHeight( getDefaultPlayerCameraHeight(), 0 )
end


function CCamManager:setCamByName(camName)
--local camId = getObjectId(camName)
--self:setCam(camId)
end


function CCamManager:setCam( cam )
   if ( self:getCurCam() == cam ) then
      return
   end

   if ( not getPlayer() ) then
      return
   end

   local playerCam = getPlayer():getCamera()

   if ( playerCam == cam ) then
      returnUserControl()
   else
      blockUserControl()
   end

   self:setCurCam( cam )
   activateCamera( cam )
end


function CCamManager:clonePlayerCam(cam)
   local playerCam = getPlayer():getCamera()
   self:cloneCam(cam, playerCam)
end


function CCamManager:cloneCam( destCam, srcCam )
   cloneCamParams( destCam, srcCam )
end

return {CCamManager=CCamManager}
