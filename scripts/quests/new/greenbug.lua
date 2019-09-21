do local quest = {
   description = "Assistance of skillful hunters is required to track and capture a rare antigravium-imbued mutant bitebug.\
Reward: antigravium shards, 150 dead, 300 alive.",
   group_indices = {},
   hidden = true,
   logs = {
      BugAlive = "I caught it alive! Patience pays off. Now I only have to deposit the bugger in the nearest bounty hunter terminal to get my reward.",
      BugExploded = "Damn, I didn't manage to get it alive. The little shit ate too much antigravium and simply exploded! Still, someone is willing to part with their shinies for a dead one as well. Now I only have to deposit the bugger in the nearest bounty hunter terminal to get my reward.",
      BugKilled = "I didn't manage to get the bug alive, but still, someone is willing to part with their shinies for a dead one as well. Now I only have to deposit the bugger in the nearest bounty hunter terminal to get my reward.",
      FindHive = "Time to look for the biggest bitebug hive and a good location to set my trap.",
      GotCrystal = "I've got the crystal of required size and quality. It pains me to use such a valuable thing for feeding disgusting insects. I should smear some desert melon juice on it to make it more attractive.",
      Missed = "Damn, I missed him! I should try again.",
      MissedAgain = "Unbelievable, missed him again! Alright, last try.",
      WaitEvening = "The bug should appear when it's dark. I should set up a camp and wait till it's evening.",
      description = "There is a job posted in a bounty hunter terminal for capturing of a rare antigravium-imbued mutant bitebug. This particular specimen developed a fondness for antigravium crystals, which could be used to lure it out. The reward promised was 300 antigravium shards if captured alive, otherwise only 150 for a dead one. Attached is the last reported sighting coordinates."
   },
   nodes = {
      {
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
      {
         ID = 2,
         class = "CDiscuss",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 5,
               toSlot = 1
            }
         },
         name = "terminal_accepted",
         posX = 570,
         posY = 270,
         script = "",
         topic = "terminal_start",
         unhideTopic = false
      },
      {
         ID = 5,
         class = "CLogDescription",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 51,
               toSlot = 1
            }
         },
         log = "description",
         name = "write_desc",
         posX = 780,
         posY = 270,
         script = ""
      },
      {
         ID = 51,
         arguments = {
            {
               type = "str",
               value = "antigravium.itm"
            }
         },
         class = "CScriptCondition",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 6,
               toSlot = 1
            },
            {
               fromSlot = 2,
               toID = 4,
               toSlot = 1
            }
         },
         functionName = "hasPlayerItem",
         name = "found_crystal",
         operator = "==",
         outputSlots = 2,
         posX = 1020,
         posY = 270,
         resultValue = true,
         resultValueType = "bool",
         script = ""
      },
      {
         ID = 6,
         class = "CLogEntry",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 52,
               toSlot = 1
            }
         },
         log = "GotCrystal",
         name = "log_got_crystal",
         posX = 1230,
         posY = 270,
         script = ""
      },
      {
         ID = 52,
         arguments = {
            {
               type = "str",
               value = "antigravium_bait.itm"
            }
         },
         class = "CScriptCondition",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 9,
               toSlot = 1
            },
            {
               fromSlot = 2,
               toID = 8,
               toSlot = 1
            }
         },
         functionName = "hasPlayerItem",
         name = "crafted_bait",
         operator = "==",
         outputSlots = 2,
         posX = 1470,
         posY = 270,
         resultValue = true,
         resultValueType = "bool",
         script = ""
      },
      {
         ID = 9,
         class = "CLogEntry",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 67,
               toSlot = 1
            }
         },
         log = "FindHive",
         name = "log_find_hive",
         posX = 1680,
         posY = 270,
         script = ""
      },
      {
         ID = 67,
         class = "CPhase",
         comment = "never,1,2,3",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 53,
               toSlot = 1
            },
            {
               fromSlot = 2,
               toID = 41,
               toSlot = 1
            },
            {
               fromSlot = 3,
               toID = 44,
               toSlot = 1
            }
         },
         h = 120,
         name = "times_got_away",
         nodes = {
            {
               ID = 0,
               class = "CNodeStart",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 5,
                     toSlot = 1
                  }
               },
               name = "start",
               posX = 1980,
               posY = 30,
               script = ""
            },
            {
               ID = 5,
               arguments = {
                  {
                     type = "str",
                     value = "greenbug"
                  },
                  {
                     type = "str",
                     value = "times_got_away"
                  }
               },
               class = "CScriptCondition",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 1,
                     toSlot = 1
                  },
                  {
                     fromSlot = 2,
                     toID = 3,
                     toSlot = 1
                  }
               },
               functionName = "getQuestParam",
               name = "got_away_once",
               operator = "==",
               outputSlots = 2,
               posX = 2220,
               posY = 30,
               resultValue = 1,
               resultValueType = "int",
               script = ""
            },
            {
               ID = 1,
               class = "CNodeFinish",
               connectionsID = {},
               name = "once",
               posX = 2970,
               posY = 60,
               script = ""
            },
            {
               ID = 3,
               arguments = {
                  {
                     type = "str",
                     value = "greenbug"
                  },
                  {
                     type = "str",
                     value = "times_got_away"
                  }
               },
               class = "CScriptCondition",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 6,
                     toSlot = 1
                  },
                  {
                     fromSlot = 2,
                     toID = 4,
                     toSlot = 1
                  }
               },
               functionName = "getQuestParam",
               name = "got_away_twice",
               operator = "==",
               outputSlots = 2,
               posX = 2430,
               posY = 90,
               resultValue = 2,
               resultValueType = "int",
               script = ""
            },
            {
               ID = 6,
               class = "CNodeFinish",
               connectionsID = {},
               name = "twice",
               posX = 2970,
               posY = 120,
               script = ""
            },
            {
               ID = 4,
               arguments = {
                  {
                     type = "str",
                     value = "greenbug"
                  },
                  {
                     type = "str",
                     value = "times_got_away"
                  }
               },
               class = "CScriptCondition",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 7,
                     toSlot = 1
                  },
                  {
                     fromSlot = 2,
                     toID = 8,
                     toSlot = 1
                  }
               },
               functionName = "getQuestParam",
               name = "got_away_thrice",
               operator = "==",
               outputSlots = 2,
               posX = 2640,
               posY = 150,
               resultValue = 3,
               resultValueType = "int",
               script = ""
            },
            {
               ID = 7,
               class = "CNodeFinish",
               connectionsID = {},
               name = "thrice",
               posX = 2970,
               posY = 180,
               script = ""
            },
            {
               ID = 8,
               class = "CNodeFinish",
               connectionsID = {},
               name = "never",
               posX = 2970,
               posY = 0,
               script = ""
            }
         },
         outputSlots = 4,
         posX = 1920,
         posY = 240,
         script = "",
         w = 180
      },
      {
         ID = 53,
         arguments = {
            {
               type = "variable",
               value = "bait_act"
            }
         },
         class = "CScriptFunction",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 54,
               toSlot = 1
            }
         },
         functionName = "showObject",
         name = "show_bait",
         posX = 2460,
         posY = 120,
         script = ""
      },
      {
         ID = 54,
         arguments = {
            {
               type = "variable",
               value = "bait_act"
            }
         },
         class = "CScriptFunction",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 11,
               toSlot = 1
            }
         },
         functionName = "enableObject",
         name = "enable_bait",
         posX = 2670,
         posY = 120,
         script = ""
      },
      {
         ID = 11,
         class = "CNodeEvent",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 12,
               toSlot = 1
            }
         },
         event = "activate",
         name = "wait_place_bait",
         posX = 2880,
         posY = 120,
         script = "function node:onCheck(eventName, targetName, targetObj)\
   return targetObj == objs.bait_act\
end"
      },
      {
         ID = 12,
         class = "CLogEntry",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 13,
               toSlot = 1
            }
         },
         log = "WaitEvening",
         name = "log_wait_evening",
         posX = 3090,
         posY = 120,
         script = ""
      },
      {
         ID = 13,
         class = "WaitTimeOfDay",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 61,
               toSlot = 1
            }
         },
         name = "wait_evening",
         posX = 3300,
         posY = 120,
         script = ""
      },
      {
         ID = 61,
         arguments = {
            {
               type = "variable",
               value = "bug_spawn"
            },
            {
               type = "variable",
               value = "spawn_distance"
            },
            {
               type = "bool",
               value = true
            }
         },
         class = "CScriptCondition",
         comment = "check if standing too close",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 16,
               toSlot = 1
            },
            {
               fromSlot = 2,
               toID = 23,
               toSlot = 1
            }
         },
         functionName = "playerInDist",
         name = "check_distance",
         operator = "==",
         outputSlots = 2,
         posX = 3540,
         posY = 120,
         resultValue = true,
         resultValueType = "bool",
         script = ""
      },
      {
         ID = 16,
         class = "CNodeNew",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 15,
               toSlot = 1
            }
         },
         name = "show_hint",
         posX = 3750,
         posY = 120,
         script = "function node:onExecute()\
   gameplayUI:showInfoTextEx(\"I'm standing too close\", \"minor\", \"\")\
end"
      },
      {
         ID = 15,
         class = "CNodeTimer",
         comment = "5s",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 61,
               toSlot = 1
            }
         },
         duration = 10,
         name = "until_went_away",
         posX = 3360,
         posY = -30,
         script = ""
      },
      {
         ID = 23,
         class = "CPhase",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 25,
               toSlot = 1
            },
            {
               fromSlot = 2,
               toID = 26,
               toSlot = 1
            },
            {
               fromSlot = 3,
               toID = 67,
               toSlot = 1
            }
         },
         h = 96,
         name = "get_bug",
         nodes = {
            {
               ID = 0,
               class = "CNodeStart",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 26,
                     toSlot = 1
                  }
               },
               name = "start",
               posX = 2580,
               posY = 330,
               script = ""
            },
            {
               ID = 26,
               arguments = {
                  {
                     type = "variable",
                     value = "bug_spawn"
                  }
               },
               class = "CScriptFunction",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 19,
                     toSlot = 1
                  }
               },
               functionName = "deactivateObject",
               name = "deactivate_spawn",
               posX = 2820,
               posY = 270,
               script = ""
            },
            {
               ID = 19,
               arguments = {
                  {
                     type = "variable",
                     value = "bug_spawn"
                  }
               },
               class = "CScriptFunction",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 5,
                     toSlot = 1
                  },
                  {
                     fromSlot = 1,
                     toID = 7,
                     toSlot = 1
                  },
                  {
                     fromSlot = 1,
                     toID = 16,
                     toSlot = 1
                  }
               },
               functionName = "activateObject",
               name = "spawn_bug",
               posX = 2820,
               posY = 360,
               script = ""
            },
            {
               ID = 5,
               class = "CNodeTimer",
               comment = "1s",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 17,
                     toSlot = 1
                  }
               },
               duration = 1,
               name = "node_18",
               posX = 3090,
               posY = 330,
               script = ""
            },
            {
               ID = 17,
               arguments = {
                  {
                     type = "str",
                     value = "bug_green.itm"
                  }
               },
               class = "CScriptCondition",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 11,
                     toSlot = 1
                  },
                  {
                     fromSlot = 2,
                     toID = 5,
                     toSlot = 1
                  }
               },
               functionName = "hasPlayerItem",
               name = "alive_bug",
               operator = "==",
               outputSlots = 2,
               posX = 3390,
               posY = 90,
               resultValue = true,
               resultValueType = "bool",
               script = ""
            },
            {
               ID = 11,
               class = "CLogEntry",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 1,
                     toSlot = 1
                  }
               },
               log = "BugAlive",
               name = "log_bug_alive",
               posX = 4110,
               posY = 90,
               script = ""
            },
            {
               ID = 1,
               class = "CNodeFinish",
               connectionsID = {},
               name = "alive",
               posX = 4440,
               posY = 90,
               script = ""
            },
            {
               ID = 7,
               class = "CNodeTimer",
               comment = "1s",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 18,
                     toSlot = 1
                  }
               },
               duration = 1,
               name = "node_07",
               posX = 3180,
               posY = 510,
               script = ""
            },
            {
               ID = 18,
               arguments = {
                  {
                     type = "str",
                     value = "bug_green_dead.itm"
                  }
               },
               class = "CScriptCondition",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 24,
                     toSlot = 1
                  },
                  {
                     fromSlot = 2,
                     toID = 7,
                     toSlot = 1
                  }
               },
               functionName = "hasPlayerItem",
               name = "dead_bug",
               operator = "==",
               outputSlots = 2,
               posX = 3390,
               posY = 360,
               resultValue = true,
               resultValueType = "bool",
               script = ""
            },
            {
               ID = 24,
               class = "CPhase",
               comment = "never,1,2,3",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 12,
                     toSlot = 1
                  },
                  {
                     fromSlot = 2,
                     toID = 12,
                     toSlot = 1
                  },
                  {
                     fromSlot = 3,
                     toID = 12,
                     toSlot = 1
                  },
                  {
                     fromSlot = 4,
                     toID = 23,
                     toSlot = 1
                  }
               },
               h = 120,
               name = "times_got_away",
               nodes = {
                  {
                     ID = 7,
                     class = "CNodeStart",
                     connectionsID = {
                        {
                           fromSlot = 1,
                           toID = 2,
                           toSlot = 1
                        }
                     },
                     name = "start",
                     posX = 3030,
                     posY = 570,
                     script = ""
                  },
                  {
                     ID = 2,
                     arguments = {
                        {
                           type = "str",
                           value = "greenbug"
                        },
                        {
                           type = "str",
                           value = "times_got_away"
                        }
                     },
                     class = "CScriptCondition",
                     connectionsID = {
                        {
                           fromSlot = 1,
                           toID = 4,
                           toSlot = 1
                        },
                        {
                           fromSlot = 2,
                           toID = 6,
                           toSlot = 1
                        }
                     },
                     functionName = "getQuestParam",
                     name = "got_away_once",
                     operator = "==",
                     outputSlots = 2,
                     posX = 3270,
                     posY = 570,
                     resultValue = 1,
                     resultValueType = "int",
                     script = ""
                  },
                  {
                     ID = 4,
                     class = "CNodeFinish",
                     connectionsID = {},
                     name = "once",
                     posX = 4020,
                     posY = 600,
                     script = ""
                  },
                  {
                     ID = 6,
                     arguments = {
                        {
                           type = "str",
                           value = "greenbug"
                        },
                        {
                           type = "str",
                           value = "times_got_away"
                        }
                     },
                     class = "CScriptCondition",
                     connectionsID = {
                        {
                           fromSlot = 1,
                           toID = 3,
                           toSlot = 1
                        },
                        {
                           fromSlot = 2,
                           toID = 5,
                           toSlot = 1
                        }
                     },
                     functionName = "getQuestParam",
                     name = "got_away_twice",
                     operator = "==",
                     outputSlots = 2,
                     posX = 3480,
                     posY = 630,
                     resultValue = 2,
                     resultValueType = "int",
                     script = ""
                  },
                  {
                     ID = 3,
                     class = "CNodeFinish",
                     connectionsID = {},
                     name = "twice",
                     posX = 4020,
                     posY = 660,
                     script = ""
                  },
                  {
                     ID = 5,
                     arguments = {
                        {
                           type = "str",
                           value = "greenbug"
                        },
                        {
                           type = "str",
                           value = "times_got_away"
                        }
                     },
                     class = "CScriptCondition",
                     connectionsID = {
                        {
                           fromSlot = 1,
                           toID = 8,
                           toSlot = 1
                        },
                        {
                           fromSlot = 2,
                           toID = 1,
                           toSlot = 1
                        }
                     },
                     functionName = "getQuestParam",
                     name = "got_away_thrice",
                     operator = "==",
                     outputSlots = 2,
                     posX = 3690,
                     posY = 690,
                     resultValue = 3,
                     resultValueType = "int",
                     script = ""
                  },
                  {
                     ID = 8,
                     class = "CNodeFinish",
                     connectionsID = {},
                     name = "thrice",
                     posX = 4020,
                     posY = 720,
                     script = ""
                  },
                  {
                     ID = 1,
                     class = "CNodeFinish",
                     connectionsID = {},
                     name = "never",
                     posX = 4020,
                     posY = 540,
                     script = ""
                  }
               },
               outputSlots = 4,
               posX = 3720,
               posY = 330,
               script = "",
               w = 180
            },
            {
               ID = 12,
               class = "CLogEntry",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 10,
                     toSlot = 1
                  }
               },
               log = "BugKilled",
               name = "log_bug_killed",
               posX = 4110,
               posY = 240,
               script = ""
            },
            {
               ID = 10,
               class = "CNodeFinish",
               connectionsID = {},
               name = "dead",
               posX = 4440,
               posY = 240,
               script = ""
            },
            {
               ID = 23,
               class = "CLogEntry",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 10,
                     toSlot = 1
                  }
               },
               log = "BugExploded",
               name = "log_bug_exploded",
               posX = 4110,
               posY = 390,
               script = ""
            },
            {
               ID = 16,
               class = "CNodeEvent",
               connectionsID = {
                  {
                     fromSlot = 1,
                     toID = 25,
                     toSlot = 1
                  }
               },
               event = "activate",
               name = "missed_bug",
               posX = 3270,
               posY = 720,
               script = "function node:onCheck(eventName, targetName, targetObj)\
   return targetName == \"missed_bug\"\
end"
            },
            {
               ID = 25,
               class = "CPhase",
               comment = "never,1,2,3",
               connectionsID = {
                  {
                     fromSlot = 2,
                     toID = 15,
                     toSlot = 1
                  },
                  {
                     fromSlot = 3,
                     toID = 15,
                     toSlot = 1
                  }
               },
               h = 120,
               name = "times_got_away2",
               nodes = {
                  {
                     ID = 7,
                     class = "CNodeStart",
                     connectionsID = {
                        {
                           fromSlot = 1,
                           toID = 2,
                           toSlot = 1
                        }
                     },
                     name = "start",
                     posX = 3060,
                     posY = 540,
                     script = ""
                  },
                  {
                     ID = 2,
                     arguments = {
                        {
                           type = "str",
                           value = "greenbug"
                        },
                        {
                           type = "str",
                           value = "times_got_away"
                        }
                     },
                     class = "CScriptCondition",
                     connectionsID = {
                        {
                           fromSlot = 1,
                           toID = 4,
                           toSlot = 1
                        },
                        {
                           fromSlot = 2,
                           toID = 6,
                           toSlot = 1
                        }
                     },
                     functionName = "getQuestParam",
                     name = "got_away_once",
                     operator = "==",
                     outputSlots = 2,
                     posX = 3300,
                     posY = 540,
                     resultValue = 1,
                     resultValueType = "int",
                     script = ""
                  },
                  {
                     ID = 4,
                     class = "CNodeFinish",
                     connectionsID = {},
                     name = "once",
                     posX = 4050,
                     posY = 570,
                     script = ""
                  },
                  {
                     ID = 6,
                     arguments = {
                        {
                           type = "str",
                           value = "greenbug"
                        },
                        {
                           type = "str",
                           value = "times_got_away"
                        }
                     },
                     class = "CScriptCondition",
                     connectionsID = {
                        {
                           fromSlot = 1,
                           toID = 3,
                           toSlot = 1
                        },
                        {
                           fromSlot = 2,
                           toID = 5,
                           toSlot = 1
                        }
                     },
                     functionName = "getQuestParam",
                     name = "got_away_twice",
                     operator = "==",
                     outputSlots = 2,
                     posX = 3510,
                     posY = 600,
                     resultValue = 2,
                     resultValueType = "int",
                     script = ""
                  },
                  {
                     ID = 3,
                     class = "CNodeFinish",
                     connectionsID = {},
                     name = "twice",
                     posX = 4050,
                     posY = 630,
                     script = ""
                  },
                  {
                     ID = 5,
                     arguments = {
                        {
                           type = "str",
                           value = "greenbug"
                        },
                        {
                           type = "str",
                           value = "times_got_away"
                        }
                     },
                     class = "CScriptCondition",
                     connectionsID = {
                        {
                           fromSlot = 1,
                           toID = 8,
                           toSlot = 1
                        },
                        {
                           fromSlot = 2,
                           toID = 1,
                           toSlot = 1
                        }
                     },
                     functionName = "getQuestParam",
                     name = "got_away_thrice",
                     operator = "==",
                     outputSlots = 2,
                     posX = 3720,
                     posY = 660,
                     resultValue = 3,
                     resultValueType = "int",
                     script = ""
                  },
                  {
                     ID = 8,
                     class = "CNodeFinish",
                     connectionsID = {},
                     name = "thrice",
                     posX = 4050,
                     posY = 690,
                     script = ""
                  },
                  {
                     ID = 1,
                     class = "CNodeFinish",
                     connectionsID = {},
                     name = "never",
                     posX = 4050,
                     posY = 510,
                     script = ""
                  }
               },
               outputSlots = 4,
               posX = 3780,
               posY = 690,
               script = "",
               w = 180
            },
            {
               ID = 15,
               class = "CNodeFinish",
               connectionsID = {},
               name = "missed",
               posX = 4440,
               posY = 720,
               script = ""
            }
         },
         outputSlots = 3,
         posX = 3840,
         posY = 210,
         script = "",
         w = 180
      },
      {
         ID = 25,
         class = "CDiscuss",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 59,
               toSlot = 1
            }
         },
         name = "terminal_alive",
         posX = 4230,
         posY = 150,
         script = "",
         topic = "terminal_finish",
         unhideTopic = true
      },
      {
         ID = 59,
         arguments = {
            {
               type = "str",
               value = "bug_green.itm"
            }
         },
         class = "CScriptFunction",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 30,
               toSlot = 1
            }
         },
         functionName = "removeItemFromPlayer",
         name = "remove_bug",
         posX = 4470,
         posY = 150,
         script = ""
      },
      {
         ID = 30,
         class = "CRewardMoney",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 29,
               toSlot = 1
            }
         },
         name = "reward_full",
         posX = 4710,
         posY = 150,
         rewards = {
            {
               count = 300,
               name = "antigravium_shards.itm"
            }
         },
         script = ""
      },
      {
         ID = 29,
         class = "CRewardExp",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 32,
               toSlot = 1
            }
         },
         experience = 1800,
         name = "exp",
         posX = 5010,
         posY = 180,
         script = ""
      },
      {
         ID = 32,
         class = "CLogSuccess",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 1,
               toSlot = 1
            }
         },
         h = 60,
         log = "",
         name = "mark_quest_finished",
         posX = 5250,
         posY = 180,
         script = "",
         w = 240
      },
      {
         ID = 1,
         class = "CNodeFinish",
         connectionsID = {},
         name = "finish",
         posX = 5550,
         posY = 180,
         script = ""
      },
      {
         ID = 26,
         class = "CDiscuss",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 60,
               toSlot = 1
            }
         },
         name = "terminal_dead",
         posX = 4230,
         posY = 240,
         script = "",
         topic = "terminal_finish",
         unhideTopic = true
      },
      {
         ID = 60,
         arguments = {
            {
               type = "str",
               value = "bug_green_dead.itm"
            }
         },
         class = "CScriptFunction",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 31,
               toSlot = 1
            }
         },
         functionName = "removeItemFromPlayer",
         name = "remove_bug_dead",
         posX = 4470,
         posY = 240,
         script = ""
      },
      {
         ID = 31,
         class = "CRewardMoney",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 29,
               toSlot = 1
            }
         },
         name = "reward_half",
         posX = 4710,
         posY = 240,
         rewards = {
            {
               count = 150,
               name = "antigravium_shards.itm"
            }
         },
         script = ""
      },
      {
         ID = 41,
         class = "CLogEntry",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 53,
               toSlot = 1
            }
         },
         log = "Missed",
         name = "log_missed",
         posX = 2160,
         posY = 270,
         script = ""
      },
      {
         ID = 44,
         class = "CLogEntry",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 53,
               toSlot = 1
            }
         },
         log = "MissedAgain",
         name = "log_missed2",
         posX = 2160,
         posY = 330,
         script = ""
      },
      {
         ID = 8,
         class = "CNodeTimer",
         comment = "10s",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 52,
               toSlot = 1
            }
         },
         duration = 10,
         name = "recheck_bait",
         posX = 1260,
         posY = 420,
         script = ""
      },
      {
         ID = 4,
         class = "CNodeTimer",
         comment = "10s",
         connectionsID = {
            {
               fromSlot = 1,
               toID = 51,
               toSlot = 1
            }
         },
         duration = 10,
         name = "recheck_crystal",
         posX = 810,
         posY = 420,
         script = ""
      }
   },
   script = "function Quest:onCreate()\
   self:setParam(\"despawn_dist\", 40)\
   self:setParam(\"eat_time\", 3)\
   self:setParam(\"food_radius\", 500)\
   local markers = {\
      set_bait = {{pos = {x=676, y=1932, z=114877}, radius = 60, tip = \"Bug Hills\"}},\
      set_bait2 = {{pos = {x=676, y=1932, z=114877}, radius = 60, tip = \"Bug Hills\"}},\
      set_bait3 = {{pos = {x=676, y=1932, z=114877}, radius = 60, tip = \"Bug Hills\"}},\
   }\
   self:declareQuestMarkers(markers)\
end\
\
function Quest:onStart()\
end\
\
function Quest:onFinish()\
end\
\
",
   title = "Small prey - big gain!",
   topics = {
      {
         log_id = "",
         name = "terminal_start",
         single_use = true,
         visible = true
      },
      {
         log_id = "",
         name = "terminal_finish",
         single_use = true,
         visible = false
      }
   },
   variables = {
      {
         icon = " ",
         kind = "object",
         name = "bait_act",
         value = "q_greenbug_bait_placeholder"
      },
      {
         icon = " ",
         kind = "object",
         name = "bug_spawn",
         value = "q_greenbug_spawn"
      },
      {
         icon = " ",
         kind = "int",
         name = "spawn_distance",
         value = 1500
      }
   }
}
return quest
end
