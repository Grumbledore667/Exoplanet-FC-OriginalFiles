local Body = {
   male_human = {
      pose = {
         head = { "human_male_head" },
         eyes = { "human_male_eyes" },
         top = { "human_male_top" },
         bottom = { "human_male_legs" },
      },

      jack = {
         head = { "human_male_head_jack", },
         top = { "human_male_top_hands", "jack_top", },
         bottom = { "jack_legs" },
         scanner = { "scanner" },
      },

      junk_1 = {
         top = { "human_male_top", "junk_top_1", },
         bottom = { "human_male_legs", "junk_legs_1" },
      },

      junk_2 = {
         top = { "human_male_top", "junk_top_2", },
         bottom = { "human_male_legs", "junk_legs_2" },
      },

      bounty_hunter_1 = {
         top = { "human_male_top_hands", "bounty_hunter_1_top", },
         bottom = { "bounty_hunter_1_legs" },
      },

      bounty_hunter_2 = {
         top = { "human_male_top_hands", "bounty_hunter_2_top", },
         bottom = { "bounty_hunter_2_legs" },
      },

      bounty_hunter_3 = {
         top = { "human_male_top_hands", "bounty_hunter_3_top", },
         bottom = { "bounty_hunter_3_legs" },
      },

      peasant_1 = {
         top = { "human_male_top_hands", "peasant_1_top", },
         bottom = { "peasant_1_legs" },
      },

      farmer_1 = {
         top = { "human_male_top_arms", "farmer_1_top", },
         bottom = { "farmer_1_legs" },
      },

      mechanic_1 = {
         top = { "human_male_top_hands", "mechanic_1_top", },
         bottom = { "mechanic_1_legs" },
      },

      sheriff_jack = {
         head = { "human_male_head_jack", },
         top = { "human_male_top_hands", "sheriff_jack_top", },
         bottom = { "sheriff_jack_legs" },
      },

      sheriff_npc = {
         top = { "human_male_top_sheriff", "sheriff_npc_top", "sheriff_badge", },
         bottom = { "sheriff_npc_legs" },
      },

      thug_1 = {
         top = { "human_male_top_arms", "thug_1_top", },
         bottom = { "thug_1_legs" },
      },

      worker_1 = {
         top = { "human_male_top_hands", "worker_1_top", },
         bottom = { "worker_1_legs" },
      },
      scarecrow = {
         mask = { "bag_hat" },
      },
   },
   female_human = {
   },
   abori = {
      male = {
         head = { { "abori_head_1" }, { "abori_head_2" }, { "abori_head_3" } },
         whiskers = { { "whiskers_1" }, { "whiskers_2" }, { "whiskers_3" }, { "whiskers_4" }, },
         eyes = { "eye_l", "eye_r" },
         teeth = { "abori_teeth_1" },
         top = { "abori_male_top" },
         bottom = { "abori_male_legs" },
      },
      bandaged = {
         head = { "band_head" },
         arm_up_l = { "band_uparm_left" },
         arm_up_r = { "band_uparm_right" },
         arm_lo_l = { "band_loarm_left" },
         arm_lo_r = { "band_loarm_right" },
         leg_up_l = { "band_thigh_left" },
         leg_up_r = { "band_thigh_right" },
         leg_lo_l = { "band_loarm_left" },
         leg_lo_r = { "band_loarm_right" },
      },
      swift_strider = {
         head = { "abori_swift_strider_head", "eye_l", "eye_r", "abori_teeth_1" },
         top = { "abori_swift_strider_top" },
         bottom = { "abori_swift_strider_legs" },
         bandages = { "band_head", "band_ssleg_right", "band_ssleg_left" },
      },
      raider_1 = {
         top = { "abori_raider_top_1", "abori_raider_shoulder_1" },
         bottom = { "abori_raider_legs_1", "abori_raider_bottom_1", "abori_raider_belt_1" },
      },
      raider_2 = {
         top = { "abori_raider_top_1", "abori_raider_shoulder_1", "abori_raider_shoulder_2" },
         bottom = { "abori_raider_legs_2", "abori_raider_bottom_1", "abori_raider_belt_2" },
      },
      raider_3 = {
         top = { "abori_raider_top_3" },
         bottom = { "abori_raider_legs_3", "abori_raider_bottom_1", "abori_raider_belt_3" },
      },
      raider_4 = {
         top = { "abori_raider_top_4" },
         bottom = { "abori_raider_legs_4", "abori_raider_bottom_1", "abori_raider_belt_4" },
      },
      slave_1 = {
         top = { "abori_slave_top_1", "abori_slave_collar" },
         bottom = { "abori_slave_legs_1" },
      },
      slave_2 = {
         top = { "abori_slave_top_2", "abori_slave_collar" },
         bottom = { "abori_slave_legs_2" },
      },
      slave_3 = {
         top = { "abori_slave_top_3", "abori_slave_collar" },
         bottom = { "abori_slave_legs_3" },
      },
      worker_1 = {
         top = { "abori_worker_top_1" },
         bottom = { "abori_worker_legs_1" },
      },
      worker_2 = {
         top = { "abori_worker_top_2" },
         bottom = { "abori_worker_legs_2" },
      },
      worker_3 = {
         top = { "abori_worker_top_3" },
         bottom = { "abori_worker_legs_3" },
      },
   },
}

