local oo = require "loop.simple"

local tablex = require "pl.tablex"

local members =
{
   owner = nil,
   notifications = nil,
}

local CNotificationCenter = oo.class(members)

function CNotificationCenter:init()
   self.notifications = {}
end

function CNotificationCenter:notification(notification)
   if (not notification) then
      if (#self.notifications == 0) then
         return false
      else
         return true
      end
   else
      return tablex.filter(self.notifications, function(n) return notification == n.name end)
   end
end

function CNotificationCenter:postNotification(notification, data)
   table.insert(self.notifications, {name=notification, data=data})
end

function CNotificationCenter:iter()
   return ipairs(self.notifications)
end

function CNotificationCenter:purgeConsumedNotifications()
   self.notifications = tablex.filter(self.notifications, function(n)
      return not n.consumed
   end)
end

function CNotificationCenter:removeNotifications()
   --log( "CNotificationCenter:removeNotifications" )
   if #self.notifications > 0 then
      self.notifications = {}
   end
end

return {CNotificationCenter=CNotificationCenter}
