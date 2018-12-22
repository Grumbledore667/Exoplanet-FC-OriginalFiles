local oo = require "loop.simple"

local members =
{
    owner = nil,
    currentAction = nil,
    root = nil,
}

local CActionsScheduler = oo.class(members)

function CActionsScheduler:OnIdle()
    if (self.owner.notificationCenter:notification()) then
        if (not self.root) then
            return
        end
        self.root:searchAction(self)
        self.owner.notificationCenter:removeNotifications()
    end
end

function CActionsScheduler:setAction(action)
    if (self.currentAction == action) then
        if (not action.observers) then
            return
        end
        local exit = true
        for key in pairs(action.observers) do
            if (self.owner.notificationCenter:notification(key)) then
                exit = false
                break
            end
        end
        if (exit) then
            return
        end
    end
    if (self.currentAction) then
        self.currentAction.stop(self.owner)
    end
    self.currentAction = action
    self.currentAction.start(self.owner)
end

return {CActionsScheduler = CActionsScheduler}