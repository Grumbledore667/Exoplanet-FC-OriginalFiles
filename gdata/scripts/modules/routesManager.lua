local oo = require "loop.simple"

local CRoutesManager = oo.class(
   {
      m_obj = nil,
      m_routes = nil,
      m_curRoute = nil,
   }
)


function CRouteManager:init()
   self.m_routes = {}
end


function CRouteManager:createRoute(routeName)
   self.m_routes.routeName  =
      {
         m_name = routeName,
         m_curWpn = nil,
         m_lastWpn = nil,
         m_wpn = {},
         m_wrap = false,
         m_visitedWpnCnt = 0,
         m_size = 0,
      }
end


function CRouteManager:addWpnToRoute(routeName, wpn)
   if not self.m_routes.routeName then
      self:createRoute(routeName)
   end
   table.insert(self.m_routes.routeName.m_wpn, wpn)
end


function CRouteManager:setRoute(routeName)
   if not self.m_routes.routeName then
      self.m_curRoute = nil
   else
      self.m_curRoute = self.m_routes.routeName
      local lastWpnI = table.getn(self.m_curRoute.m_wpn)
      local lastWpn = self.m_curRoute.m_wpn[lastWpnI]
      local curWpnI = 1
      local curWpn = self.m_curRoute.m_wpn[curWpnI]
      self.m_curRoute.m_visitedWpnCnt = 0;
      self:setCurWpn(curWpn)
      self:setLastWpn(lastWpn)
      self.m_curRoute.m_size = lastWpnI
      if self.m_obj:isInTrigger(curWpn) then
         self:onWpnEnter(curWpn)
      end
   end
end


function CRouteManager:setWrap(routeName, value)
   self.m_routes.routeName.m_wrap = value
end


function CRouteManager:getCurRoute()
   return self.m_curRoute
end


function CRouteManager:setLastWpn(wpn)
   local curRoute = self:getCurRoute()
   if not curRoute then
      return
   end
   curRoute.m_lastWpn = wpn
end


function CRouteManager:getLastWpn()
   local curRoute = self:getCurRoute()
   if not curRoute then
      return nil
   end
   return curRoute.m_lastWpn
end


function CRouteManager:setCurWpn(wpn)
   local curRoute = self:getCurRoute()
   if not curRoute then
      return
   end
   curRoute.m_curWpn = wpn
end


function CRouteManager:getCurWpn()
   local curRoute = self:getCurRoute()
   if not curRoute then
      return nil
   end
   return curRoute.m_curWpn
end


function CRouteManager:onWpnEnter(wpn)
   local curRoute = self:getCurRoute()
   if not curRoute then
      return false
   end
   local curWpn = self:getCurWpn()
   if curWpn ~= wpn then
      return false
   end
   if curRoute.m_visitedWpnCnt + 1 == curRoute.m_size then
      if curRoute.m_wrap then
         self.m_obj.onChangeWpn(self.m_obj)
         self:setRoute(curRoute.m_name)
      else
         self.m_obj.onRouteEnd(self.m_obj)
         self.m_curRoute = nil
      end
   else
      local nextWpn = curRoute.m_wpn[curRoute.m_visitedWpnCnt+2]
      curRoute.m_visitedWpnCnt = curRoute.m_visitedWpnCnt + 1;
      self:setCurWpn(nextWpn)
      self.m_obj.onChangeWpn(self.m_obj)
   end
   return true
end

return {CRoutesManager=CRoutesManager}
