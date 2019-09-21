do local quest = {
   description = "",
   group_indices = {},
   hidden = true,
   logs = {
      description = "Eli the warehouse keeper in the Fort asked me to bring him a couple of aboriginal workers to help him take care of the mess that was left by the previous superintendant. To do that I need a permission of Master Phil which is most probably in the cemetery outside the Fort. I can reach it by exiting through the west gate and going along the path.",
      reward = "Eli was very satisfied with additional help and showed his appreciation with a pile of shinies.",
      talk_workers = "Master Phil gave his permission to borrow two of his idle workers in the Fort to help Eli.",
      talked_workers = "The workers should be there any minute now. I should tell Eli.",
      worker1 = "I've told one of the aborigine workers that he must go and help Eli. He assured me he'll go to the warehouse as soon as he finishes his bottle.",
      worker2 = "I've talked to an abori worker about helping Eli. He didn't seem too happy about it but said he'll be there soon."
   },
   nodes = {
      begin = {
         ID = 26,
         class = "CShowTopic",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 17,
               toSlot = 1
            }
         },
         name = "begin",
         posX = 60,
         posY = 330,
         script = "",
         topics = {
            "other_workers",
            "worker1",
            "worker2"
         }
      },
      both_workers = {
         ID = 22,
         class = "CNodeAnd",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 39,
               toSlot = 1
            }
         },
         inputSlots = 2,
         name = "both_workers",
         posX = 1260,
         posY = 240,
         script = ""
      },
      finish = {
         ID = 32,
         class = "CNodeFinish",
         connectionsID = {},
         name = "finish",
         posX = 3540,
         posY = 240,
         script = ""
      },
      finish_hide = {
         ID = 41,
         class = "CHideTopic",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 46,
               toSlot = 1
            }
         },
         name = "finish_hide",
         posX = 2490,
         posY = 240,
         script = "",
         topics = {
            "finish"
         }
      },
      firstlog = {
         ID = 35,
         class = "CLogDescription",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 26,
               toSlot = 1
            }
         },
         log = "description",
         name = "firstlog",
         posX = 90,
         posY = 240,
         script = ""
      },
      hide_t_workers = {
         ID = 27,
         class = "CHideTopic",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 36,
               toSlot = 1
            }
         },
         name = "hide_t_workers",
         posX = 390,
         posY = 240,
         script = "",
         topics = {
            "workers"
         }
      },
      log_reward = {
         ID = 42,
         class = "CLogSuccess",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 48,
               toSlot = 1
            }
         },
         log = "reward",
         name = "log_reward",
         posX = 3120,
         posY = 240,
         script = ""
      },
      log_worker1 = {
         ID = 37,
         class = "CLogEntry",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 22,
               toSlot = 1
            }
         },
         log = "worker1",
         name = "log_worker1",
         posX = 960,
         posY = 90,
         script = ""
      },
      log_worker2 = {
         ID = 38,
         class = "CLogEntry",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 22,
               toSlot = 2
            }
         },
         log = "worker2",
         name = "log_worker2",
         posX = 960,
         posY = 390,
         script = ""
      },
      on_the_way = {
         ID = 10,
         class = "CNodeNew",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 40,
               toSlot = 1
            }
         },
         name = "on_the_way",
         posX = 1860,
         posY = 240,
         script = "function node:onExecute()\
   teleportTo(getObj(vars.worker1), getObj(vars.worker1_wp))\
   teleportTo(getObj(vars.worker2), getObj(vars.worker2_wp))\
end\
"
      },
      reward_exp = {
         ID = 43,
         class = "CRewardExp",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 42,
               toSlot = 1
            }
         },
         experience = 1600,
         name = "reward_exp",
         posX = 2910,
         posY = 240,
         script = ""
      },
      reward_shinies = {
         ID = 46,
         class = "CRewardMoney",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 43,
               toSlot = 1
            }
         },
         name = "reward_shinies",
         posX = 2700,
         posY = 240,
         rewards = {
            {
               count = 200,
               name = "antigravium_shards.itm"
            }
         },
         script = ""
      },
      set_finished_global = {
         ID = 48,
         class = "CNodeNew",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 32,
               toSlot = 1
            }
         },
         name = "set_finished_global",
         posX = 3330,
         posY = 240,
         script = "function node:onExecute()\
   setGlobalParam(\"helping_hands_finished\", true)\
end"
      },
      show_phil_said = {
         ID = 28,
         class = "CShowTopic",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 18,
               toSlot = 1
            },
            {
               fromSlot = 1,
               toID = 19,
               toSlot = 1
            }
         },
         name = "show_phil_said",
         posX = 660,
         posY = 240,
         script = "",
         topics = {
            "worker1_phil_said",
            "worker2_phil_said"
         }
      },
      start = {
         ID = 31,
         class = "CNodeStart",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 16,
               toSlot = 1
            }
         },
         name = "start",
         posX = -150,
         posY = 270,
         script = ""
      },
      t_worker1_phil_said = {
         ID = 18,
         class = "CDiscuss",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 37,
               toSlot = 1
            }
         },
         name = "t_worker1_phil_said",
         posX = 990,
         posY = 0,
         script = "",
         topic = "worker1_phil_said",
         unhideTopic = false
      },
      t_worker2_phil_said = {
         ID = 19,
         class = "CDiscuss",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 38,
               toSlot = 1
            }
         },
         name = "t_worker2_phil_said",
         posX = 990,
         posY = 300,
         script = "",
         topic = "worker2_phil_said",
         unhideTopic = false
      },
      talk_workers = {
         ID = 36,
         class = "CLogEntry",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 28,
               toSlot = 1
            }
         },
         log = "talk_workers",
         name = "talk_workers",
         posX = 360,
         posY = 330,
         script = ""
      },
      talked_to_workers = {
         ID = 40,
         class = "CLogEntry",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 24,
               toSlot = 1
            }
         },
         log = "talked_workers",
         name = "talked_to_workers",
         posX = 2070,
         posY = 240,
         script = ""
      },
      talked_workers = {
         ID = 39,
         class = "CHideTopic",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 47,
               toSlot = 1
            }
         },
         name = "talked_workers",
         posX = 1440,
         posY = 240,
         script = "",
         topics = {
            "other_workers",
            "worker1",
            "worker2"
         }
      },
      topic_finish = {
         ID = 24,
         class = "CDiscuss",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 41,
               toSlot = 1
            }
         },
         name = "topic_finish",
         posX = 2280,
         posY = 240,
         script = "",
         topic = "finish",
         unhideTopic = true
      },
      topic_start = {
         ID = 16,
         class = "CDiscuss",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 35,
               toSlot = 1
            }
         },
         name = "topic_start",
         posX = 120,
         posY = 150,
         script = "",
         topic = "start",
         unhideTopic = false
      },
      topic_workers = {
         ID = 17,
         class = "CDiscuss",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 27,
               toSlot = 1
            }
         },
         name = "topic_workers",
         posX = 450,
         posY = 150,
         script = "",
         topic = "workers",
         unhideTopic = true
      },
      walked_away = {
         ID = 47,
         class = "CWaitTrigger",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 10,
               toSlot = 1
            }
         },
         event = "outside",
         name = "walked_away",
         objectName = "",
         objectType = "player",
         posX = 1650,
         posY = 240,
         script = "",
         triggerName = "q_helping_hands_worker_trigger"
      }
   },
   script = "function Quest:onCreate()\
end\
\
function Quest:onStart()\
end\
\
function Quest:onFinish()\
end\
\
",
   title = "Helping Hands",
   topics = {
      {
         log_id = "",
         name = "start",
         single_use = true,
         visible = true
      },
      {
         log_id = "",
         name = "workers",
         single_use = false,
         visible = false
      },
      {
         log_id = "",
         name = "other_workers",
         single_use = false,
         visible = false
      },
      {
         log_id = "",
         name = "worker1",
         single_use = false,
         visible = false
      },
      {
         log_id = "",
         name = "worker2",
         single_use = false,
         visible = false
      },
      {
         log_id = "",
         name = "worker1_phil_said",
         single_use = true,
         visible = false
      },
      {
         log_id = "",
         name = "worker2_phil_said",
         single_use = true,
         visible = false
      },
      {
         log_id = "",
         name = "finish",
         single_use = false,
         visible = false
      }
   },
   variables = {
      {
         icon = "",
         kind = "object",
         name = "worker1",
         value = "fort_worker_2"
      },
      {
         icon = "",
         kind = "object",
         name = "worker2",
         value = "fort_worker_3"
      },
      {
         icon = "",
         kind = "object",
         name = "worker_trigger",
         value = "q_helping_hands_worker_trigger"
      },
      {
         icon = "",
         kind = "object",
         name = "worker1_wp",
         value = "q_helping_hands_worker1_wp"
      },
      {
         icon = "",
         kind = "object",
         name = "worker2_wp",
         value = "q_helping_hands_worker2_wp"
      }
   }
}
return quest
end