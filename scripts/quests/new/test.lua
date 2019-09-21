do local quest = {
   description = "",
   hidden = false,
   nodes = {
      finish = {
         ID = 1,
         class = "CNodeFinish",
         connectionsID = {},
         name = "finish",
         posX = 1050,
         posY = 270,
         script = ""
      },
      ["repeat"] = {
         ID = 4,
         class = "CNodeNew",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 2,
               toSlot = 1
            }
         },
         name = "repeat",
         posX = 420,
         posY = 390,
         script = "function node:onExecute()\
   log(\"no delay\")\
end\
\
---[[\
function node:evaluate(slot)\
   if not self.suspended then\
      self:suspend()\
      self.callback = runTimerAdv(0, false, function()\
         if self.callback then\
            self.callback:stop()\
            self.callback = nil\
         end\
         self:release()\
         if #self.connections > 0 then\
            self.parent:advanceSignal(unpack(self.connections))\
         end\
      end)\
   end\
end\
--]]"
      },
      reward = {
         ID = 3,
         class = "CRewardMoney",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 1,
               toSlot = 1
            }
         },
         name = "reward",
         posX = 840,
         posY = 210,
         rewards = {
            {
               count = 2000,
               name = "antigravium_shards.itm"
            }
         },
         script = ""
      },
      start = {
         ID = 0,
         class = "CNodeStart",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 2,
               toSlot = 1
            }
         },
         name = "start",
         posX = 360,
         posY = 270,
         script = ""
      },
      subphase = {
         ID = 2,
         class = "CPhase",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 3,
               toSlot = 1
            },
            {
               fromSlot = 2,
               toID = 4,
               toSlot = 1
            }
         },
         name = "subphase",
         nodes = {
            entered = {
               ID = 3,
               class = "CWaitTrigger",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 5,
                     toSlot = 1
                  },
                  {
                     fromSlot = 1,
                     toID = 4,
                     toSlot = 1
                  }
               },
               event = "inside",
               name = "entered",
               objectName = "",
               objectType = "player",
               posX = 690,
               posY = 330,
               script = "",
               triggerName = "t1"
            },
            entered_target = {
               ID = 5,
               class = "CWaitTrigger",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 2,
                     toSlot = 1
                  }
               },
               event = "inside",
               name = "entered_target",
               objectName = "",
               objectType = "player",
               posX = 1140,
               posY = 240,
               script = "",
               triggerName = "t2"
            },
            exited = {
               ID = 4,
               class = "CWaitTrigger",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 1,
                     toSlot = 1
                  }
               },
               event = "outside",
               name = "exited",
               objectName = "",
               objectType = "player",
               posX = 900,
               posY = 450,
               script = "",
               triggerName = "t1"
            },
            fail = {
               ID = 1,
               class = "CNodeFinish",
               connectionsID = {},
               name = "fail",
               posX = 1500,
               posY = 390,
               script = ""
            },
            substart = {
               ID = 0,
               class = "CNodeStart",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 3,
                     toSlot = 1
                  }
               },
               name = "substart",
               posX = 360,
               posY = 330,
               script = ""
            },
            success = {
               ID = 2,
               class = "CNodeFinish",
               connectionsID = {},
               name = "success",
               posX = 1500,
               posY = 270,
               script = ""
            }
         },
         posX = 600,
         posY = 240,
         script = ""
      }
   },
   script = "",
   title = ""
}
return quest
end