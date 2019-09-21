do local quest = {
   description = "",
   group_indices = {},
   hidden = true,
   logs = {
      CheckRoom = "Eli suggested I should check Barnabas' room. It might contain something useful.",
      CodeWrong = "The code from Barnabas' note isn't working. Gotta talk to Eli, there must be something else.",
      DoorOpened = "I've managed to open the locked door to a special store room. I should take a look inside while I have the opportunity.",
      Finish = "What a bummer. Instead of treasures and military grade weapons the closed room contained rows of cupboards packed full of new clothes and various items for everyday use. Nevertheless, Eli has assured me that these items are of a crucial importance for the Fort. He promised to tell captain Castor all the best about me as well as to give me a good discount on his wares.",
      Finish2 = "I managed to get inside beforehand. But instead of treasures and military grade weapons the closed room contained rows of cupboards packed full of new clothes and various items for everyday use. Nevertheless, Eli has assured me that these items are of a crucial importance for the Fort. He promised to tell captain Castor all the best about me as well as to give me a good discount on his wares.",
      ReadCipher = "In Barnabas' room I've found a book about ciphers. Some of the paragraphs were marked. The former warehouse manager was probably using a cipher to encrypt the notes containing the code. It isn't very likely that he used a complex cipher, as he had some issues with remembering even a simple 4-digit number, so he must have used the simple one which suggests to take the actual code, add 1 to each digit and write down the result on the note.",
      ReadNote = "I used an RC chipped bug to get out of the closed room Barnabas' diary with numbers 9731 in it. I should try it on the door.",
      description = "Eli the warehouse keeper in the Fort is very interested in opening a closed door with a keypad lock that is blocking a storage room with 'special' supplies. The way he puts it, the supplies in this room are crucial to people garrisoned in the Fort. Eli's predecessor, of whom Eli is, to put it mildly, is of an extremely low opinion - someone that goes by the name Barnabas, left the Fort without notifying anyone as to how to open the door to the special storage room. Eli believes that I should try and find another way into the room. I should also search Barnabas' room, maybe it has some notes regarding the code. To find his room I should exit the storehouse through the main exit, turn immediately right and go down the ramp. At the bottom of the ramp if I look up I would be staring directly at the corner of Barnabas' room.\
\
Hm, a closed 'special' section of the storehouse? Count me in!",
      description_opened = "Eli the warehouse keeper in the Fort is very interested in opening a closed door with a keypad lock that is blocking a storage room with 'special' supplies. The way he puts it, the supplies in this room are crucial to people garrisoned in the Fort."
   },
   nodes = {
      decrease_eli_prices = {
         ID = 23,
         class = "CNodeNew",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 5,
               toSlot = 1
            }
         },
         name = "decrease_eli_prices",
         posX = 2190,
         posY = 270,
         script = "function node:onExecute()\
   setGlobalParam(\"eli_buyFromVendorMul\", 0.8)\
end"
      },
      finish = {
         ID = 5,
         class = "CNodeFinish",
         connectionsID = {},
         name = "finish",
         posX = 2430,
         posY = 270,
         script = ""
      },
      hide_offer = {
         ID = 29,
         class = "CHideTopic",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 25,
               toSlot = 1
            }
         },
         name = "hide_offer",
         posX = 1500,
         posY = 390,
         script = "",
         topics = {
            "offer"
         }
      },
      hide_start = {
         ID = 30,
         class = "CHideTopic",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 24,
               toSlot = 1
            }
         },
         name = "hide_start",
         posX = 1080,
         posY = 390,
         script = "",
         topics = {
            "start"
         }
      },
      log_alt_description = {
         ID = 25,
         class = "CLogDescription",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 27,
               toSlot = 1
            }
         },
         log = "description_opened",
         name = "log_alt_description",
         posX = 1710,
         posY = 390,
         script = ""
      },
      log_finish = {
         ID = 22,
         class = "CLogSuccess",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 11,
               toSlot = 1
            }
         },
         log = "Finish",
         name = "log_finish",
         posX = 1320,
         posY = 210,
         script = ""
      },
      log_finish2 = {
         ID = 28,
         class = "CLogSuccess",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 11,
               toSlot = 1
            }
         },
         log = "Finish2",
         name = "log_finish2",
         posX = 2130,
         posY = 390,
         script = ""
      },
      opened_before = {
         ID = 24,
         class = "CDiscuss",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 29,
               toSlot = 1
            }
         },
         name = "opened_before",
         posX = 1290,
         posY = 390,
         script = "",
         topic = "eli_already_opened",
         unhideTopic = false
      },
      received_quest = {
         ID = 26,
         class = "CFork",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 10,
               toSlot = 1
            },
            {
               fromSlot = 2,
               toID = 30,
               toSlot = 1
            }
         },
         h = 90,
         name = "received_quest",
         posX = 870,
         posY = 270,
         script = "function node:onCheck()\
   return self:getParam(\"received_quest\")\
end",
         w = 160
      },
      reward_xp = {
         ID = 11,
         class = "CRewardExp",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 23,
               toSlot = 1
            }
         },
         experience = 1600,
         name = "reward_xp",
         posX = 1950,
         posY = 270,
         script = ""
      },
      start = {
         ID = 4,
         class = "CNodeStart",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 21,
               toSlot = 1
            }
         },
         name = "start",
         posX = 360,
         posY = 270,
         script = ""
      },
      topic_finish = {
         ID = 10,
         class = "CDiscuss",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 22,
               toSlot = 1
            }
         },
         name = "topic_finish",
         posX = 1080,
         posY = 210,
         script = "",
         topic = "finish",
         unhideTopic = false
      },
      topic_finish2 = {
         ID = 27,
         class = "CDiscuss",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 28,
               toSlot = 1
            }
         },
         name = "topic_finish2",
         posX = 1920,
         posY = 390,
         script = "",
         topic = "finish",
         unhideTopic = false
      },
      until_opened = {
         ID = 21,
         class = "CPhase",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 26,
               toSlot = 1
            }
         },
         name = "until_opened",
         nodes = {
            briefing = {
               ID = 4,
               class = "CDiscuss",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 7,
                     toSlot = 1
                  }
               },
               name = "briefing",
               posX = 690,
               posY = 480,
               script = "",
               topic = "start",
               unhideTopic = false
            },
            door_unlocked = {
               ID = 17,
               class = "CNodeFinish",
               connectionsID = {},
               name = "door_unlocked",
               posX = 2400,
               posY = 480,
               script = ""
            },
            enable_crates = {
               ID = 15,
               class = "CNodeNew",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 17,
                     toSlot = 1
                  }
               },
               name = "enable_crates",
               posX = 1500,
               posY = 720,
               script = "function node:onExecute()\
   enableObject(vars.crate1)\
   enableObject(vars.crate2)\
   enableObject(vars.crate3)\
   enableObject(vars.crate4)\
end"
            },
            hide_offer = {
               ID = 20,
               class = "CHideTopic",
               connectionsID = {},
               name = "hide_offer",
               posX = 1110,
               posY = 570,
               script = "",
               topics = {
                  "offer"
               }
            },
            log_check_room = {
               ID = 1,
               class = "CLogEntry",
               connectionsID = {},
               log = "CheckRoom",
               name = "log_check_room",
               posX = 2130,
               posY = 300,
               script = ""
            },
            log_code_wrong = {
               ID = 8,
               class = "CLogEntry",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 0,
                     toSlot = 1
                  }
               },
               log = "CodeWrong",
               name = "log_code_wrong",
               posX = 1710,
               posY = 300,
               script = ""
            },
            log_description = {
               ID = 7,
               class = "CLogDescription",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 6,
                     toSlot = 1
                  },
                  {
                     fromSlot = 1,
                     toID = 13,
                     toSlot = 1
                  },
                  {
                     fromSlot = 1,
                     toID = 19,
                     toSlot = 1
                  },
                  {
                     fromSlot = 1,
                     toID = 20,
                     toSlot = 1
                  }
               },
               log = "description",
               name = "log_description",
               posX = 900,
               posY = 480,
               script = ""
            },
            log_read_cipher = {
               ID = 3,
               class = "CLogEntry",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 12,
                     toSlot = 1
                  }
               },
               log = "ReadCipher",
               name = "log_read_cipher",
               posX = 1290,
               posY = 180,
               script = ""
            },
            log_read_note = {
               ID = 14,
               class = "CLogEntry",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 16,
                     toSlot = 1
                  }
               },
               log = "ReadNote",
               name = "log_read_note",
               posX = 1290,
               posY = 300,
               script = ""
            },
            node_07 = {
               ID = 10,
               class = "CHideTopic",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 9,
                     toSlot = 1
                  }
               },
               name = "node_07",
               posX = 1080,
               posY = 720,
               script = "",
               topics = {
                  "code_wrong",
                  "read_cipher"
               }
            },
            node_08 = {
               ID = 9,
               class = "CShowTopic",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 15,
                     toSlot = 1
                  }
               },
               name = "node_08",
               posX = 1290,
               posY = 720,
               script = "",
               topics = {
                  "eli_already_opened",
                  "finish"
               }
            },
            set_received_flag = {
               ID = 19,
               class = "CNodeNew",
               connectionsID = {},
               name = "set_received_flag",
               posX = 1110,
               posY = 480,
               script = "function node:onExecute()\
   self:setParam(\"received_quest\", true)\
end"
            },
            show_read_cipher = {
               ID = 12,
               class = "CShowTopic",
               connectionsID = {},
               name = "show_read_cipher",
               posX = 1500,
               posY = 180,
               script = "",
               topics = {
                  "read_cipher"
               }
            },
            start = {
               ID = 2,
               class = "CNodeStart",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 4,
                     toSlot = 1
                  },
                  {
                     fromSlot = 1,
                     toID = 5,
                     toSlot = 1
                  }
               },
               name = "start",
               posX = 450,
               posY = 480,
               script = ""
            },
            topic_code_wrong = {
               ID = 0,
               class = "CDiscuss",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 1,
                     toSlot = 1
                  }
               },
               name = "topic_code_wrong",
               posX = 1920,
               posY = 300,
               script = "",
               topic = "code_wrong",
               unhideTopic = true
            },
            wait_code_denied = {
               ID = 16,
               class = "CNodeEvent",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 8,
                     toSlot = 1
                  }
               },
               event = "code_denied",
               name = "wait_code_denied",
               posX = 1500,
               posY = 300,
               script = "function node:onCheck(eventName, targetName, code)\
   return targetName == vars.lock and code == vars.cipher\
end"
            },
            wait_read_cipher = {
               ID = 6,
               class = "CNodeEvent",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 3,
                     toSlot = 1
                  }
               },
               event = "read",
               name = "wait_read_cipher",
               posX = 1080,
               posY = 180,
               script = "function node:onCheck(eventName, targetName, targetObj)\
   return targetName == \"barnabas_cipher.itm\"\
end"
            },
            wait_read_code = {
               ID = 13,
               class = "CNodeEvent",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 14,
                     toSlot = 1
                  }
               },
               event = "read",
               name = "wait_read_code",
               posX = 1080,
               posY = 300,
               script = "function node:onCheck(eventName, targetName, targetObj)\
   return targetName == \"barnabas_code.itm\"\
end"
            },
            wait_unlock_door = {
               ID = 5,
               class = "CNodeEvent",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 10,
                     toSlot = 1
                  }
               },
               event = "code_accepted",
               name = "wait_unlock_door",
               posX = 870,
               posY = 720,
               script = "function node:onCheck(eventName, targetName, targetObj)\
   return targetName == vars.lock\
end"
            }
         },
         posX = 630,
         posY = 270,
         script = ""
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
function Quest:getTopicVisible_offer()\
   return getGlobalParam(\"helping_hands_finished\")\
end",
   title = "Open Sesame",
   topics = {
      {
         log_id = "",
         name = "start",
         single_use = true,
         visible = true
      },
      {
         log_id = "",
         name = "finish",
         single_use = true,
         visible = false
      },
      {
         log_id = "",
         name = "code_wrong",
         single_use = true,
         visible = false
      },
      {
         log_id = "",
         name = "read_cipher",
         single_use = true,
         visible = false
      },
      {
         log_id = "",
         name = "eli_already_opened",
         single_use = true,
         visible = false
      },
      {
         log_id = "",
         name = "offer",
         single_use = false,
         visible = true
      }
   },
   variables = {
      {
         icon = " ",
         kind = "object",
         name = "lock",
         value = "q_open_sesame_lock"
      },
      {
         icon = " ",
         kind = "object",
         name = "crate1",
         value = "q_open_sesame_crate_1"
      },
      {
         icon = " ",
         kind = "object",
         name = "crate2",
         value = "q_open_sesame_crate_2"
      },
      {
         icon = " ",
         kind = "object",
         name = "crate3",
         value = "q_open_sesame_crate_3"
      },
      {
         icon = " ",
         kind = "object",
         name = "crate4",
         value = "q_open_sesame_crate_4"
      },
      {
         icon = " ",
         kind = "string",
         name = "cipher",
         value = "9731"
      }
   }
}
return quest
end