local Style = {
   -- ################# HUMAN SET STYLES ###################
   human_male = {
      human_male = {
         body = {
            Body.male_human.pose.head,
            Body.male_human.pose.eyes,
            Body.male_human.pose.top,
            Body.male_human.pose.bottom,
         },
         attachments = {},
      },
      human_male_2 = {
         body = {
            Body.male_human.pose.head,
            Body.male_human.pose.eyes,
            Body.male_human.pose.top,
            Body.male_human.pose.bottom,
         },
         attachments = {
            { bone = "head_slot", name = "rice_hat.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, }
         },
      },
      jack = {
         body = {
            Body.male_human.jack.head,
            Body.male_human.jack.top,
            Body.male_human.jack.bottom,
         },
         attachments = {
            { bone = "head_slot", name = "hair_jack.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, }
         },
      },
      jack_hat2 = {
         body = {
            Body.male_human.jack.head,
            Body.male_human.jack.top,
            Body.male_human.jack.bottom,
         },
         attachments = {
         },
      },
      jack_shirtless = {
         body = {
            Body.male_human.jack.head,
            Body.male_human.pose.top,
            Body.male_human.jack.bottom,
         },
         attachments = {
         },
      },
      jack_naked = {
         body = {
            Body.male_human.jack.head,
            Body.male_human.pose.top,
            Body.male_human.pose.bottom,
         },
         attachments = {
            { bone = "head_slot", name = "hair_jack.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },
      bounty_hunter_1 = {
         body = {
            Body.male_human.pose.head,
            Body.male_human.pose.eyes,
            Body.male_human.bounty_hunter_1.top,
            Body.male_human.bounty_hunter_1.bottom,
         },
         attachments = {
         },
      },
      jack_bounty_hunter_1 = {
         body = {
            Body.male_human.jack.head,
            Body.male_human.bounty_hunter_1.top,
            Body.male_human.bounty_hunter_1.bottom,
         },
         attachments = {
         },
      },
      jack_bounty_hunter_3 = {
         body = {
            Body.male_human.jack.head,
            Body.male_human.bounty_hunter_3.top,
            Body.male_human.bounty_hunter_3.bottom,
         },
         attachments = {
         },
      },
      bounty_hunter_2 = {
         body = {
            Body.male_human.pose.head,
            Body.male_human.pose.eyes,
            Body.male_human.bounty_hunter_2.top,
            Body.male_human.bounty_hunter_2.bottom,
         },
         attachments = {
         },
      },
      bounty_hunter_3 = {
         body = {
            Body.male_human.pose.head,
            Body.male_human.pose.eyes,
            Body.male_human.bounty_hunter_3.top,
            Body.male_human.bounty_hunter_3.bottom,
         },
         attachments = {
         },
      },
      bounty_hunter_3_trailer = {
         body = {
            Body.male_human.jack.head,
            { "human_male_top_arms", "bounty_hunter_3_top", },
            Body.male_human.bounty_hunter_3.bottom,
         },
         attachments = {
            { bone = "head_slot", name = "hat_leather.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
            { bone = "item_slot1", name = "howdah.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },
      peasant_1 = {
         body = {
            Body.male_human.pose.head,
            Body.male_human.pose.eyes,
            Body.male_human.peasant_1.top,
            Body.male_human.peasant_1.bottom,
         },
         attachments = {
         },
      },
      farmer_1 = {
         body = {
            Body.male_human.pose.head,
            Body.male_human.pose.eyes,
            Body.male_human.farmer_1.top,
            Body.male_human.farmer_1.bottom,
         },
         attachments = {
         },
      },
      mechanic_1 = {
         body = {
            Body.male_human.pose.head,
            Body.male_human.pose.eyes,
            Body.male_human.mechanic_1.top,
            Body.male_human.mechanic_1.bottom,
         },
         attachments = {
         },
      },
      sheriff_jack = {
         body = {
            Body.male_human.jack.head,
            Body.male_human.sheriff_jack.top,
            Body.male_human.sheriff_jack.bottom,
         },
         attachments = {
            { bone = "head_slot", name = "sheriff_hat.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, }
         },
      },
      sheriff_jack_hat2 = {
         body = {
            Body.male_human.jack.head,
            Body.male_human.sheriff_jack.top,
            Body.male_human.sheriff_jack.bottom,
         },
         attachments = {
         },
      },
      sheriff_npc = {
         body = {
            Body.male_human.pose.head,
            Body.male_human.pose.eyes,
            Body.male_human.sheriff_npc.top,
            Body.male_human.sheriff_npc.bottom,
         },
         attachments = {
            { bone = "head_slot", name = "sheriff_hat.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, }
         },
      },
      thug_1 = {
         body = {
            Body.male_human.pose.head,
            Body.male_human.pose.eyes,
            Body.male_human.thug_1.top,
            Body.male_human.thug_1.bottom,
         },
         attachments = {
            { bone = "head_slot", name = "thug_1_hat.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },
      worker_1 = {
         body = {
            Body.male_human.pose.head,
            Body.male_human.pose.eyes,
            Body.male_human.worker_1.top,
            Body.male_human.worker_1.bottom,
         },
         attachments = {
         },
      },
      jack_worker_1 = {
         body = {
            Body.male_human.jack.head,
            Body.male_human.worker_1.top,
            Body.male_human.worker_1.bottom,
         },
         attachments = {
         },
      },
      -- ############### HUMAN NPC STYLES ################
      zak = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'human_turban.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'nomad_goggles.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'item_slot4',
                            name = 'shotgun.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'item_slot5',
                            name = 'machete.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'human_male_top_hands', 'human_male_eyes', 'bounty_hunter_2_top',
                    'bounty_hunter_2_legs' }, { 'human_male_head' } },
         textures = {
            human_male_head = 'human_male_head_ginger_dif.dds'
         }
      },
      master_phil = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'hair_long_backward.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'worker_1_top', 'mechanic_1_legs', 'human_male_eyes',
                    'human_male_top_hands' }, { 'human_male_head_thin_yellow' } },
         textures = {
            ['hair_long_backward.sbg'] = 'human_hair_grey_dif.dds',
            human_male_eyes = 'eye_brown_dif.dds',
            human_male_top_hands = 'human_male_top_red_dif.dds'
         }
      },
      mason = {
         textures = {
         },
         attachments = {
         },
         body = {
            { "human_male_eyes" },
            { "human_male_top_arms" },
            { "human_male_head_fat" },
            { "moustache_regular_fat" },
            { "beard_whiskers_fat" },
            { "beard_stubble_fat" },
            { "farmer_1_top" },
            { "farmer_1_legs" },
            { "band_arm_left" }
         }
      },
      castor = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'thug_1_hat.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'human_eyepach2_l.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'bounty_hunter_3_legs', 'bounty_hunter_3_top', 'human_male_eyes',
                    'human_male_top_hands' }, { 'moustache_gunslinger_wide' }, {
                     'beard_whiskers_big' }, { 'human_male_head' } },
         textures = {
            beard_whiskers_big = 'human_hair_grey_dif.dds',
            human_male_head = 'human_male_head_black_dif.dds',
            human_male_top_hands = 'human_male_top_black_dif.dds',
            moustache_gunslinger_wide = 'human_hair_grey_dif.dds'
         }
      },
      barnie = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'hat_leather.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'item_slot1',
                            name = 'shotgun.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'bounty_hunter_3_legs', 'bounty_hunter_1_top',
                    'human_male_top_hands', 'human_male_head', 'human_male_eyes' }, {
                     'moustache_regular' }, { 'beard_bushy' }, { 'moustache_round' } },
         textures = {
            human_male_eyes = 'eye_brown_dif.dds',
            human_male_head = 'human_male_head_yellow_dif.dds',
            human_male_top_hands = 'human_male_top_yellow_dif.dds',
            moustache_regular = 'human_hair_black_dif.dds'
         }
      },
      bjorn = {
         attachments = { {
                            bone = 'item_slot1',
                            name = 'shotgun.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'bounty_hunter_2_legs', 'human_male_eyes', 'bounty_hunter_2_top',
                    'human_male_top_hands' }, { 'human_male_head_big' }, { 'beard_stubble_big' }
         , { 'beard_whiskers_big' } },
         textures = {
            beard_stubble_big = 'human_hair_blond_dif.dds',
            beard_whiskers_big = 'human_hair_blond_dif.dds',
            human_male_eyes = 'eye_grey_dif.dds',
            human_male_head_big = 'human_male_head_grey_dif.dds'
         }

      },
      eli = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'sheriff_hat.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'worker_1_top', 'mechanic_1_legs', 'human_male_eyes',
                    'human_male_top_hands' }, { 'human_male_head_thin' }, {
                     'moustache_gunslinger' }, { 'beard_whiskers' } },
         textures = {
            beard_whiskers = 'human_hair_grey_dif.dds',
            human_male_eyes = 'eye_green_dif.dds',
            human_male_head_thin = 'human_male_head_black_dif.dds',
            human_male_top_hands = 'human_male_top_black_dif.dds',
            moustache_gunslinger = 'human_hair_grey_dif.dds'
         }

      },
      drago = {
         attachments = { {
                            bone = 'item_slot1',
                            name = 'shotgun.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'biker_mask_2.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'bounty_hunter_2_legs', 'human_male_head', 'human_male_eyes',
                    'bounty_hunter_2_top', 'human_male_top_hands' } },
         textures = {
            human_male_head = 'human_male_head_black_dif.dds',
            human_male_top_hands = 'human_male_top_black_dif.dds'
         }
      },
      junior = {
         attachments = { {
                            bone = 'item_slot6',
                            name = 'revolver.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'boonie_hat.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'bounty_hunter_1_top', 'human_male_eyes', 'human_male_top_hands',
                    'peasant_1_legs' }, { 'human_male_head' } },
         textures = {
            human_male_eyes = 'eye_brown_dif.dds',
            human_male_head = 'human_male_head_yellow_dif.dds',
            human_male_top_hands = 'human_male_top_yellow_dif.dds'
         }
      },
      wessley = {
         body = {
            { "human_male_legs",
              "human_male_head",
              "human_male_eyes",
              "human_male_top", },
         },
         attachments = {
            { bone = "head_slot", name = "human_turban.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
            -- { bone = "head_slot", name = "abori_slave_hat_1.sbg", pos = {x=0,y=0,z=2.5}, rot = {x=20,y=0,z=0}, scale = {x=0.85,y=0.85,z=0.73}, },
         },
      },
      kenneth = {
         attachments = { {
                            bone = 'item_slot4',
                            name = 'shovel.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'hair_dreads.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'human_eyepatch_l.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'human_male_eyes' }, { 'human_male_head_fat' }, { 'junk_top_2' },
                  { 'beard_whiskers_fat' }, { 'band_arm_right' }, { 'human_male_top' }, {
                     'junk_legs_2' }, { 'moustache_gunslinger_wide' }, { 'beard_bushy_fat' } },
         textures = {
            ['hair_dreads.sbg'] = 'human_hair_brown_dif.dds',
            human_male_eyes = 'eye_brown_dif.dds',
            human_male_head_fat = 'human_male_head_black_dif.dds',
            human_male_top = 'human_male_top_black_dif.dds'
         }
      },
      leon = {
         attachments = { {
                            bone = 'item_slot1',
                            name = 'shotgun.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'hair_hipster.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'bounty_hunter_3_legs', 'bounty_hunter_1_top',
                    'human_male_top_hands', 'human_male_eyes' }, { 'band_arm_left' }, {
                     'moustache_gunslinger' }, { 'human_male_head_big' }, { 'beard_whiskers_big' }
         },
         textures = {
            human_male_eyes = 'eye_brown_dif.dds'
         }

      },
      red = {
         attachments = { {
                            bone = 'item_slot4',
                            name = 'shotgun.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'item_slot6',
                            name = 'axe.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = -90,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'hair_hipster_ponytail.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'bounty_hunter_3_legs', 'bounty_hunter_1_top',
                    'human_male_top_hands', 'human_male_eyes' }, { 'human_male_head_big' }, {
                     'beard_stubble_big' } },
         textures = {
            beard_stubble_big = 'human_hair_ginger_dif.dds',
            ['hair_hipster_ponytail.sbg'] = 'human_hair_ginger_dif.dds',
            human_male_eyes = 'eye_blue_dif.dds'
         }
      },
      dikson = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'thug_1_hat.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'item_slot4',
                            name = 'kabarog_hsg.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'bounty_hunter_3_legs', 'bounty_hunter_3_top', 'human_male_eyes',
                    'human_male_top_hands' }, { 'beard_whiskers_fat' }, {
                     'human_male_head_fat_yellow' } },
         textures = {
            human_male_top_hands = 'human_male_top_yellow_dif.dds'
         }
      },
      frank = {
         attachments = { {
                            bone = 'item_slot4',
                            name = 'kabarog_hsg.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'thug_1_hat.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'bounty_hunter_3_legs', 'bounty_hunter_3_top', 'human_male_eyes',
                    'human_male_top_hands' }, { 'human_male_head_big' }, {
                     'moustache_gunslinger_wide' }, { 'beard_stubble_big' } },
         textures = {
            human_male_eyes = 'eye_grey_dif.dds'
         }
      },
      ringo = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'biker_mask_2.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'item_slot1',
                            name = 'shotgun.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'hair_dreads.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'bounty_hunter_2_legs', 'human_male_head', 'human_male_eyes',
                    'bounty_hunter_2_top', 'human_male_top_hands' } },
         textures = {
            ['hair_dreads.sbg'] = 'human_hair_brown_dif.dds',
            human_male_head = 'human_male_head_yellow_dif.dds',
            human_male_top_hands = 'human_male_top_yellow_dif.dds'
         }
      },
      john = {
         attachments = { {
                            bone = 'item_slot1',
                            name = 'shotgun.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'hair_hipster.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'bounty_hunter_2_legs', 'human_male_eyes', 'bounty_hunter_2_top',
                    'human_male_top_hands' }, { 'human_male_head_big' } },
         textures = {
            ['hair_hipster.sbg'] = 'human_hair_blond_dif.dds',
            human_male_top_hands = 'human_male_top_black_dif.dds'
         }

      },
      jorgen = {
         body = {
            { "bounty_hunter_3_legs",
              "bounty_hunter_1_top",
              "human_male_top_hands",
              "human_male_head",
              "human_male_eyes", },
         },
         attachments = {
            { bone = "item_slot1", name = "shotgun.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
            { bone = "head_slot", name = "hat_leather.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },

         },
      },
      bandit_gunslinger_1 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'bandana_1.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 },
                            texture = "bandana_dif_3.dds",
                         }, {
                            bone = 'head_slot',
                            name = 'bullet_hat.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         } },
         body = { { 'human_male_eyes' }, { 'human_male_head_big' }, { 'thug_1_top' },
                  { 'human_male_top_arms' }, { 'worker_1_legs' } }
      },
      bandit_gunslinger_2 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'hair_hipster.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         }, {
                            bone = 'head_slot',
                            name = 'bandana_1.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 },
                            texture = "bandana_dif_2.dds",
                         }, {
                            bone = 'head_slot',
                            name = 'nomad_goggles.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         } },
         body = { { 'human_male_eyes' }, { 'human_male_head_big' }, { 'farmer_1_legs'
         }, { 'thug_1_top' }, { 'human_male_top_arms' } }
      },
      bandit_gunslinger_3 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'hair_dreads.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         }, {
                            bone = 'head_slot',
                            name = 'bandana_1.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         } },
         body = { { 'peasant_1_legs' }, { 'human_male_head' }, { 'human_male_eyes' },
                  { 'human_male_top_hands' }, { 'mechanic_1_top' } }
      },
      bandit_gunslinger_4 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'thug_1_hat.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         }, {
                            bone = 'head_slot',
                            name = 'bandana_1.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 },
                            texture = "bandana_dif_3.dds",
                         } },
         body = { { 'human_male_eyes' }, { 'human_male_head' }, { 'peasant_1_top' }, {
            'human_male_top_hands' }, { 'worker_1_legs' } }
      },
      bandit_sharpshooter_1 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'human_turban.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         }, {
                            bone = 'head_slot',
                            name = 'bandana_1.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         } },
         body = { { 'worker_1_legs' }, { 'human_male_eyes' }, { 'human_male_head' }, {
            'sheriff_jack_top' }, { 'human_male_top_hands' } }
      },
      bandit_sharpshooter_2 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'hair_long_backward.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         }, {
                            bone = 'head_slot',
                            name = 'bandana_1.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 },
                            texture = "bandana_dif_3.dds",
                         } },
         body = { { 'human_male_eyes' }, { 'human_male_head' }, {
            'bounty_hunter_1_legs' }, { 'sheriff_jack_top' }, { 'human_male_top_hands' }
         }
      },
      bandit_sharpshooter_3 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'bullet_hat.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         }, {
                            bone = 'head_slot',
                            name = 'bandana_1.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 },
                            texture = "bandana_dif_2.dds",
                         } },
         body = { { 'human_male_eyes' }, { 'human_male_head' }, { 'sheriff_jack_top' }
         , { 'human_male_top_hands' }, { 'thug_1_legs' } }
      },
      bandit_sharpshooter_4 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'biker_helmet.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         } },
         body = { { 'farmer_1_legs' }, { 'sheriff_jack_top' }, {
            'human_male_top_hands' } }
      },
      bandit_sharpshooter_5 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'hair_long_backward.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         }, {
                            bone = 'head_slot',
                            name = 'bandana_1.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 },
                            texture = "bandana_dif_3.dds",
                         } },
         body = { { 'human_male_eyes' }, { 'human_male_head' }, {
            'bounty_hunter_1_legs' }, { 'bounty_hunter_3_top' }, { 'human_male_top_hands' }
         }
      },
      mad_bandit_1 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'biker_mask_2.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         }, {
                            bone = 'head_slot',
                            name = 'rice_hat.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         } },
         body = { { 'human_male_eyes' }, { 'human_male_head' }, { 'human_male_top' },
                  { 'mechanic_1_legs' } }
      },
      mad_bandit_2 = {
         attachments = {},
         body = { { 'mechanic_1_top' }, { 'human_male_top_hands' }, {
            'mechanic_1_legs' }, { 'gas_mask_head' } }
      },
      mad_bandit_3 = {
         attachments = {},
         body = { { 'bag_hat' }, { 'human_male_eyes' }, { 'human_male_head' }, {
            'human_male_legs' }, { 'mechanic_1_top' }, { 'human_male_top_hands' } }
      },
      mad_bandit_4 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'biker_mask.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         }, {
                            bone = 'head_slot',
                            name = 'hair_dreads.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         } },
         body = { { 'human_male_top' }, { 'bounty_hunter_3_legs' } }
      },
      the_other_john = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'hat_leather.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'item_slot1',
                            name = 'shotgun.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'bounty_hunter_3_legs', 'bounty_hunter_1_top',
                    'human_male_top_hands', 'human_male_head', 'human_male_eyes' }, {
                     'moustache_regular' }, { 'moustache_round' }, { 'beard_stubble' } },
         textures = {
            human_male_eyes = 'eye_brown_dif.dds',
            human_male_head = 'human_male_head_yellow_dif.dds',
            human_male_top_hands = 'human_male_top_yellow_dif.dds',
            moustache_regular = 'human_hair_black_dif.dds'
         }

      },
      scarecrow = {
         body = { { 'bag_hat' }, { 'human_male_eyes' }, { 'human_male_head' }, {
            'bounty_hunter_3_legs' }, { 'sheriff_jack_top' }, { 'human_male_top_hands' } }
      },
      lemonade_wade = {
         textures = {
            ["hair_dreads.sbg"] = "human_hair_blond_dif.dds",
            moustache_gunslinger_wide = "human_hair_blond_dif.dds",
            human_male_eyes = "eye_blue_dif.dds"
         },
         attachments = {
            {
               name = "human_goggle_r.sbg",
               bone = "head_slot",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               pos = {
                  y = 0,
                  x = 0,
                  z = 0
               }
            },
            {
               name = "human_hulk_hat_1.sbg",
               bone = "head_slot",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               pos = {
                  y = 2,
                  x = 0,
                  z = 0
               }
            },
            {
               name = "pipe.sbg",
               bone = "item_slot5",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               pos = {
                  y = 0,
                  x = 0,
                  z = 0
               }
            },
            {
               name = "beacon_base.sbg",
               bone = "item_slot10",
               scale = {
                  y = 0.7,
                  x = 0.7,
                  z = 0.7
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               pos = {
                  y = 20,
                  x = 0,
                  z = 0
               }
            },
            {
               name = "human_hulk_hat_2.sbg",
               bone = "item_slot6",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               pos = {
                  y = 0,
                  x = 2,
                  z = -8
               }
            },
            {
               texture = "human_hair_blond_dif.dds",
               name = "hair_dreads.sbg",
               bone = "head_slot",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               pos = {
                  y = 0,
                  x = 0,
                  z = 0
               }
            }
         },
         body = { { 'human_male_eyes' }, { 'human_male_head_fat_yellow' }, { 'moustache_gunslinger_wide' }, { 'mechanic_1_legs' }, { 'bounty_hunter_1_top' }, {
            'human_male_top_hands' } }
      },
      skeleton_human = {
         textures = {},
         attachments = {},
         body = { {'skeleton'} }
      },
      slaver_01 = {
         textures = {
            human_male_legs = "human_male_legs_1_diff.dds",
            human_male_eyes = "eye_blue_dif.dds",
            beard_whiskers_fat = "human_hair_blond_dif.dds",
            human_male_top = "human_male_top_dif.dds",
            human_male_head_fat = "human_male_head_1_dif.dds"
         },
         attachments = {
            {
               name = "bandit_1_hat.sbg",
               bone = "head_slot",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               pos = {
                  y = 0,
                  x = 0,
                  z = 0
               }
            }
         },
         body = { { 'human_male_eyes' }, { 'human_male_legs' }, { 'human_male_head_fat' }, { 'beard_whiskers_fat' }, { 'bounty_hunter_1_legs' },
                  { 'junk_top_2' }, { 'human_male_top' } }
      },
      slaver_02 = {
         textures = {},
         body = { { 'human_male_eyes' }, { 'human_male_head_thin' }, { 'beard_bushy' }, { 'farmer_1_legs' }, { 'worker_1_top' }, { 'human_male_top_hands' } },
         attachments = {}
      },
      slaver_03 = {
         textures = {
            human_male_top = "human_male_top_yellow_dif.dds",
            human_male_eyes = "eye_green_dif.dds"
         },
         body = { { 'human_male_eyes' }, { 'mechanic_1_legs' }, { 'human_male_top' }, { 'junk_top_1' }, { 'human_male_head_yellow' },
                  { 'beard_stubble' } },
         attachments = {
            {
               name = "hair_curly_long.sbg",
               bone = "head_slot",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               pos = {
                  y = 0,
                  x = 0,
                  z = 0
               }
            }
         }
      },
      slaver_04 = {
         textures = {
            moustache_regular_fat = "human_hair_ginger_dif.dds",
            human_male_head_big = "human_male_head_red_dif.dds",
            human_male_top_hands = "human_male_top_red_dif.dds"
         },
         attachments = {
            {
               name = "bandit_3_hat.sbg",
               bone = "head_slot",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               pos = {
                  y = 0,
                  x = 0,
                  z = 0
               }
            }
         },
         body = { { 'human_male_eyes' }, { 'human_male_head_big' }, { 'moustache_regular_fat' }, { 'peasant_1_top' }, { 'human_male_top_hands' },
                  { 'bandit_1_legs' } }
      },
      slaver_05 = {
         textures = {
            human_male_top_arms = "human_male_top_black_dif.dds"
         },
         body = { { 'human_male_eyes' }, { 'human_male_head_big_black' }, { 'bandit_1_top' }, { 'human_male_top_arms' }, { 'bandit_3_legs' } },
         attachments = {}
      },
      slaver_06 = {
         textures = { human_male_eyes = "eye_grey_dif.dds" },
         body = { { 'human_male_eyes' }, { 'human_male_legs' }, { 'human_male_head' }, { 'beard_whiskers_fat' }, { 'junk_legs_2' }, { 'farmer_1_top' },
                  { 'band_arm_right' }, { 'human_male_top_arms' } },
         attachments = {
            {
               name = "hair_long.sbg",
               bone = "head_slot",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               pos = {
                  y = 0,
                  x = 0,
                  z = 0
               }
            }
         }
      },
      slaver_07 = {
         textures = {
            human_male_legs = "human_male_legs_black_diff.dds",
            human_male_top_arms = "human_male_top_black_dif.dds",
            ["bandana_1.sbg"] = "bandana_dif_3.dds"
         },
         attachments = {
            {
               name = "bandana_1.sbg",
               bone = "head_slot",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               texture = "bandana_dif_3.dds",
               pos = {
                  y = 0,
                  x = 0,
                  z = 0
               }
            },
            {
               name = "bandit_2_hat.sbg",
               bone = "head_slot",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               pos = {
                  y = 0,
                  x = 0,
                  z = 0
               }
            }
         },
         body = { { 'human_male_eyes' }, { 'human_male_legs' }, { 'thug_1_top' }, { 'human_male_top_arms' }, { 'bounty_hunter_2_legs' },
                  { 'human_male_head_black' } }
      },
      slaver_08 = {
         textures = {
            human_male_eyes = "eye_grey_dif.dds",
            ["bandana_1.sbg"] = "bandana_dif_2.dds",
            ["hair_dreads.sbg"] = "human_hair_ginger_dif.dds",
            human_male_top_hands = "human_male_top_yellow_dif.dds",
            human_male_head = "human_male_head_yellow_dif.dds"
         },
         body = { { 'human_male_eyes' }, { 'human_male_head' }, { 'bounty_hunter_3_top' }, { 'human_male_top_hands' }, { 'bandit_3_legs' } },
         attachments = {
            {
               name = "hair_dreads.sbg",
               bone = "head_slot",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               texture = "human_hair_ginger_dif.dds",
               pos = {
                  y = 0,
                  x = 0,
                  z = 0
               }
            },
            {
               name = "bandana_1.sbg",
               bone = "head_slot",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               texture = "bandana_dif_2.dds",
               pos = {
                  y = 0,
                  x = 0,
                  z = 0
               }
            }
         }
      },
      slaver_09 = {
         textures = {},
         body = { { 'human_male_eyes' }, { 'human_male_head_fat' }, { 'beard_stubble_big' }, { 'moustache_gunslinger' }, { 'peasant_1_top' },
                  { 'human_male_top_hands' }, { 'thug_1_legs' }
         },
         attachments = {
            {
               name = "human_eyepach2_r.sbg",
               bone = "head_slot",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               pos = {
                  y = 0,
                  x = 0,
                  z = 0
               }
            },
            {
               name = "human_goggle_l.sbg",
               bone = "head_slot",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               pos = {
                  y = 0,
                  x = 0,
                  z = 0
               }
            }
         }
      },
      slaver_10 = {
         textures = {
            human_male_eyes = "eye_brown_dif.dds"
         },
         attachments = {
            {
               name = "hair_hipster_ponytail.sbg",
               bone = "head_slot",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               pos = {
                  y = 0,
                  x = 0,
                  z = 0
               }
            }
         },
         body = { { 'human_male_eyes' }, { 'human_male_head_big' }, { 'beard_stubble_big' }, { 'bandit_2_top' }, { 'human_male_top_hands' },
                  { 'bandit_2_legs' } }
      },
      slaver_11 = {
         textures = {
            human_male_eyes = "eye_blue_dif.dds",
            ["hair_long_backward.sbg"] = "human_hair_grey_dif.dds",
            moustache_round = "human_hair_grey_dif.dds"
         },
         attachments = {
            {
               pos = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               name = "hair_long_backward.sbg",
               bone = "head_slot",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               texture = "human_hair_grey_dif.dds"
            }
         },
         body = { { 'human_male_eyes' }, { 'human_male_head_thin' }, { 'bandit_1_top' }, { 'moustache_round' }, { 'bandit_1_legs' }, { 'human_male_top_arms' }
         }
      },
      slaver_12 = {
         textures = {
            ["hair_curly_long.sbg"] = "human_hair_grey_dif.dds"
         },
         attachments = {
            {
               name = "hair_curly_long.sbg",
               bone = "head_slot",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               pos = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               texture = "human_hair_grey_dif.dds"
            },
            {
               name = "human_goggle_l.sbg",
               bone = "head_slot",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               pos = {
                  y = 0,
                  x = 0,
                  z = 0
               }
            }
         },
         body = { { 'bandit_3_legs' }, { 'bandit_3_top' }, { 'human_male_top_bandit' }, { 'human_male_head_big' }, { 'human_male_neck' }, { 'human_male_eyes' } }
      },
      slaver_13 = {
         textures = {},
         attachments = {},
         body = { { 'human_male_eyes' }, { 'gas_mask_head_2' }, { 'band_arm_left' }, { 'bandit_2_legs' }, { 'bounty_hunter_1_top' },
                  { 'human_male_top_hands' } }
      },
      spacer_dummy = {
         body = { { 'jack_top' }, { 'jack_legs' } }
      },
      spacer_dummy_top = {
         body = { { 'jack_top' } }
      },
      spacer_dummy_bottom = {
         body = { { 'jack_legs' } }
      },
   },

   hulk = {
      -- ############### ABORI HULK SET STYLES ################
      hulk = {
         body = {
            { "hulk_head_base" },
            { "hulk_jaws" },
            { "hulk_body" },
            { "eye_l", "eye_r", },
         },
         attachments = {},
      },
      abori_hulk_1 = {
         body = {
            { "hulk_head_retarded" },
            { "hulk_body" },
            { "eye_l", "eye_r", },
            { "hulk_amulet_2" },
            { "hulk_waist_2" },
            { "hulk_jaws" },
            { "hulk_flask" },
            { "hulk_feet_2" },
            { "hulk_necklace_1" },
            { "hulk_gems_2" },
            { "halk_shoulder_2_r" }
         },
         attachments = {},
         textures = {
            eye_l = "abori_eye_4_dif.dds",
            eye_r = "abori_eye_4_dif.dds",
            hulk_body = "hybrid_hulk_dif_2.dds",
            hulk_head_retarded = "hybrid_hulk_head_dif_2.dds"
         },
      },
      abori_hulk_2 = {
         body = {
            { "hulk_head_base" },
            { "hulk_body" },
            { "eye_l", "eye_r", },
            { "hulk_pants_1" },
            { "hulk_kneeplate_1" },
            { "hulk_jaws" },
            { "hulk_kneeplate_1_r" },
            { "hulk_feet_1" },
            { "halk_top_1" },
            { "hulk_armband_1" },
            { "hulk_armband_1_r" },
            { "hulk_armstring_1_r" },
            { "hulk_armstring_1" },
            { "hulk_belt_2" }
         },
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_hulk_hat_2.sbg',
                            pos = {
                               x = 0,
                               y = -16,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         textures = {
            eye_l = "abori_eye_2_dif.dds",
            eye_r = "abori_eye_2_dif.dds",
            hulk_body = "hybrid_hulk_dif_3.dds",
            hulk_head_base = "hybrid_hulk_head_dif_3.dds"
         },
      },
      abori_hulk_3 = {
         body = {
            { "hulk_head_angry" },
            { "hulk_body_saw" },
            { "eye_l", "eye_r", },
            { "halk_scarf" },
            { "halk_shoulder_1_r" },
            { "hulk_jaws" },
            { "hulk_feet_1" },
            { "halk_shoulder_1" },
            { "hulk_powersaw" },
            { "hulk_armstring_1_r" },
            { "hulk_waist_1" },
            { "hulk_belt_3" },
            { "hulk_belt_1" }
         },
         attachments = {},
         textures = {
            eye_l = "abori_eye_1_dif.dds",
            eye_r = "abori_eye_1_dif.dds",
            hulk_body_saw = "hybrid_hulk_dif_1.dds",
            hulk_head_angry = "hybrid_hulk_head_dif_1.dds"
         },
      },
      abori_hulk_4 = {
         body = {
            { "hulk_jaws" },
            { "hulk_body" },
            { "eye_l", "eye_r", },
            { "hulk_head_cunning" },
            { "hulk_amulet_2" },
            { "hulk_belt_1" },
            { "halk_top_1" },
            { "halk_shoulder_1_r" },
            { "halk_shoulder_2" },
            { "halk_glove_1_r" },
            { "halk_glove_1" },
            { "hulk_pants_1" },
            { "hulk_feet_3" },
            { "hulk_kneeplate_1_r" }
         },
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_hulk_hat_3.sbg',
                            pos = {
                               x = 0,
                               y = -14,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         textures = {
            eye_l = "abori_eye_4_dif.dds",
            eye_r = "abori_eye_4_dif.dds",
            hulk_body = "hybrid_hulk_dif_2.dds",
            hulk_head_cunning = "hybrid_hulk_head_dif_2.dds"
         },
      },
      abori_hulk_5 = {
         body = {
            { "hulk_body" },
            { "eye_l", "eye_r", },
            { "hulk_head_serious" },
            { "hulk_jaws" },
            { "hulk_kneeplate_1" },
            { "hulk_waist_2" },
            { "halk_glove_3_r" },
            { "hulk_flask" },
            { "hulk_gems_1" },
            { "hulk_feet_2" },
            { "hulk_belt_3" },
            { "hulk_armstring_1" },
            { "hulk_amulet_2" },
            { "halk_top_1" },
            { "halk_scarf" },
            { "halk_shoulder_1_r" }
         },
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_hulk_hat_1.sbg',
                            pos = {
                               x = 0,
                               y = -13,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         textures = {
            eye_l = "abori_eye_3_dif.dds",
            eye_r = "abori_eye_3_dif.dds",
            hulk_body = "hybrid_hulk_dif_1.dds",
            hulk_head_serious = "hybrid_hulk_head_dif_1.dds"
         },
      },
      abori_hulk_6 = {
         body = {
            { "hulk_jaws" },
            { "hulk_body" },
            { "eye_l", "eye_r", },
            { "hulk_head_serious" },
            { "hulk_gems_2" },
            { "hulk_flask" },
            { "hulk_gems_1" },
            { "hulk_feet_2" },
            { "hulk_waist_1" },
            { "hulk_glove_2_r" },
            { "hulk_amulet_1" },
            { "halk_shoulder_1_r" },
            { "halk_shoulder_1" },
            { "halk_scarf" },
            { "halk_glove_1" },
            { "hulk_kneeplate_1" },
            { "hulk_belt_2" }
         },
         attachments = {},
         textures = {
            eye_l = "abori_eye_2_dif.dds",
            eye_r = "abori_eye_3_dif.dds",
            hulk_body = "hybrid_hulk_dif_3.dds",
            hulk_head_serious = "hybrid_hulk_head_dif_3.dds"
         },
      },
      abori_hulk_7 = {
         body = {
            { "hulk_body" },
            { "eye_l", "eye_r", },
            { "hulk_head_smiley" },
            { "hulk_jaws" },
            { "hulk_armband_1" },
            { "hulk_waist_2" },
            { "hulk_flask" },
            { "hulk_belt_3" },
            { "hulk_armstring_1" },
            { "hulk_pants_1" },
            { "hulk_necklace_1" },
            { "halk_shoulder_1" },
            { "halk_shoulder_2_r" }
         },
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_hulk_hat_2.sbg',
                            pos = {
                               x = 0,
                               y = -17,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         textures = {
            eye_l = "abori_eye_1_dif.dds",
            eye_r = "abori_eye_1_dif.dds",
            hulk_body = "hybrid_hulk_dif_2.dds",
            hulk_head_smiley = "hybrid_hulk_head_dif_2.dds"
         },
      },
      abori_hulk_8 = {
         body = {
            { "hulk_body" },
            { "eye_l", "eye_r", },
            { "hulk_head_cunning" },
            { "hulk_jaws" },
            { "hulk_amulet_1" },
            { "hulk_waist_1" },
            { "hulk_waist_2" },
            { "hulk_glove_3_r" },
            { "hulk_glove_2" },
            { "hulk_feet_3" },
            { "hulk_belt_3" },
            { "hulk_amulet_1" },
            { "halk_top_1" },
            { "halk_shoulder_2" },
            { "halk_shoulder_1_r" }
         },
         attachments = { {
                            bone = 'head_slot',
                            name = 'sheriff_hat.sbg',
                            pos = {
                               x = 0,
                               y = -13,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1.11,
                               y = 1.11,
                               z = 1.11
                            }
                         } },
         textures = {
            eye_l = "abori_eye_3_dif.dds",
            eye_r = "abori_eye_2_dif.dds",
            hulk_body = "hybrid_hulk_dif_3.dds",
            hulk_head_cunning = "hybrid_hulk_head_dif_3.dds"
         },
      },
      abori_hulk_9 = {
         body = {
            { "hulk_body" },
            { "eye_l", "eye_r", },
            { "hulk_head_base" },
            { "hulk_jaws" },
            { "hulk_chief_arms_1" },
            { "hulk_chief_glove_1" },
            { "hulk_chief_legs_1" },
            { "hulk_chief_necklace_1" },
            { "hulk_chief_pants_1" },
            { "hulk_chief_top_1" },
            { "hulk_chief_waist_1" },
         },
         attachments = { {
                            bone = 'head_slot',
                            name = 'hulk_chief.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         textures = {
            eye_l = "abori_eye_1_dif.dds",
            eye_r = "abori_eye_1_dif.dds",
            hulk_body = "hybrid_hulk_dif_1.dds",
            hulk_head_base = "hybrid_hulk_head_dif_1.dds"
         },
      },
      abori_hulk_10 = {
         body = {
            { "hulk_body_saw" },
            { "eye_l", "eye_r", },
            { "hulk_head_cunning" },
            { "hulk_jaws" },
            { "hulk_powersaw" },
            { "hulk_chief_arms_1" },
            { "hulk_chief_legs_1" },
            { "hulk_chief_necklace_1" },
            { "hulk_chief_pants_1" },
            { "hulk_chief_top_1" },
            { "hulk_chief_waist_1" },
         },
         attachments = { {
                            bone = 'head_slot',
                            name = 'hulk_welder.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         textures = {
            eye_l = "abori_eye_4_dif.dds",
            eye_r = "abori_eye_4_dif.dds",
            hulk_body_saw = "hybrid_hulk_dif_2.dds",
            hulk_head_cunning = "hybrid_hulk_head_dif_2.dds"
         },
      },

   },

   abori = {
      -- ############### ABORI SET STYLES ################
      abori = {
         body = {
            Body.abori.male.head[1],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[1],
            Body.abori.male.top,
            Body.abori.male.bottom,
         },
         attachments = {},
      },
      swift_strider = {
         body = {
            Body.abori.swift_strider.head,
            Body.abori.swift_strider.top,
            Body.abori.swift_strider.bottom,
         },
         attachments = {
         },
      },
      swift_strider_bandaged = {
         body = {
            Body.abori.swift_strider.head,
            Body.abori.swift_strider.top,
            Body.abori.swift_strider.bottom,
            Body.abori.swift_strider.bandages,
         },
         attachments = {
         },
      },
      abori_slave_1 = {
         body = {
            Body.abori.male.head[1],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[1],
            Body.abori.male.top,
            Body.abori.male.bottom,
            Body.abori.slave_1.top,
            Body.abori.slave_1.bottom,
         },
         attachments = {
            { bone = "head_slot", name = "rice_hat.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, }
         },
      },
      abori_slave_2 = {
         body = {
            Body.abori.male.head[1],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[2],
            Body.abori.male.top,
            Body.abori.male.bottom,
            Body.abori.slave_2.top,
            Body.abori.slave_2.bottom,
         },
         attachments = {
         },
      },
      abori_slave_3 = {
         body = {
            Body.abori.male.head[1],
            Body.abori.male.eyes,
            Body.abori.male.top,
            Body.abori.male.bottom,
            Body.abori.slave_3.top,
            Body.abori.slave_3.bottom,
         },
         attachments = {
            { bone = "head_slot", name = "abori_slave_hat_1.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
            { bone = "head_slot", name = "abori_slave_mask_1.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },
      abori_raider_1 = {
         body = {
            Body.abori.male.head[2],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[4],
            Body.abori.male.top,
            Body.abori.male.bottom,
            Body.abori.raider_1.top,
            Body.abori.raider_1.bottom,
         },
         attachments = {
         },
      },
      abori_raider_2 = {
         body = {
            Body.abori.male.head[1],
            Body.abori.male.eyes,
            Body.abori.male.top,
            Body.abori.male.bottom,
            Body.abori.raider_2.top,
            Body.abori.raider_2.bottom,
         },
         attachments = {
            { bone = "head_slot", name = "abori_raider_hat_1.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },
      abori_raider_3 = {
         body = {
            Body.abori.male.head[2],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[3],
            Body.abori.male.top,
            Body.abori.male.bottom,
            Body.abori.raider_3.top,
            Body.abori.raider_3.bottom,
         },
         attachments = {
            { bone = "head_slot", name = "abori_raider_hat_2.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },
      abori_raider_4 = {
         body = {
            Body.abori.male.head[3],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[2],
            Body.abori.male.top,
            Body.abori.male.bottom,
            Body.abori.raider_4.top,
            Body.abori.raider_4.bottom,
         },
         attachments = {
            { bone = "head_slot", name = "abori_raider_hat_3.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },
      abori_trader_1 = {
         body = {
            Body.abori.male.head[1],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[1],
            Body.abori.male.top,
            Body.abori.male.bottom,
            Body.abori.worker_2.top,
            Body.abori.worker_2.bottom,
            { "merchant_bag_1", "merchant_bag_2", "merchant_bag_3", },
         },
         attachments = {
            { bone = "item_slot_bag", name = "merchant_back_pack.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
            { bone = "head_slot", name = "abori_worker_hat_4.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
            { bone = "item_slot1", name = "plasma_spear.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },
      wandering_merchant = {
         attachments = { {
                            bone = 'item_slot_bag',
                            name = 'merchant_back_pack.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_worker_hat_4.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'item_slot1',
                            name = 'plasma_spear.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { {}, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'whiskers_1' }, {
            'abori_male_top' }, { 'abori_male_legs' }, { 'abori_worker_top_2' }, {
                     'abori_worker_legs_2' }, { 'merchant_bag_1', 'merchant_bag_2',
                                                'merchant_bag_3' }, { 'abori_head_2' } },
         textures = {
            abori_head_2 = 'abori_head_dif_2.dds',
            abori_male_legs = 'abori_dif_2.dds',
            abori_male_top = 'abori_dif_2.dds'
         }
      },
      waga_the_tumbleweed = {
         body = {
            Body.abori.male.head[2],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[1],
            Body.abori.male.top,
            Body.abori.male.bottom,
            Body.abori.worker_2.top,
            Body.abori.worker_2.bottom,
            { "merchant_bag_1", "merchant_bag_2", "merchant_bag_3", },
         },
         attachments = {
            { bone = "item_slot_bag", name = "merchant_back_pack.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
            { bone = "head_slot", name = "abori_slave_hat_1.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
            { bone = "item_slot1", name = "plasma_spear.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },

      abori_worker_1 = {
         body = {
            Body.abori.male.head[1],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[2],
            Body.abori.male.top,
            Body.abori.male.bottom,
            Body.abori.worker_1.top,
            Body.abori.worker_1.bottom,
         },
         attachments = {
            { bone = "head_slot", name = "abori_worker_hat_1.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },
      abori_worker_2 = {
         body = {
            Body.abori.male.head[2],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[4],
            Body.abori.male.top,
            Body.abori.male.bottom,
            Body.abori.worker_2.top,
            Body.abori.worker_2.bottom,
         },
         attachments = {
            { bone = "head_slot", name = "abori_worker_hat_3.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },
      abori_worker_3 = {
         body = {
            Body.abori.male.head[3],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[3],
            Body.abori.male.top,
            Body.abori.male.bottom,
            Body.abori.worker_3.top,
            Body.abori.worker_3.bottom,
         },
         attachments = {
            { bone = "head_slot", name = "abori_worker_hat_4.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },
      abori_worker_wounded_1 = {
         body = {
            Body.abori.male.head[1],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[1],
            Body.abori.male.top,
            Body.abori.male.bottom,
            Body.abori.worker_3.bottom,
            Body.abori.bandaged.head,
            Body.abori.bandaged.arm_up_l,
         },
         attachments = {
         },
      },
      abori_worker_wounded_2 = {
         body = {
            Body.abori.male.head[3],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[3],
            Body.abori.male.top,
            Body.abori.male.bottom,
            Body.abori.worker_3.bottom,
            Body.abori.bandaged.head,
            Body.abori.bandaged.arm_up_l,
            Body.abori.bandaged.leg_lo_r,
            Body.abori.bandaged.leg_up_l,
         },
         attachments = {
         },
      },
      abori_outcast_1 = {
         body = {
            Body.abori.male.head[1],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[4],
            Body.abori.male.top,
            Body.abori.male.bottom,
            { "abori_slave_legs_1",
              "abori_slave_top_3",
              "abori_slave_bottom_1",
              "abori_slave_bottom_2", },
         },
         attachments = {},
      },
      abori_outcast_2 = {
         body = {
            Body.abori.male.head[1],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[4],
            Body.abori.male.top,
            Body.abori.male.bottom,
            { "abori_slave_top_1",
              "abori_slave_legs_2",
              "abori_slave_bottom_2", },
         },
         attachments = {},
      },
      abori_outcast_3 = {
         body = {
            Body.abori.male.head[1],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[4],
            Body.abori.male.top,
            Body.abori.male.bottom,
            { "abori_raider_shoulder_1",
              "abori_raider_legs_2", },
         },
         attachments = {
         },
      },
      abori_outcast_4 = {
         body = {
            Body.abori.male.head[3],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[4],
            Body.abori.male.top,
            Body.abori.male.bottom,
            { "abori_slave_legs_1",
              "abori_slave_bottom_3", },
         },
         attachments = {
            { bone = "head_slot", name = "abori_raider_hat_2.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },
      abori_outcast_5 = {
         body = {
            Body.abori.male.head[3],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[4],
            Body.abori.male.top,
            Body.abori.male.bottom,
            { "abori_slave_legs_1",
              "abori_slave_top_3",
              "abori_slave_bottom_1",
              "abori_slave_bottom_2", },
         },
         attachments = {},
      },
      abori_outcast_6 = {
         body = {
            Body.abori.male.head[2],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[4],
            Body.abori.male.top,
            Body.abori.male.bottom,
            { "abori_slave_top_1",
              "abori_slave_legs_2",
              "abori_slave_bottom_2", },
         },
         attachments = {},
      },
      abori_outcast_7 = {
         body = {
            Body.abori.male.head[1],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[4],
            Body.abori.male.top,
            Body.abori.male.bottom,
            { "abori_raider_legs_1",
              "abori_slave_top_3",
              "abori_slave_bottom_1",
              "abori_slave_bottom_2", },
         },
         attachments = { },
      },
      abori_outcast_8 = {
         body = {
            Body.abori.male.head[1],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[4],
            Body.abori.male.top,
            Body.abori.male.bottom,
            { "abori_raider_legs_1",
              "abori_slave_top_3",
              "abori_slave_bottom_1",
              "abori_slave_bottom_2", },
         },
         attachments = {
            { bone = "head_slot", name = "abori_raider_hat_1.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
            { bone = "item_slot1", name = "alien_cactus_bat.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },
      abori_outcast_8_noweapon = {
         body = {
            Body.abori.male.head[1],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[4],
            Body.abori.male.top,
            Body.abori.male.bottom,
            { "abori_raider_legs_1",
              "abori_slave_top_3",
              "abori_slave_bottom_1",
              "abori_slave_bottom_2", },
         },
         attachments = {
            { bone = "head_slot", name = "abori_raider_hat_1.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },
      abori_outcast_hunter = {
         body = { { "eye_l", "eye_r" }, { "abori_teeth_1" }, { "abori_male_legs" }, { "abori_male_top" }, { "abori_head_3" }, { "whiskers_2" }, { "abori_raider_belt_4" }, { "merchant_bag_2" }, { "abori_raider_legs_4" },
                  { "abori_shunter_top_2" } },
         attachments = {
            { name = "abori_bughat.sbg", bone = "head_slot", scale = { y = 1, x = 1, z = 1 }, rot = { y = 0, x = 0, z = 0 }, pos = { y = 0, x = 0, z = 0 } },
            { name = "abori_knife.sbg", bone = "item_slot_bag", scale = { y = 1, x = 1, z = 1 }, rot = { y = -143, x = 102, z = -92 }, pos = { y = 14, x = -2, z = 7 } },
            { name = "wooden_bat.sbg", bone = "item_slot_bag", scale = { y = 1, x = 1, z = 1 }, rot = { y = -143, x = 102, z = -92 }, pos = { y = 24, x = 15, z = 16 } }
         },
      },
      abori_outcast_farmer = {
         attachments = {
            {
               name = "abori_slave_hat_1.sbg",
               bone = "head_slot",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               pos = {
                  y = 0,
                  x = 0,
                  z = 0
               }
            }
         },
         body = {
            { "abori_head_1" }, { "eye_l", "eye_r" }, { "abori_teeth_1" }, { "abori_male_top" }, { "abori_male_legs" }, { "whiskers_4" }, { "abori_raider_bottom_1" }, { "abori_raider_legs_4" }, { "abori_shunter_shoulder_1_r" }
         },
         textures = { abori_head_1 = 'abori_head_dif_3.dds',
                      abori_male_legs = 'abori_dif_3.dds',
                      abori_male_top = 'abori_dif_3.dds',
                      eye_l = 'abori_eye_4_dif.dds',
                      eye_r = 'abori_eye_4_dif.dds' }

      },
      abori_outcast_9 = {
         body = {
            Body.abori.male.head[2],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[4],
            Body.abori.male.top,
            Body.abori.male.bottom,
            { "abori_slave_top_1",
              "abori_slave_legs_2",
              "abori_slave_bottom_2", },
         },
         attachments = {
            { bone = "head_slot", name = "abori_raider_hat_1.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
            { bone = "item_slot1", name = "pipe.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },
      abori_outcast_10 = {
         body = {
            { "abori_male_top" }, { "abori_male_legs" }, { "abori_head_1" }, { "eye_l", "eye_r" }, { "abori_teeth_1" }, { "abori_raider_legs_1" }, { "abori_slave_top_3" }, { "abori_slave_bottom_1" }, { "abori_slave_bottom_2" }
         },
         textures = { abori_head_1 = 'abori_head_dif_2.dds',
                      abori_male_legs = 'abori_dif_2.dds',
                      abori_male_top = 'abori_dif_2.dds',
                      eye_l = 'abori_eye_3_dif.dds',
                      eye_r = 'abori_eye_3_dif.dds' },
         attachments = { },
      },
      abori_outcast_11 = {
         attachments = {
            {
               bone = 'head_slot',
               name = 'boonie_hat.sbg',
               pos = {
                  x = 0,
                  y = -1.3,
                  z = 0.5
               },
               rot = {
                  x = 0,
                  y = 0,
                  z = 0
               },
               scale = {
                  x = 1.17,
                  y = 1.17,
                  z = 1.17
               }
            }
         },
         body = { { 'abori_raider_belt_3' }, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'abori_male_legs' }, { 'abori_raider_bottom_1' }, { 'abori_head_1' },
                  { 'abori_slave_legs_3' }, { 'abori_male_top' }, { 'whiskers_2' }, { 'abori_slave_bottom_2' }, { "abori_slave_top_1" }, { "abori_shunter_top_1" }, },
         textures = {
            abori_head_1 = 'abori_head_dif_4.dds',
            abori_male_legs = 'abori_dif_4.dds',
            abori_male_top = 'abori_dif_4.dds',
            eye_l = 'abori_eye_1_dif.dds',
            eye_r = 'abori_eye_1_dif.dds'
         }
      },
      abori_outcast_12 = {
         attachments = {
            { name = "sledgehammer.sbg", bone = "item_slot_bag", scale = { y = 1, x = 1, z = 1 }, rot = { y = -143, x = 102, z = -92 }, pos = { y = -10, x = 5, z = 1 } }
         },
         body = { { 'whiskers_2' }, { 'abori_head_2' }, { 'eye_l', 'eye_r' }, { 'abori_male_top' }, { 'abori_slave_top_2' }, { 'welder_top_1' }, { 'abori_teeth_1' }, { 'abori_shunter_top_1' },
                  { 'abori_male_legs' }, { 'abori_slave_legs_3' }, },
         textures = {
            abori_head_2 = 'abori_head_dif_2.dds',
            abori_male_legs = 'abori_dif_2.dds',
            abori_male_top = 'abori_dif_2.dds',
            eye_l = 'abori_eye_2_dif.dds',
            eye_r = 'abori_eye_2_dif.dds'
         }
      },
      abori_outcast_13 = {
         textures = {
            eye_l = "abori_eye_4_dif.dds",
            abori_head_1 = "abori_head_dif_2.dds",
            abori_male_legs = "abori_dif_2.dds",
            abori_male_top = "abori_dif_2.dds",
            eye_r = "abori_eye_4_dif.dds"
         },
         attachments = {
            {
               name = "abori_raider_hat_2.sbg",
               bone = "head_slot",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               pos = {
                  y = 0,
                  x = 0,
                  z = 0
               }
            }
         },
         body = {
            { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'abori_male_legs' }, { 'abori_head_1' }, { 'abori_male_top' }, { 'whiskers_1' }, { 'abori_raider_top_1' }, { 'abori_raider_bottom_1' }, { 'abori_slave_legs_1' }
         }
      },
      abori_outcast_14 = {
         textures = {
            eye_l = "abori_eye_1_dif.dds",
            band_thigh_right = "abori_bands_clean_dif.dds",
            abori_male_top = "abori_dif_3.dds",
            eye_r = "abori_eye_1_dif.dds",
            ["hair_dreads.sbg"] = "human_hair_blond_dif.dds",
            abori_male_legs = "abori_dif_3.dds",
            abori_head_3 = "abori_head_dif_3.dds"
         },
         attachments = {
            {
               name = "abori_eyepatch_l.sbg",
               bone = "head_slot",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               pos = {
                  y = 0,
                  x = 0,
                  z = 0
               }
            },
            {
               name = "abori_hulk_hat_1.sbg",
               bone = "head_slot",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               pos = {
                  y = 0,
                  x = 0,
                  z = 0
               }
            }
         },
         body = {
            { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'abori_male_top' }, { 'abori_male_legs' }, { 'abori_raider_legs_1', 'abori_slave_top_3', 'abori_slave_bottom_1', 'abori_slave_bottom_2' }, { 'abori_head_3' }, { 'whiskers_1' }, { 'abori_shunter_top_1' },
            { 'band_thigh_right' }
         }
      },
      abori_outcast_15 = {
         textures = {
            eye_l = "abori_eye_3_dif.dds",
            abori_head_2 = "abori_head_dif_3.dds",
            abori_male_legs = "abori_dif_3.dds",
            abori_male_top = "abori_dif_3.dds",
            eye_r = "abori_eye_3_dif.dds"
         },
         attachments = {
            {
               name = "abori_bandana_4.sbg",
               bone = "head_slot",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               pos = {
                  y = 0,
                  x = 0,
                  z = 0
               }
            },
            {
               name = "abori_worker_hat_4.sbg",
               bone = "head_slot",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               pos = {
                  y = 0,
                  x = 0,
                  z = 0
               }
            }
         },
         body = {
            { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'abori_male_legs' }, { 'abori_slave_top_1' }, { 'abori_male_top' }, { 'abori_head_2' }, { 'whiskers_2' }, { 'abori_slave_legs_2' }
         }
      },

      abori_outcast_16 = {
         textures = {
            eye_l = "abori_eye_1_dif.dds",
            eye_r = "abori_eye_1_dif.dds",
            abori_head_1 = "abori_head_dif_2.dds",
            abori_male_legs = "abori_dif_2.dds",
            abori_male_top = "abori_dif_2.dds",
            band_uparm_right = "abori_bands_clean_dif.dds",
            band_head = "abori_bands_clean_dif.dds"
         },
         attachments = {},
         body = { { 'abori_raider_belt_3' }, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'abori_male_legs' }, { 'abori_raider_bottom_1' }, { 'abori_head_1' }, { 'abori_male_top' }, { 'whiskers_2' }, { 'abori_slave_top_1' },
                  { 'abori_shunter_top_1' }, { 'abori_slave_top_3' }, { 'abori_slave_legs_2' }, { 'band_uparm_right' }, { 'band_head' }
         }
      },
      abori_outcast_17 = {
         attachments = {
            { name = "sledgehammer.sbg", bone = "item_slot_bag", scale = { y = 1, x = 1, z = 1 }, rot = { y = -143, x = 102, z = -92 }, pos = { y = -10, x = -2, z = 1 } }
         },
         body = { { 'whiskers_3' }, { 'abori_head_1' }, { 'eye_l', 'eye_r' }, { 'abori_male_top' }, { 'abori_slave_top_2' }, { 'welder_top_1' }, { 'abori_teeth_1' }, { 'welder_glove_l' },
                  { 'welder_glove_r' }, { 'abori_male_legs' }, { 'abori_slave_legs_3' }, },
         textures = {
            abori_head_1 = 'abori_head_dif_3.dds',
            abori_male_legs = 'abori_dif_3.dds',
            abori_male_top = 'abori_dif_3.dds',
            eye_l = 'abori_eye_4_dif.dds',
            eye_r = 'abori_eye_4_dif.dds'
         }
      },
      abori_outcast_18 = {
         attachments = {
            { name = "sledgehammer.sbg", bone = "item_slot_bag", scale = { y = 1, x = 1, z = 1 }, rot = { y = -143, x = 102, z = -62 }, pos = { y = -10, x = -7, z = 6 } }
         },
         body = { { 'whiskers_1' }, { 'abori_head_3' }, { 'eye_l', 'eye_r' }, { 'abori_male_top' }, { 'welder_top_1' }, { 'abori_teeth_1' }, { 'welder_glove_l' }, { 'welder_glove_r' },
                  { 'abori_male_legs' }, { 'abori_slave_legs_3' }, },
         textures = {
            abori_head_3 = 'abori_head_dif_1.dds',
            abori_male_legs = 'abori_dif_1.dds',
            abori_male_top = 'abori_dif_1.dds',
            eye_l = 'abori_eye_3_dif.dds',
            eye_r = 'abori_eye_3_dif.dds'
         }
      },

      -- ############### ABORI NPC STYLES ################
      juggo = {
         attachments = { {
                            bone = 'item_slot_bag',
                            name = 'alien_cactus_bat.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 10
                            },
                            rot = {
                               x = 20,
                               y = 0,
                               z = 30
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_hulk_hat_1.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'whiskers_2' }, {
            'abori_male_top' }, { 'abori_male_legs' }, { 'abori_slave_collar',
                                                         'abori_raider_shoulder_1', 'abori_raider_legs_2' }, { 'abori_head_3' } },
         textures = {
            abori_head_3 = 'abori_head_dif_2.dds',
            abori_male_legs = 'abori_dif_2.dds',
            abori_male_top = 'abori_dif_2.dds',
            eye_l = 'abori_eye_3_dif.dds',
            eye_r = 'abori_eye_3_dif.dds'
         }
      },
      chew = {
         attachments = { {
                            bone = 'item_slot_bag',
                            name = 'alien_cactus_bat.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 10
                            },
                            rot = {
                               x = 20,
                               y = 0,
                               z = 30
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_slave_mask_1.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'whiskers_3' }, {
            'abori_male_top' }, { 'abori_male_legs' }, { 'abori_slave_collar',
                                                         'abori_slave_top_1', 'abori_slave_legs_2' }, { 'abori_head_1' } },
         textures = {
            abori_head_1 = 'abori_head_dif_3.dds',
            abori_male_legs = 'abori_dif_3.dds',
            abori_male_top = 'abori_dif_3.dds',
            eye_l = 'abori_eye_2_dif.dds',
            eye_r = 'abori_eye_2_dif.dds'
         }
      },
      guard_4 = {
         attachments = { {
                            bone = 'item_slot1',
                            name = 'alien_cactus_bat.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_bughat.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'abori_head_1' }, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, {
            'abori_male_top' }, { 'abori_male_legs' }, { 'abori_raider_legs_1',
                                                         'abori_slave_top_3', 'abori_slave_bottom_1', 'abori_slave_bottom_2' }, {
                     'abori_raider_shoulder_1' }, { 'abori_raider_shoulder_1_r' } },
         textures = {}

      },
      ampa = {
         attachments = { {
                            bone = 'item_slot_bag',
                            name = 'alien_cactus_bat.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 10
                            },
                            rot = {
                               x = 20,
                               y = 0,
                               z = 30
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_worker_hat_4.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { {}, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'whiskers_4' }, {
            'abori_male_top' }, { 'abori_male_legs' }, { 'abori_slave_collar',
                                                         'abori_slave_top_3', 'abori_slave_bottom_3', 'abori_slave_legs_3' }, {
                     'abori_head_2' } },
         textures = {
            abori_head_2 = 'abori_head_dif_1.dds',
            abori_male_legs = 'abori_dif_1.dds',
            abori_male_top = 'abori_dif_1.dds'
         }
      },
      old_mug = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'sheriff_hat.sbg',
                            pos = {
                               x = 0,
                               y = 1,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1.2,
                               y = 1.2,
                               z = 1.2
                            }
                         } },
         body = { {}, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'abori_male_top' }
         , { 'abori_male_legs' }, { 'abori_slave_collar', 'abori_slave_top_2',
                                    'abori_worker_legs_1', 'abori_slave_legs_2' }, { 'abori_head_2' }, {
                     'whiskers_4' } },
         textures = {
            abori_head_2 = 'abori_head_dif_3.dds',
            abori_male_legs = 'abori_dif_3.dds',
            abori_male_top = 'abori_dif_3.dds',
            eye_l = 'abori_eye_4_dif.dds',
            eye_r = 'abori_eye_4_dif.dds'
         }
      },
      nab = {
         attachments = { {
                            bone = 'item_slot1',
                            name = 'beacon_light.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_hulk_hat_3.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { {}, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'whiskers_4' }, {
            'abori_male_top' }, { 'abori_male_legs' }, { 'abori_slave_collar',
                                                         'abori_slave_top_2', 'abori_slave_legs_2', 'abori_slave_bottom_2' }, {
                     'abori_head_2' } },
         textures = {}
      },
      paga = {
         body = {
            Body.abori.male.head[2],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[2],
            Body.abori.male.top,
            Body.abori.male.bottom,
            { "abori_slave_collar",
              "abori_raider_legs_1",
              "abori_slave_top_3",
              "abori_slave_top_1", },
         },
         attachments = {
            { bone = "head_slot", name = "abori_raider_hat_1.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },

      carry_the_stone = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_worker_hat_4.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'abori_male_legs' }, {
            'abori_male_top' }, { 'abori_head_1' }, { 'whiskers_4' }, {
                     'abori_worker_legs_1' }, { 'abori_worker_top_3' }, { 'band_uparm_right' }, {
                     'abori_raider_legs_1' }, { 'abori_raider_shoulder_1' }, {
                     'abori_slave_top_3' }, { "cs_box" } },
         textures = { abori_head_1 = 'abori_head_dif_2.dds',
                      abori_male_legs = 'abori_dif_2.dds',
                      abori_male_top = 'abori_dif_2.dds',
                      eye_l = 'abori_eye_2_dif.dds',
                      eye_r = 'abori_eye_2_dif.dds' }
      },

      msasi = {
         attachments = { {
                            bone = 'item_slot_bag',
                            name = 'abori_gun_rifle.sbg',
                            pos = {
                               x = 10,
                               y = 20,
                               z = 0
                            },
                            rot = {
                               x = 90,
                               y = 160,
                               z = -90
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_raider_hat_2.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_hulk_hat_2.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'abori_male_top' }, {
            'abori_male_legs' }, { 'abori_raider_shoulder_1', 'abori_raider_legs_2' }, {
                     'abori_head_1' }, { 'whiskers_4' } },
         textures = {
            abori_head_1 = 'abori_head_dif_3.dds',
            abori_male_legs = 'abori_dif_3.dds',
            abori_male_top = 'abori_dif_3.dds'
         }
      },
      mute = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_raider_hat_1.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { {}, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'whiskers_1' }, {
            'abori_male_top' }, { 'abori_male_legs' }, { 'abori_slave_collar',
                                                         'abori_slave_top_3', 'abori_slave_top_1' }, { 'abori_head_1' } },
         textures = {
            abori_head_1 = 'abori_head_dif_2.dds',
            abori_male_legs = 'abori_dif_2.dds',
            abori_male_top = 'abori_dif_2.dds',
            eye_l = 'abori_eye_3_dif.dds',
            eye_r = 'abori_eye_3_dif.dds'
         }
      },
      abori_prisoner = {
         body = {
            Body.abori.male.head[1],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[2],
            Body.abori.male.top,
            Body.abori.male.bottom,
            { "abori_slave_top_3",
              "abori_slave_top_1", },
         },
         attachments = {
         },
      },
      kampa = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_raider_hat_2.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { {}, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'whiskers_4' }, {
            'abori_male_top' }, { 'abori_male_legs' }, { 'abori_slave_collar',
                                                         'abori_raider_shoulder_1', 'abori_raider_legs_2' }, { 'abori_head_3' }, {
                     'abori_head_1' } },
         textures = {
            abori_head_1 = 'abori_head_dif_3.dds',
            abori_head_3 = 'abori_head_dif_3.dds',
            abori_male_legs = 'abori_dif_3.dds',
            abori_male_top = 'abori_dif_3.dds'
         }
      },
      kwagga = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_worker_hat_3.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'abori_head_2' }, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, {
            'whiskers_4' }, { 'abori_male_top' }, { 'abori_male_legs' }, {
                     'abori_worker_top_2' }, { 'abori_worker_legs_2' } },
         textures = {
            abori_head_2 = 'abori_head_dif_2.dds',
            abori_male_legs = 'abori_dif_2.dds',
            abori_male_top = 'abori_dif_2.dds'
         }

      },
      croaker = {
         body = {
            Body.abori.male.head[1],
            Body.abori.male.eyes,
            Body.abori.male.top,
            Body.abori.male.bottom,
            { "abori_slave_collar",
              "abori_raider_legs_2", },
         },
         attachments = {
            { bone = "head_slot", name = "abori_slave_mask_1.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
            { bone = "item_slot1", name = "big_spoon.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },
      obai = {
         body = {
            Body.abori.male.head[1],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[2],
            Body.abori.male.top,
            Body.abori.male.bottom,
            { "abori_raider_legs_2", },
         },
         attachments = {
            { bone = "head_slot", name = "abori_slave_mask_1.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },
      mister_green = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_raider_hat_2.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'item_slot1',
                            name = 'big_spoon.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_hulk_hat_3.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_hulk_hat_2.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { {}, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'whiskers_1' }, {
            'abori_male_top' }, { 'abori_male_legs' }, { 'abori_raider_shoulder_1',
                                                         'abori_raider_legs_2' }, { 'abori_head_1' } },
         textures = {
            abori_head_1 = 'abori_head_dif_4.dds',
            abori_male_legs = 'abori_dif_4.dds',
            abori_male_top = 'abori_dif_4.dds',
            eye_l = 'abori_eye_4_dif.dds',
            eye_r = 'abori_eye_4_dif.dds'
         }
      },
      angry_jag = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_worker_hat_4.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_hulk_hat_2.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'abori_head_3' }, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, {
            'whiskers_3' }, { 'abori_male_top' }, { 'abori_male_legs' }, {
                     'abori_slave_top_3', 'abori_slave_legs_3', 'abori_slave_bottom_3' } },
         textures = {
            abori_head_3 = 'abori_head_dif_2.dds',
            abori_male_legs = 'abori_dif_2.dds',
            abori_male_top = 'abori_dif_2.dds'
         }
      },
      angry_outcast = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_bandana_4.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { {}, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'whiskers_4' }, {
            'abori_male_top' }, { 'abori_male_legs' }, { 'abori_slave_legs_1',
                                                         'abori_slave_top_3', 'abori_slave_bottom_1', 'abori_slave_bottom_2' }, {
                     'abori_head_2' }, { 'band_ssleg_right' }, { 'band_leg_right' }, {
                     'band_loarm_left' } },
         textures = {}

      },
      big_hat = {
         attachments = {},
         body = { { 'abori_head_1' }, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, {
            'whiskers_4' }, { 'abori_male_top' }, { 'abori_male_legs' }, {
                     'abori_raider_shoulder_1', 'abori_raider_legs_2' }, { 'abori_head_3' }, {
                     'abori_slave_top_2' }, { 'band_uparm_left' } },
         textures = {
            abori_head_1 = 'abori_head_dif_1.dds',
            abori_head_3 = 'abori_head_dif_1.dds',
            abori_male_legs = 'abori_dif_1.dds',
            abori_male_top = 'abori_dif_1.dds',
            eye_l = 'abori_eye_4_dif.dds',
            eye_r = 'abori_eye_4_dif.dds'
         }

      },
      pale = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_raider_hat_2.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_hulk_hat_2.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'hair_dreads.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'whiskers_4' }, {
            'abori_male_top' }, { 'abori_male_legs' }, { 'abori_slave_legs_1',
                                                         'abori_slave_bottom_3' }, { 'abori_head_2' } },
         textures = {
            abori_head_2 = 'abori_head_dif_4.dds',
            abori_male_legs = 'abori_dif_4.dds',
            abori_male_top = 'abori_dif_4.dds',
            eye_l = 'abori_eye_3_dif.dds',
            eye_r = 'abori_eye_3_dif.dds'
         }
      },
      pales_follower_1 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_slave_hat_1.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, },
         body = { { 'band_loarm_left' }, { 'abori_raider_bottom_1' }, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'abori_male_legs' }, { 'abori_slave_top_3' }, { 'abori_slave_top_1' },
                  { 'whiskers_3' }, { 'abori_raider_legs_1' }, { 'abori_male_top' }, { 'band_uparm_left' }, { 'abori_head_3' }, { 'band_uparm_right' }, { 'band_loarm_right' }, },
         textures = {
            abori_head_3 = 'abori_head_dif_1.dds',
            abori_male_legs = 'abori_dif_1.dds',
            abori_male_top = 'abori_dif_1.dds',
            eye_l = 'abori_eye_2_dif.dds',
            eye_r = 'abori_eye_3_dif.dds'
         }
      },

      pales_follower_2 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_raider_hat_2.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, },
         body = { { 'abori_slave_legs_2' }, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'abori_male_legs' }, { 'abori_shunter_shoulder_1' }, { 'abori_raider_top_1' }, { 'abori_head_2' },
                  { 'abori_male_top' }, { 'whiskers_4' }, },
         textures = {
            abori_head_2 = 'abori_head_dif_1.dds',
            abori_male_legs = 'abori_dif_1.dds',
            abori_male_top = 'abori_dif_1.dds',
            eye_l = 'abori_eye_4_dif.dds',
            eye_r = 'abori_eye_4_dif.dds'
         }
      },

      pales_follower_3 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'boonie_hat.sbg',
                            pos = {
                               x = 0,
                               y = 5.7,
                               z = 0.8
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1.17,
                               y = 1.17,
                               z = 1.17
                            }
                         }, },
         body = { { 'whiskers_2' }, { 'abori_head_1' }, { 'eye_l', 'eye_r' }, { 'abori_male_top' }, { 'abori_slave_top_2' }, { 'abori_slave_top_1' }, { 'abori_teeth_1' }, { 'abori_shunter_top_1' },
                  { 'abori_male_legs' }, { 'band_head' }, { 'abori_slave_legs_3' }, },
         textures = {
            abori_head_1 = 'abori_head_dif_2.dds',
            abori_male_legs = 'abori_dif_2.dds',
            abori_male_top = 'abori_dif_2.dds',
            eye_l = 'abori_eye_1_dif.dds',
            eye_r = 'abori_eye_1_dif.dds'
         }
      },

      pales_follower_4 = {
         attachments = {},
         body = { { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'abori_male_top' }, { 'abori_male_legs' }, { 'abori_raider_bottom_1' }, { 'abori_slave_legs_3' }, { 'abori_slave_bottom_2' },
                  { 'abori_head_1' }, { 'whiskers_3' }, { 'abori_raider_belt_1' }, { 'abori_raider_shoulder_1_r' }, { 'abori_shunter_top_1' }, },
         textures = {
            abori_head_1 = 'abori_head_dif_3.dds',
            abori_male_legs = 'abori_dif_3.dds',
            abori_male_top = 'abori_dif_3.dds',
            eye_l = 'abori_eye_2_dif.dds',
            eye_r = 'abori_eye_2_dif.dds'
         }
      },

      pales_follower_5 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'bullet_hat_2.sbg',
                            pos = {
                               x = 0,
                               y = 3,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1.1,
                               y = 1.1,
                               z = 1.1
                            }
                         }, },
         body = { { 'abori_raider_belt_3' }, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'abori_male_legs' }, { 'abori_raider_bottom_1' }, { 'band_ssleg_left' }, { 'abori_head_2' },
                  { 'abori_slave_legs_3' }, { 'abori_male_top' }, { 'whiskers_2' }, { 'abori_slave_bottom_2' }, },
         textures = {
            abori_head_2 = 'abori_head_dif_1.dds',
            abori_male_legs = 'abori_dif_1.dds',
            abori_male_top = 'abori_dif_1.dds',
            eye_l = 'abori_eye_1_dif.dds',
            eye_r = 'abori_eye_1_dif.dds'
         }
      },

      mad_shaman = {
         body = {
            Body.abori.male.head[2],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[1],
            Body.abori.male.top,
            Body.abori.male.bottom,
            { "abori_slave_bottom_2", },
         },
         attachments = {},
      },
      sly = {
         attachments = { {
                            bone = 'item_slot1',
                            name = 'abori_gun_pistol.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_hulk_hat_3.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'abori_head_1' }, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, {
            'whiskers_4' }, { 'abori_male_top' }, { 'abori_male_legs' }, {
                     'abori_raider_legs_1', 'abori_slave_top_3', 'abori_raider_bottom_1',
                     'abori_slave_bottom_2' } },
         textures = {
            abori_head_1 = 'abori_head_dif_3.dds',
            abori_male_legs = 'abori_dif_3.dds',
            abori_male_top = 'abori_dif_3.dds'
         }
      },
      ouga = {
         attachments = { {
                            bone = 'item_slot_bag',
                            name = 'shovel.sbg',
                            pos = {
                               x = -20,
                               y = 60,
                               z = 10
                            },
                            rot = {
                               x = 100,
                               y = 200,
                               z = 90
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_raider_hat_1.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'abori_head_2' }, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, {
            'whiskers_2' }, { 'abori_male_top' }, { 'abori_male_legs' }, {
                     'abori_slave_collar', 'abori_raider_legs_1', 'abori_slave_top_3',
                     'abori_slave_bottom_3' } },
         textures = {
            abori_head_2 = 'abori_head_dif_3.dds',
            abori_male_legs = 'abori_dif_3.dds',
            abori_male_top = 'abori_dif_3.dds'
         }
      },
      outcast_1 = {
         attachments = {},
         body = { { 'abori_head_1' }, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, {
            'whiskers_4' }, { 'abori_male_top' }, { 'abori_male_legs' }, {
                     'abori_slave_top_1', 'abori_slave_legs_2', 'abori_slave_bottom_2' }, {
                     'band_head' } },
         textures = {}

      },
      outcast_guard_1 = {
         attachments = { {
                            bone = 'item_slot1',
                            name = 'pipe.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_bughat.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'abori_head_2' }, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, {
            'abori_male_top' }, { 'abori_male_legs' }, { 'abori_slave_top_1',
                                                         'abori_slave_legs_2', 'abori_slave_bottom_2' }, { 'abori_raider_shoulder_1_r'
                  }, { 'abori_raider_shoulder_1' } },
         textures = {
            abori_head_2 = 'abori_head_dif_3.dds',
            abori_male_legs = 'abori_dif_3.dds',
            abori_male_top = 'abori_dif_3.dds'
         }

      },
      outcast_guard_1_noweapon = {
         attachments = {
            {
               bone = 'head_slot',
               name = 'abori_bughat.sbg',
               pos = {
                  x = 0,
                  y = 0,
                  z = 0
               },
               rot = {
                  x = 0,
                  y = 0,
                  z = 0
               },
               scale = {
                  x = 1,
                  y = 1,
                  z = 1
               }
            } },
         body = { { 'abori_head_2' }, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, {
            'abori_male_top' }, { 'abori_male_legs' }, { 'abori_slave_top_1',
                                                         'abori_slave_legs_2', 'abori_slave_bottom_2' }, { 'abori_raider_shoulder_1_r'
                  }, { 'abori_raider_shoulder_1' } },
         textures = {
            abori_head_2 = 'abori_head_dif_3.dds',
            abori_male_legs = 'abori_dif_3.dds',
            abori_male_top = 'abori_dif_3.dds'
         }

      },
      outcast_guard_2 = {
         attachments = { {
                            bone = 'item_slot1',
                            name = 'alien_cactus_bat.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_bughat.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'abori_head_1' }, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, {
            'abori_male_top' }, { 'abori_male_legs' }, { 'abori_raider_legs_1',
                                                         'abori_slave_top_3', 'abori_slave_bottom_1', 'abori_slave_bottom_2' }, {
                     'abori_raider_shoulder_1' }, { 'abori_raider_shoulder_1_r' }, {
                     'band_loarm_right' }, { 'band_loarm_left' } },
         textures = {
            abori_head_1 = 'abori_head_dif_2.dds',
            abori_male_legs = 'abori_dif_2.dds',
            abori_male_top = 'abori_dif_2.dds'
         }

      },
      outcast_guard_3 = {
         attachments = { {
                            bone = 'item_slot1',
                            name = 'alien_cactus_bat.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_bughat.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'abori_head_1' }, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, {
            'abori_male_top' }, { 'abori_male_legs' }, { 'abori_raider_legs_1',
                                                         'abori_slave_top_3', 'abori_slave_bottom_1', 'abori_slave_bottom_2' }, {
                     'abori_raider_shoulder_1_r' }, { 'abori_raider_shoulder_1' } },
         textures = {
            abori_head_1 = 'abori_head_dif_2.dds',
            abori_male_legs = 'abori_dif_2.dds',
            abori_male_top = 'abori_dif_2.dds'
         }

      },
      outcast_guard_3_noweapon = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_bughat.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'abori_head_1' }, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, {
            'abori_male_top' }, { 'abori_male_legs' }, { 'abori_raider_legs_1',
                                                         'abori_slave_top_3', 'abori_slave_bottom_1', 'abori_slave_bottom_2' }, {
                     'abori_raider_shoulder_1_r' }, { 'abori_raider_shoulder_1' } },
         textures = {
            abori_head_1 = 'abori_head_dif_2.dds',
            abori_male_legs = 'abori_dif_2.dds',
            abori_male_top = 'abori_dif_2.dds',
            eye_l = 'abori_eye_4_dif.dds',
            eye_r = 'abori_eye_4_dif.dds'
         }

      },
      outcast_guard_4 = {
         textures = {
            eye_l = "abori_eye_3_dif.dds",
            abori_head_2 = "abori_head_dif_4.dds",
            ["hair_long_backward.sbg"] = "human_hair_blond_dif.dds",
            abori_male_legs = "abori_dif_4.dds",
            ["hair_dreads.sbg"] = "human_hair_white_dif.dds",
            abori_male_top = "abori_dif_4.dds",
            eye_r = "abori_eye_4_dif.dds"
         },
         attachments = {
            {
               name = "abori_bughat.sbg",
               bone = "head_slot",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               pos = {
                  y = 0,
                  x = 0,
                  z = 0
               }
            },
            {
               pos = {
                  y = 4,
                  x = 0,
                  z = 11
               },
               name = "hair_dreads.sbg",
               bone = "head_slot",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               texture = "human_hair_white_dif.dds"
            },
            {
               name = "abori_axe.sbg",
               bone = "item_slot1",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               pos = {
                  y = 0,
                  x = 0,
                  z = 0
               }
            }
         },
         body = {
            { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'abori_male_legs' }, { 'abori_head_2' }, { 'abori_male_top' }, { 'whiskers_3' }, { 'abori_raider_belt_3' }, { 'abori_raider_belt_1' }, { 'abori_raider_legs_4' }, { 'abori_raider_shoulder_1' },
            { 'abori_raider_shoulder_1_r' }, { 'abori_raider_shoulder_2' }, { 'abori_slave_top_1' }
         }
      },
      outcast_guard_5 = {
         textures = {
            eye_l = "abori_eye_1_dif.dds",
            abori_head_3 = "abori_head_dif_2.dds",
            abori_male_legs = "abori_dif_2.dds",
            ["hair_dreads.sbg"] = "human_hair_white_dif.dds",
            abori_male_top = "abori_dif_2.dds",
            eye_r = "abori_eye_1_dif.dds"
         },
         attachments = {
            {
               name = "abori_bughat.sbg",
               bone = "head_slot",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               pos = {
                  y = 0,
                  x = 0,
                  z = 0
               }
            },
            {
               name = "machete.sbg",
               bone = "item_slot1",
               scale = {
                  y = 1,
                  x = 1,
                  z = 1
               },
               rot = {
                  y = 0,
                  x = 0,
                  z = 0
               },
               pos = {
                  y = 0,
                  x = 0,
                  z = 0
               }
            }
         },
         body = {
            { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'abori_male_legs' }, { 'abori_head_3' }, { 'abori_male_top' }, { 'whiskers_3' }, { 'abori_raider_belt_3' }, { 'abori_raider_belt_1' }, { 'abori_raider_legs_4' }, { 'abori_raider_shoulder_1' },
            { 'abori_raider_shoulder_1_r' }, { 'abori_raider_shoulder_2' }, { 'abori_slave_top_1' }
         }
      },

      mugs_abori_1 = {
         body = {
            Body.abori.male.head[3],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[4],
            Body.abori.male.top,
            Body.abori.male.bottom,
            { "abori_slave_collar",
              "abori_slave_legs_3",
              "abori_slave_top_1", },
         },
         attachments = {
            { bone = "head_slot", name = "abori_raider_hat_2.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },
      mugs_abori_2 = {
         body = {
            Body.abori.male.head[2],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[3],
            Body.abori.male.top,
            Body.abori.male.bottom,
            { "abori_slave_collar",
              "abori_slave_top_3",
              "abori_slave_top_1", },
         },
         attachments = {
            { bone = "head_slot", name = "abori_raider_hat_1.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },
      mugs_abori_3 = {
         body = {
            Body.abori.male.head[1],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[2],
            Body.abori.male.top,
            Body.abori.male.bottom,
            { "abori_slave_collar",
              "abori_raider_legs_2", },
         },
         attachments = {
            { bone = "head_slot", name = "abori_slave_mask_1.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },
      mugs_abori_4 = {
         body = {
            Body.abori.male.head[1],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[1],
            Body.abori.male.top,
            Body.abori.male.bottom,
            { "abori_slave_legs_2",
              "abori_slave_collar",
              "abori_slave_bottom_3",
              "abori_slave_top_2", },
         },
         attachments = {
            { bone = "head_slot", name = "abori_worker_hat_4.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },
      stone_heads_scout_1 = {
         body = {
            Body.abori.male.head[1],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[3],
            Body.abori.male.top,
            Body.abori.male.bottom,
            Body.abori.raider_4.top,
            Body.abori.raider_4.bottom,
         },
         attachments = {
            { bone = "head_slot", name = "abori_raider_hat_3.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
            { bone = "item_slot1", name = "abori_gun_rifle.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },
      stone_heads_scout_2 = {
         body = {
            Body.abori.male.head[3],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[2],
            Body.abori.male.top,
            Body.abori.male.bottom,
            Body.abori.raider_4.top,
            Body.abori.raider_4.bottom,
         },
         attachments = {
            { bone = "item_slot1", name = "abori_gun_rifle.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
            { bone = "head_slot", name = "abori_raider_hat_3.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },
      skeleton_abori = {
         textures = {},
         attachments = {},
         body = { {'abori_skeleton'} }
      },
      stone_heads_scout_1_bandit = {
         body = {
            Body.abori.male.head[2],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[4],
            Body.abori.male.top,
            Body.abori.male.bottom,
            Body.abori.raider_4.top,
            Body.abori.raider_4.bottom,
         },
         attachments = {
            { bone = "head_slot", name = "abori_raider_hat_3.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },
      stone_heads_scout_2_bandit = {
         body = {
            Body.abori.male.head[1],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[3],
            Body.abori.male.top,
            Body.abori.male.bottom,
            Body.abori.raider_4.top,
            Body.abori.raider_4.bottom,
         },
         attachments = {
            { bone = "head_slot", name = "abori_raider_hat_3.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },
      stone_heads_warrior_1_bandit = {
         body = {
            Body.abori.male.head[1],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[1],
            Body.abori.male.top,
            Body.abori.male.bottom,
            Body.abori.raider_2.top,
            Body.abori.raider_2.bottom,
         },
         attachments = {
            { bone = "head_slot", name = "abori_raider_hat_1.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },
      stone_heads_warrior_2_bandit = {
         body = {
            Body.abori.male.head[2],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[1],
            Body.abori.male.top,
            Body.abori.male.bottom,
            Body.abori.raider_1.top,
            Body.abori.raider_1.bottom,
         },
         attachments = {
         },
      },
      stone_heads_warrior_1 = {
         body = {
            Body.abori.male.head[3],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[2],
            Body.abori.male.top,
            Body.abori.male.bottom,
            Body.abori.raider_2.top,
            Body.abori.raider_2.bottom,
         },
         attachments = {
            { bone = "item_slot1", name = "abori_gun_rifle.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
            { bone = "head_slot", name = "abori_raider_hat_1.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },
      stone_heads_warrior_2 = {
         attachments = { {
                            bone = 'item_slot1',
                            name = 'abori_gun_pistol.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_hulk_hat_1.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'abori_head_3' }, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, {
            'whiskers_4' }, { 'abori_male_top' }, { 'abori_male_legs' }, {
                     'abori_raider_top_1', 'abori_raider_shoulder_1' }, { 'abori_raider_legs_1',
                                                                          'abori_raider_bottom_1', 'abori_raider_belt_1' } },
         textures = {
            abori_head_3 = 'abori_head_dif_4.dds',
            abori_male_legs = 'abori_dif_4.dds',
            abori_male_top = 'abori_dif_4.dds',
            eye_l = 'abori_eye_4_dif.dds',
            eye_r = 'abori_eye_4_dif.dds'
         }
      },
      stone_heads_warrior_3 = {
         body = {
            Body.abori.male.head[3],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[1],
            Body.abori.male.top,
            Body.abori.male.bottom,
            Body.abori.raider_2.top,
            Body.abori.raider_2.bottom,
         },
         attachments = {
            { bone = "item_slot1", name = "abori_gun_pistol.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
            { bone = "head_slot", name = "abori_raider_hat_1.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
         },
      },
      stone_heads_warrior_4 = {
         attachments = { {
                            bone = 'item_slot1',
                            name = 'abori_gun_mortar.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_raider_hat_3.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_solarhat.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'abori_head_3' }, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, {
            'whiskers_1' }, { 'abori_male_top' }, { 'abori_male_legs' }, {
                     'abori_raider_top_4' }, { 'abori_raider_legs_4', 'abori_raider_bottom_1',
                                               'abori_raider_belt_4' } },
         textures = {
            abori_head_3 = 'abori_head_dif_2.dds',
            abori_male_legs = 'abori_dif_2.dds',
            abori_male_top = 'abori_dif_2.dds'
         }
      },
      stone_heads_warrior_5 = {
         attachments = { {
                            bone = 'item_slot1',
                            name = 'abori_gun_mortar.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_bandana_4.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_solarhat.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'abori_head_3' }, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, {
            'whiskers_1' }, { 'abori_male_top' }, { 'abori_male_legs' }, {
                     'abori_raider_top_1', 'abori_raider_shoulder_1', 'abori_raider_shoulder_2' }, {
                     'abori_raider_legs_2', 'abori_raider_bottom_1', 'abori_raider_belt_2' } },
         textures = {}
      },
      tired_outcast = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_bandana_3.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'abori_head_1' }, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, {
            'abori_male_top' }, { 'abori_male_legs' }, { 'abori_raider_legs_1',
                                                         'abori_slave_top_3', 'abori_slave_bottom_1', 'abori_slave_bottom_2' } },
         textures = {
            abori_head_1 = 'abori_head_dif_3.dds',
            abori_male_legs = 'abori_dif_3.dds',
            abori_male_top = 'abori_dif_3.dds'
         }

      },
      twitchy_outcast = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'boonie_hat.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'abori_head_1' }, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, {
            'whiskers_4' }, { 'abori_male_top' }, { 'abori_male_legs' }, {
                     'abori_raider_legs_1', 'abori_slave_top_3', 'abori_slave_bottom_1',
                     'abori_slave_bottom_2' }, { 'band_loarm_right' }, { 'band_loarm_left' } },
         textures = {}

      },
      vorga = {
         attachments = { {
                            bone = 'item_slot_bag',
                            name = 'abori_gun_rifle.sbg',
                            pos = {
                               x = 10,
                               y = 20,
                               z = 0
                            },
                            rot = {
                               x = 90,
                               y = 160,
                               z = -90
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_raider_hat_2.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'abori_male_top' }, {
            'abori_male_legs' }, { 'abori_raider_shoulder_1', 'abori_raider_legs_2' }, {
                     'whiskers_3' }, { 'abori_head_2' } },
         textures = {
            abori_head_2 = 'abori_head_dif_2.dds',
            abori_male_legs = 'abori_dif_2.dds',
            abori_male_top = 'abori_dif_2.dds'
         }

      },
      stone_heads_warchief = {
         attachments = { {
                            bone = 'item_slot_bag',
                            name = 'shotgun.sbg',
                            pos = {
                               x = 10,
                               y = 20,
                               z = 0
                            },
                            rot = {
                               x = 90,
                               y = 160,
                               z = -90
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_raider_hat_2.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_eyepatch_l.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = -1
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'abori_head_3' }, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, {
            'whiskers_4' }, { 'abori_male_top' }, { 'abori_male_legs' }, {
                     'abori_raider_top_3' }, { 'abori_raider_legs_3', 'abori_raider_bottom_1',
                                               'abori_raider_belt_3' } },
         textures = {
            abori_head_3 = 'abori_head_dif_1.dds',
            abori_male_legs = 'abori_dif_1.dds',
            abori_male_top = 'abori_dif_1.dds'
         }
      },
      stone_heads_trader = {
         body = {
            Body.abori.male.head[1],
            Body.abori.male.eyes,
            Body.abori.male.teeth,
            Body.abori.male.whiskers[2],
            Body.abori.male.top,
            Body.abori.male.bottom,
            Body.abori.raider_2.top,
            Body.abori.raider_2.bottom,
            { "merchant_bag_1", "merchant_bag_2", "merchant_bag_3", },
         },
         attachments = {
            { bone = "item_slot_bag", name = "merchant_back_pack.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
            { bone = "head_slot", name = "abori_worker_hat_4.sbg", pos = { x = 0, y = 0, z = 0 }, rot = { x = 0, y = 0, z = 0 }, scale = { x = 1, y = 1, z = 1 }, },
            --         { bone = "item_slot1", name = "plasma_spear.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
         },
      },
      abori_bandit_1 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_raider_hat_1.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         } },
         body = { { 'eye_l' }, { 'eye_r' }, { 'abori_teeth_1' }, { 'abori_male_top' }, {
            'abori_male_legs' }, { 'abori_slave_top_2' }, { 'abori_raider_legs_2' }, {
                     'abori_head_3' } }
      },
      abori_bandit_2 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'biker_mask.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         }, {
                            bone = 'head_slot',
                            name = 'hair_dreads.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         } },
         body = { { 'eye_l' }, { 'eye_r' }, { 'abori_head_2' }, {
            'abori_male_top' }, { 'abori_male_legs' }, { 'abori_slave_top_1' }, {
                     'abori_slave_legs_2' }, { 'abori_raider_top_4' } }
      },
      abori_bandit_3 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_slave_mask_1.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_slave_hat_1.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         } },
         body = { { 'eye_l' }, { 'eye_r' }, { 'abori_head_2' }, {
            'abori_male_legs' }, { 'abori_slave_top_3' }, { 'abori_raider_top_3' }, {
                     'abori_slave_legs_3' }, { 'abori_slave_bottom_3' }, { 'abori_male_top' } }
      },
      abori_bandit_4 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_worker_hat_4.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_raider_hat_2.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_slave_mask_1.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         } },
         body = { { 'eye_l' }, { 'eye_r' }, { 'abori_head_3' }, {
            'abori_male_top' }, { 'abori_male_legs' }, { 'abori_raider_belt_4' }, {
                     'abori_raider_top_1' }, { 'abori_slave_legs_2' }, {
                     'abori_raider_shoulder_1' } }
      },
      abori_bandit_5 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'biker_mask_2.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         }, {
                            bone = 'head_slot',
                            name = 'rice_hat.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         } },
         body = { { 'eye_l' }, { 'eye_r' }, { 'abori_head_1' }, {
            'abori_male_top' }, { 'abori_male_legs' }, { 'abori_raider_bottom_1' }, {
                     'abori_raider_legs_4' }, { 'abori_raider_shoulder_1' }, {
                     'abori_slave_top_3' }, { 'abori_slave_collar' }, { 'abori_slave_bottom_3' }
         }
      },
      abori_bandit_6 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'boonie_hat.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         } },
         body = { { 'eye_l' }, { 'eye_r' }, { 'abori_teeth_1' }, { 'whiskers_4' }, { 'abori_head_1' }, {
            'abori_male_top' }, { 'abori_male_legs' }, { 'abori_slave_bottom_2' }, {
                     'abori_slave_top_1' }, { 'abori_swift_strider_legs' }, {
                     'abori_slave_legs_3' }, { 'abori_worker_top_1' } }
      },
      abori_raider_5 = {
         attachments = {},
         body = { { 'abori_raider_shoulder_1' }, { 'abori_raider_shoulder_2' }, { 'eye_l' }, { 'eye_r' }, { 'abori_teeth_1' }, { 'abori_head_3' }, { 'abori_male_legs' }, {
            'abori_male_top' }, { 'abori_worker_top_2' }, { 'abori_raider_legs_3' }, {
                     'abori_raider_bottom_1' }, { 'abori_raider_belt_3' } }
      },
      abori_raider_6 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_worker_hat_1.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         } },
         body = { { 'abori_raider_shoulder_1' }, { 'abori_raider_shoulder_2' }, {
            'abori_head_2' }, { 'abori_teeth_1' }, { 'abori_male_top' }, { 'abori_male_legs' }, { 'eye_l' }, { 'eye_r' },
                  { 'abori_raider_legs_3' }, { 'abori_raider_top_4' }, { 'abori_raider_top_1' } }
      },
      abori_raider_7 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_slave_mask_1.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         }, {
                            bone = 'head_slot',
                            name = 'nomad_goggles.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_slave_hat_1.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_worker_hat_3.sbg',
                            pos = { x = 0, y = 0, z = 0 },
                            rot = { x = 0, y = 0, z = 0 },
                            scale = { x = 1, y = 1, z = 1 }
                         } },
         body = { { 'abori_head_1' }, { 'abori_male_legs' }, { 'abori_male_top' }, { 'eye_l' }, { 'eye_r' }, { 'abori_raider_shoulder_2' }, { 'abori_raider_legs_2' }, {
            'abori_raider_shoulder_1' }, { 'abori_raider_top_4' } }
      },
      abori_raider_8 = {
         attachments = {},
         body = { { 'eye_l' }, { 'eye_r' }, { 'abori_teeth_1' }, { 'abori_head_3' }, {
            'abori_swift_strider_top' }, { 'abori_male_legs' }, {
                     'abori_raider_belt_4' }, { 'abori_slave_legs_2' }, {
                     'abori_raider_shoulder_2' }, { 'abori_raider_shoulder_1' }
         },
      },

      scalphunter_1 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_shunter_hat_1.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'eye_l', 'eye_r' }, { 'abori_male_top' }, { 'abori_male_legs' }, {
            'whiskers_2' }, { 'abori_teeth_1' }, { 'abori_head_2' }, {
                     'abori_shunter_armour_2' }, { 'abori_shunter_back_3' }, {
                     'abori_shunter_legarmour_2' }, { 'abori_shunter_shoulder_1' }, {
                     'abori_shunter_shoulder_1_r' }, { 'abori_shunter_top_2' }, {
                     'abori_shunter_legs_3' } },
         textures = { abori_head_2 = 'abori_sc_head_dif_4.dds',
                      abori_male_legs = 'abori_sh_dif.dds',
                      abori_male_top = 'abori_sh_dif.dds',
                      eye_l = 'abori_eye_1_dif.dds',
                      eye_r = 'abori_eye_1_dif.dds' }
      },
      scalphunter_2 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_shunter_hat_2.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'abori_male_top' }, {
            'abori_male_legs' }, { 'abori_head_3' }, { 'whiskers_1' }, {
                     'abori_shunter_legs_1' }, { 'abori_shunter_armour_1' }, {
                     'abori_slave_top_3' }, { 'abori_shunter_top_1' } },
         textures = { abori_head_3 = 'abori_head_dif_3.dds',
                      abori_male_legs = 'abori_dif_3.dds',
                      abori_male_top = 'abori_dif_3.dds',
                      eye_l = 'abori_eye_2_dif.dds',
                      eye_r = 'abori_eye_2_dif.dds' }
      },
      scalphunter_3 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_shunter_hat_3.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'abori_male_top' }, {
            'abori_male_legs' }, { 'abori_head_1' }, { 'whiskers_4' }, {
                     'abori_shunter_shoulder_3_r' }, { 'abori_shunter_shoulder_3' }, {
                     'abori_shunter_legs_3' }, { 'abori_shunter_legarmour_3' }, {
                     'abori_shunter_armour_3' }, { 'abori_shunter_armour_2' }, {
                     'abori_shunter_back_2' } },
         textures = { abori_head_1 = 'abori_sc_head_dif_6.dds',
                      abori_male_legs = 'abori_dif_1.dds',
                      abori_male_top = 'abori_sh_dif.dds',
                      eye_l = 'abori_eye_4_dif.dds',
                      eye_r = 'abori_eye_4_dif.dds' }
      },
      scalphunter_4 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_eyepatch_r.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'abori_male_top' }, {
            'abori_male_legs' }, { 'abori_shunter_top_1' }, { 'abori_head_3' }, {
                     'whiskers_1' }, { 'abori_shunter_legs_2' }, { 'abori_shunter_shoulder_1' }, {
                     'abori_shunter_shoulder_1_r' }, { 'abori_shunter_armour_1' } },
         textures = { abori_head_3 = 'abori_head_dif_3.dds',
                      abori_male_legs = 'abori_dif_3.dds',
                      abori_male_top = 'abori_dif_3.dds',
                      eye_l = 'abori_eye_1_dif.dds',
                      eye_r = 'abori_eye_1_dif.dds' }
      },
      scalphunter_5 = {
         attachments = {},
         body = { { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'abori_male_top' }, {
            'abori_male_legs' }, { 'abori_shunter_top_2' }, {
                     'abori_shunter_legarmour_1' }, { 'abori_shunter_legs_1' }, { 'abori_head_1' }
         , { 'abori_shunter_armour_2' } },
         textures = { abori_head_1 = 'abori_sc_head_dif_1.dds',
                      abori_male_legs = 'abori_sh_dif.dds',
                      abori_male_top = 'abori_sh_dif.dds',
                      eye_l = 'abori_eye_2_dif.dds',
                      eye_r = 'abori_eye_2_dif.dds' }
      },
      scalphunter_6 = {
         attachments = {},
         body = { { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'abori_male_top' }, {
            'abori_male_legs' }, { 'abori_shunter_top_2' }, { 'abori_head_3' }, {
                     'whiskers_1' }, { 'abori_shunter_legarmour_2' }, { 'abori_raider_shoulder_2'
                  }, { 'abori_raider_shoulder_2_r' }, { 'abori_slave_top_2' }, {
                     'abori_shunter_legs_1' }, { 'abori_shunter_armour_1' } },
         textures = { abori_head_3 = 'abori_head_dif_3.dds',
                      abori_male_legs = 'abori_dif_3.dds',
                      abori_male_top = 'abori_dif_3.dds',
                      eye_l = 'abori_eye_3_dif.dds',
                      eye_r = 'abori_eye_3_dif.dds' }
      },
      scalphunter_7 = {
         attachments = {},
         body = { { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'abori_male_top' }, {
            'abori_male_legs' }, { 'abori_shunter_top_2' }, { 'abori_head_3' }, {
                     'abori_shunter_shoulder_1' }, { 'abori_shunter_shoulder_1_r' }, {
                     'abori_shunter_back_2' }, { 'abori_shunter_legs_2' } },
         textures = { aabori_head_3 = 'abori_sc_head_dif_3.dds',
                      abori_male_legs = 'abori_dif_2.dds',
                      abori_male_top = 'abori_sh_dif.dds',
                      eye_l = 'abori_eye_4_dif.dds',
                      eye_r = 'abori_eye_4_dif.dds' }
      },
      scalphunter_8 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_shunter_hat_3.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'abori_male_top' }, {
            'abori_male_legs' }, { 'abori_head_2' }, { 'abori_shunter_top_2' }, { 'whiskers_4' }, {
                     'abori_shunter_shoulder_3_r' }, { 'abori_shunter_shoulder_3' }, {
                     'abori_shunter_legs_3' }, { 'abori_shunter_legarmour_3' }, {
                     'abori_shunter_armour_3' }, { 'abori_shunter_armour_2' }, {
                     'abori_shunter_back_3' } },
         textures = { abori_head_2 = 'abori_sc_head_dif_2.dds',
                      abori_male_legs = 'abori_sh_dif.dds',
                      abori_male_top = 'abori_sh_dif.dds',
                      eye_l = 'abori_eye_3_dif.dds',
                      eye_r = 'abori_eye_3_dif.dds' }
      },
      scalphunter_9 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_shunter_hat_2.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         }, {
                            bone = 'head_slot',
                            name = 'abori_eyepatch_l.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'abori_male_top' }, {
            'abori_male_legs' }, { 'abori_head_3' }, { 'whiskers_1' }, { 'abori_shunter_back_2' }, {
                     'abori_shunter_legs_1' }, { 'abori_shunter_armour_1' }, { 'abori_shunter_top_1' } },
         textures = { abori_head_3 = 'abori_sc_head_dif_2.dds',
                      abori_male_legs = 'abori_dif_2.dds',
                      abori_male_top = 'abori_dif_2.dds',
                      eye_l = 'abori_eye_1_dif.dds',
                      eye_r = 'abori_eye_1_dif.dds' }
      },
      scalphunter_10 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_shunter_hat_1.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'abori_male_top' }, {
            'abori_male_legs' }, {
                     'abori_shunter_legarmour_1' }, { 'abori_shunter_legs_1' }, { 'abori_head_1' }
         , { 'abori_shunter_armour_2' } },
         textures = {abori_male_legs = "abori_sh_dif.dds",
      abori_male_top = "abori_sh_dif.dds",
      abori_head_1 = "abori_sc_head_dif_5.dds"}
      },
      q_my_clothes_bandit_1 = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'rice_hat.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'eye_l', 'eye_r' }, { 'abori_male_top' }, { 'abori_male_legs' }, {
            'whiskers_2' }, { 'abori_head_2' }, { 'abori_slave_top_1' }, {
                     'abori_slave_legs_3' } }
      },
      q_my_clothes_bandit_2 = {
         attachments = {},
         body = { { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'abori_male_top' }, {
            'abori_male_legs' }, { 'abori_slave_bottom_2' }, { 'abori_slave_top_2' }, {
                     'band_loarm_right' }, { 'whiskers_4' }, { 'abori_head_3' } }
      },
      q_my_clothes_bandit_2_hat = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'hat_leather.sbg',
                            pos = {
                               x = 0,
                               y = 3,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, { 'abori_male_top' }, {
            'abori_male_legs' }, { 'abori_slave_bottom_2' }, { 'abori_slave_top_2' }, {
                     'band_loarm_right' }, { 'whiskers_4' }, { 'abori_head_3' } }
      },
      q_my_clothes_bandit_3 = {
         attachments = {},
         body = { { 'eye_l' }, { 'abori_male_top' }, { 'abori_male_legs' }, {
            'whiskers_1' }, { 'abori_head_1' }, { 'band_head' }, { 'eye_r' }, {
                     'abori_worker_legs_1' }, { 'abori_slave_top_3' } }
      },
      ragpicker = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'boonie_hat.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 1
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1.13,
                               y = 1.13,
                               z = 1.13
                            }
                         } },
         body = { { 'eye_l' }, { 'abori_male_top' }, { 'abori_male_legs' }, {
            'eye_r' }, { 'abori_slave_bottom_3' }, { 'abori_slave_legs_3' }, {
                     'abori_worker_top_3' }, { 'abori_head_3' }, { 'whiskers_4' } },
         textures = {
            abori_head_3 = 'abori_head_dif_2.dds',
            abori_male_legs = 'abori_dif_2.dds',
            abori_male_top = 'abori_dif_2.dds'
         }
      },
      sandflea = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_bughat.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'abori_head_1' }, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, {
            'abori_male_top' }, { 'abori_male_legs' }, { 'abori_slave_top_1',
                                                         'abori_slave_legs_2', 'abori_slave_bottom_2' }, { 'band_head' }, {
                     'abori_raider_shoulder_1_r' } },
         textures = {
            abori_head_1 = 'abori_head_dif_2.dds',
            abori_male_legs = 'abori_dif_2.dds',
            abori_male_top = 'abori_dif_2.dds'
         }

      },
      sick_outcast = {
         attachments = {},
         body = { { 'abori_head_1' }, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, {
            'whiskers_4' }, { 'abori_male_top' }, { 'abori_male_legs' }, {
                     'abori_slave_top_1', 'abori_slave_legs_2', 'abori_slave_bottom_2' }, {
                     'band_head' } },
         textures = {}

      },
      old_outcast = {
         attachments = { {
                            bone = 'head_slot',
                            name = 'abori_hulk_hat_3.sbg',
                            pos = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            rot = {
                               x = 0,
                               y = 0,
                               z = 0
                            },
                            scale = {
                               x = 1,
                               y = 1,
                               z = 1
                            }
                         } },
         body = { { 'abori_head_1' }, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, {
            'abori_male_top' }, { 'abori_male_legs' }, { 'abori_slave_legs_2' }, {
                     'abori_slave_top_1' }, { 'whiskers_1' } },
         textures = {
            abori_head_1 = 'abori_head_dif_3.dds',
            abori_male_legs = 'abori_dif_3.dds',
            abori_male_top = 'abori_dif_3.dds'
         }
      },
   },

   -- ############### PILIGRIM SET STYLES ################
   piligrim = {
      piligrim = {
         body = { { 'hood_1' }, { 'robe_1' }, { 'tank_1' }, { 'body' } },
         attachments = {},
      },
   },
}

local deb = require "global.debug"

local stylesDump = {}
local function getStyleFor(styleName, char)
   if not styleName or not char then return end
   styleName = string.lower(styleName)
   local prefabStripped = string.gsub(char:getPrefabName(), ".cfg$", "")


   if isDebug() then
      deb.loadTableFromFile("./gdata/scripts/stylesDump/styles.lua", stylesDump)
   end

   return (stylesDump[prefabStripped] and stylesDump[prefabStripped][styleName]) or (Style[prefabStripped] and Style[prefabStripped][styleName])
end

local function getDefaultStyleFor(char)
   local prefabStripped = string.gsub(char:getPrefabName(), ".cfg$", "")
   return Style[prefabStripped] and Style[prefabStripped][prefabStripped]
end

return {
   Body=Body,
   Style=Style,
   getStyleFor=getStyleFor,
   getDefaultStyleFor=getDefaultStyleFor,
}
