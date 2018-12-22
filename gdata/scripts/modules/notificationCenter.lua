local oo = require "loop.simple"

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
      if (tableSize(self.notifications) == 0) then
         return false
      else
         return true
      end
   else
      return self.notifications[notification]
   end
end

function CNotificationCenter:postNotification(notification)
   self.notifications[notification] = true
   --log("CNotificationCenter::" .. tostring(notification))
end

function CNotificationCenter:removeNotifications()
   --log( "CNotificationCenter:removeNotifications" )
   self.notifications = {}
end

return {CNotificationCenter=CNotificationCenter}
