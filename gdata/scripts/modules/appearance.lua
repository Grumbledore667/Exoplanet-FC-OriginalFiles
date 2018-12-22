local Body =
   {
      male_human =
      {
         pose =
         {
            head = { "human_male_head" },
            eyes = {  "human_male_eyes" },
            top = { "human_male_top" },
            bottom = { "human_male_legs" },
         },

         jack =
         {
            head = { "human_male_head_jack", },
            top = { "human_male_top_hands", "jack_top", },
            bottom = { "jack_legs" },
            scanner = { "scanner" },
         },

         junk_1 =
         {
            top = { "human_male_top", "junk_top_1", },
            bottom = { "human_male_legs", "junk_legs_1" },
         },

         junk_2 =
         {
            top = { "human_male_top", "junk_top_2", },
            bottom = { "human_male_legs", "junk_legs_2" },
         },

         bounty_hunter_1 =
         {
            top = { "human_male_top_hands", "bounty_hunter_1_top", },
            bottom = { "bounty_hunter_1_legs" },
         },

         bounty_hunter_2 =
         {
            top = { "human_male_top_hands", "bounty_hunter_2_top", },
            bottom = { "bounty_hunter_2_legs" },
         },

         bounty_hunter_3 =
         {
            top = { "human_male_top_hands", "bounty_hunter_3_top", },
            bottom = { "bounty_hunter_3_legs" },
         },

         peasant_1 =
         {
            top = { "human_male_top_hands", "peasant_1_top", },
            bottom = { "peasant_1_legs" },
         },

         farmer_1 =
         {
            top = { "human_male_top_arms", "farmer_1_top", },
            bottom = { "farmer_1_legs" },
         },

         mechanic_1 =
         {
            top = { "human_male_top_hands", "mechanic_1_top", },
            bottom = { "mechanic_1_legs" },
         },

         sheriff_jack =
         {
            head = { "human_male_head_jack", },
            top = { "human_male_top_hands", "sheriff_jack_top", },
            bottom = { "sheriff_jack_legs" },
         },

         sheriff_npc =
         {
            top = { "human_male_top_sheriff", "sheriff_npc_top", "sheriff_badge", },
            bottom = { "sheriff_npc_legs" },
         },

         thug_1 =
         {
            top = { "human_male_top_arms", "thug_1_top", },
            bottom = { "thug_1_legs" },
         },

         worker_1 =
         {
            top = { "human_male_top_hands", "worker_1_top", },
            bottom = { "worker_1_legs" },
         },
      },
      female_human =
      {
      },
      abori =
      {
         male =
         {
            head = { {"abori_head_1"}, {"abori_head_2"}, {"abori_head_3"} },
            whiskers = { {"whiskers_1"}, {"whiskers_2"}, {"whiskers_3"}, {"whiskers_4"}, },
            eyes =  { "eye_l", "eye_r" },
            teeth = { "abori_teeth_1" },
            top =   { "abori_male_top" },
            bottom = { "abori_male_legs" },
         },
         bandaged =
         {
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
         swift_strider =
         {
            head = { "abori_swift_strider_head", "eye_l", "eye_r", "abori_teeth_1" },
            top = { "abori_swift_strider_top" },
            bottom = { "abori_swift_strider_legs" },
            bandages = { "band_head", "band_ssleg_right", "band_ssleg_left" },
         },
         raider_1 =
         {
            top = { "abori_raider_top_1", "abori_raider_shoulder_1" },
            bottom = { "abori_raider_legs_1", "abori_raider_bottom_1", "abori_raider_belt_1" },
         },
         raider_2 =
         {
            top = { "abori_raider_top_1", "abori_raider_shoulder_1", "abori_raider_shoulder_2" },
            bottom = { "abori_raider_legs_2", "abori_raider_bottom_1", "abori_raider_belt_2" },
         },
         raider_3 =
         {
            top = { "abori_raider_top_3" },
            bottom = { "abori_raider_legs_3", "abori_raider_bottom_1", "abori_raider_belt_3" },
         },
         raider_4 =
         {
            top = { "abori_raider_top_4" },
            bottom = { "abori_raider_legs_4", "abori_raider_bottom_1", "abori_raider_belt_4" },
         },
         slave_1 =
         {
            top = { "abori_slave_top_1", "abori_slave_collar" },
            bottom = { "abori_slave_legs_1" },
         },
         slave_2 =
         {
            top = { "abori_slave_top_2", "abori_slave_collar" },
            bottom = { "abori_slave_legs_2" },
         },
         slave_3 =
         {
            top = { "abori_slave_top_3", "abori_slave_collar" },
            bottom = { "abori_slave_legs_3" },
         },
         worker_1 =
         {
            top = { "abori_worker_top_1" },
            bottom = { "abori_worker_legs_1" },
         },
         worker_2 =
         {
            top = { "abori_worker_top_2" },
            bottom = { "abori_worker_legs_2" },
         },
         worker_3 =
         {
            top = { "abori_worker_top_3" },
            bottom = { "abori_worker_legs_3" },
         },
      },
   }

local Style =
   {
      -- ################# HUMAN SET STYLES ###################
      human_male = {
         human_male_naked =
         {
            body =
            {
               Body.male_human.pose.head,
               Body.male_human.pose.eyes,
               Body.male_human.pose.top,
               Body.male_human.pose.bottom,
            },
            attachments = {},
         },
         human_male =
         {
            body =
            {
               Body.male_human.pose.head,
               Body.male_human.pose.eyes,
               Body.male_human.pose.top,
               Body.male_human.pose.bottom,
            },
            attachments =
            {
               { bone = "head_slot", name = "nomad_goggles.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, }
            },
         },
         human_male_2 =
         {
            body =
            {
               Body.male_human.pose.head,
               Body.male_human.pose.eyes,
               Body.male_human.pose.top,
               Body.male_human.pose.bottom,
            },
            attachments =
            {
               { bone = "head_slot", name = "rice_hat.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, }
            },
         },
         jack =
         {
            body =
            {
               Body.male_human.jack.head,
               Body.male_human.jack.top,
               Body.male_human.jack.bottom,
            },
            attachments =
            {
               { bone = "head_slot", name = "hair_jack.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, }
            },
         },
         jack_hat2 =
         {
            body =
            {
               Body.male_human.jack.head,
               Body.male_human.jack.top,
               Body.male_human.jack.bottom,
            },
            attachments =
            {
            },
         },
         jack_shirtless =
         {
            body =
            {
               Body.male_human.jack.head,
               Body.male_human.pose.top,
               Body.male_human.jack.bottom,
            },
            attachments =
            {
            },
         },
         jack_naked =
         {
            body =
            {
               Body.male_human.jack.head,
               Body.male_human.pose.top,
               Body.male_human.pose.bottom,
            },
            attachments =
            {
            },
         },
         bounty_hunter_1 =
         {
            body =
            {
               Body.male_human.pose.head,
               Body.male_human.pose.eyes,
               Body.male_human.bounty_hunter_1.top,
               Body.male_human.bounty_hunter_1.bottom,
            },
            attachments =
            {
            },
         },
         jack_bounty_hunter_1 =
         {
            body =
            {
               Body.male_human.jack.head,
               Body.male_human.bounty_hunter_1.top,
               Body.male_human.bounty_hunter_1.bottom,
            },
            attachments =
            {
            },
         },
         jack_bounty_hunter_3 =
         {
            body =
            {
               Body.male_human.jack.head,
               Body.male_human.bounty_hunter_3.top,
               Body.male_human.bounty_hunter_3.bottom,
            },
            attachments =
            {
            },
         },
         bounty_hunter_2 =
         {
            body =
            {
               Body.male_human.pose.head,
               Body.male_human.pose.eyes,
               Body.male_human.bounty_hunter_2.top,
               Body.male_human.bounty_hunter_2.bottom,
            },
            attachments =
            {
            },
         },
         bounty_hunter_3 =
         {
            body =
            {
               Body.male_human.pose.head,
               Body.male_human.pose.eyes,
               Body.male_human.bounty_hunter_3.top,
               Body.male_human.bounty_hunter_3.bottom,
            },
            attachments =
            {
            },
         },
         bounty_hunter_3_trailer =
         {
            body =
            {
               Body.male_human.jack.head,
               { "human_male_top_arms", "bounty_hunter_3_top", },
               Body.male_human.bounty_hunter_3.bottom,
            },
            attachments =
            {
               { bone = "head_slot", name = "hat_leather.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "item_slot1", name = "howdah.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         peasant_1 =
         {
            body =
            {
               Body.male_human.pose.head,
               Body.male_human.pose.eyes,
               Body.male_human.peasant_1.top,
               Body.male_human.peasant_1.bottom,
            },
            attachments =
            {
            },
         },
         farmer_1 =
         {
            body =
            {
               Body.male_human.pose.head,
               Body.male_human.pose.eyes,
               Body.male_human.farmer_1.top,
               Body.male_human.farmer_1.bottom,
            },
            attachments =
            {
            },
         },
         mechanic_1 =
         {
            body =
            {
               Body.male_human.pose.head,
               Body.male_human.pose.eyes,
               Body.male_human.mechanic_1.top,
               Body.male_human.mechanic_1.bottom,
            },
            attachments =
            {
            },
         },
         sheriff_jack =
         {
            body =
            {
               Body.male_human.jack.head,
               Body.male_human.sheriff_jack.top,
               Body.male_human.sheriff_jack.bottom,
            },
            attachments =
            {
               { bone = "head_slot", name = "sheriff_hat.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, }
            },
         },
         sheriff_jack_hat2 =
         {
            body =
            {
               Body.male_human.jack.head,
               Body.male_human.sheriff_jack.top,
               Body.male_human.sheriff_jack.bottom,
            },
            attachments =
            {
            },
         },
         sheriff_npc =
         {
            body =
            {
               Body.male_human.pose.head,
               Body.male_human.pose.eyes,
               Body.male_human.sheriff_npc.top,
               Body.male_human.sheriff_npc.bottom,
            },
            attachments =
            {
               { bone = "head_slot", name = "sheriff_hat.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, }
            },
         },
         thug_1 =
         {
            body =
            {
               Body.male_human.pose.head,
               Body.male_human.pose.eyes,
               Body.male_human.thug_1.top,
               Body.male_human.thug_1.bottom,
            },
            attachments =
            {
               { bone = "head_slot", name = "thug_1_hat.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         worker_1 =
         {
            body =
            {
               Body.male_human.pose.head,
               Body.male_human.pose.eyes,
               Body.male_human.worker_1.top,
               Body.male_human.worker_1.bottom,
            },
            attachments =
            {
            },
         },
         jack_worker_1 =
         {
            body =
            {
               Body.male_human.jack.head,
               Body.male_human.worker_1.top,
               Body.male_human.worker_1.bottom,
            },
            attachments =
            {
            },
         },
         -- ############### HUMAN NPC STYLES ################
         zak =
         {
            body =
            {
               { "human_male_top_hands", "human_male_eyes", "human_male_head", "bounty_hunter_2_top",
                  "bounty_hunter_2_legs", },
            },
            attachments =
            {
               { bone = "head_slot", name = "human_turban.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               -- { bone = "head_slot", name = "abori_slave_hat_1.sbg", pos = {x=0,y=0,z=2.5}, rot = {x=20,y=0,z=0}, scale = {x=0.85,y=0.85,z=0.73}, },
               { bone = "head_slot", name = "nomad_goggles.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "item_slot4", name = "shotgun.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "item_slot5", name = "machete.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         master_phil =
         {
            body =
            {
               { "worker_1_top",
                  "mechanic_1_legs",
                  "human_male_head",
                  "human_male_eyes",
                  "human_male_top_hands", },
            },
            attachments =
            {
               { bone = "head_slot", name = "sheriff_hat.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         castor =
         {
            body =
            {
               { "bounty_hunter_3_legs",
                  "bounty_hunter_3_top",
                  "human_male_head",
                  "human_male_eyes",
                  "human_male_top_hands", },
            },
            attachments =
            {
               { bone = "head_slot", name = "thug_1_hat.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         barnie =
         {
            body =
            {
               { "bounty_hunter_3_legs",
                  "bounty_hunter_1_top",
                  "human_male_top_hands",
                  "human_male_head",
                  "human_male_eyes", },
            },
            attachments =
            {
               { bone = "head_slot", name = "hat_leather.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "item_slot1", name = "shotgun.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         drago =
         {
            body =
            {
               { "bounty_hunter_2_legs",
                  "human_male_head",
                  "human_male_eyes",
                  "bounty_hunter_2_top",
                  "human_male_top_hands", },
            },
            attachments =
            {
               { bone = "item_slot1", name = "shotgun.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "head_slot", name = "biker_mask_2.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         junior =
         {
            body =
            {
               { "bounty_hunter_1_top",
                  "human_male_head",
                  "human_male_eyes",
                  "human_male_top_hands",
                  "peasant_1_legs", },
            },
            attachments =
            {
               { bone = "item_slot6", name = "revolver.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         wessley =
         {
            body =
            {
               { "human_male_legs",
                  "human_male_head",
                  "human_male_eyes",
                  "human_male_top", },
            },
            attachments =
            {
               { bone = "head_slot", name = "human_turban.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            -- { bone = "head_slot", name = "abori_slave_hat_1.sbg", pos = {x=0,y=0,z=2.5}, rot = {x=20,y=0,z=0}, scale = {x=0.85,y=0.85,z=0.73}, },
            },
         },
         kenneth =
         {
            body =
            {
               { "farmer_1_legs",
                  "thug_1_top",
                  "human_male_head",
                  "human_male_eyes",
                  "human_male_top_arms", },
            },
            attachments =
            {
               { bone = "head_slot", name = "boonie_hat.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "item_slot4", name = "shovel.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },

            },
         },
         red =
         {
            body =
            {
               { "bounty_hunter_3_legs",
                  "bounty_hunter_1_top",
                  "human_male_top_hands",
                  "human_male_head",
                  "human_male_eyes", },
            },
            attachments =
            {
               { bone = "head_slot", name = "hat_leather.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "item_slot4", name = "shotgun.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "item_slot6", name = "axe.sbg", pos = {x=0,y=0,z=0}, rot = {x=-90,y=0,z=0}, scale = {x=1,y=1,z=1}, },

            },
         },
         dikson =
         {
            body =
            {
               { "bounty_hunter_3_legs",
                  "bounty_hunter_3_top",
                  "human_male_head",
                  "human_male_eyes",
                  "human_male_top_hands", },
            },
            attachments =
            {
               { bone = "head_slot", name = "thug_1_hat.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "item_slot4", name = "kabarog_hsg.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },

            },
         },
         frank =
         {
            body =
            {
               { "bounty_hunter_3_legs",
                  "bounty_hunter_3_top",
                  "human_male_head",
                  "human_male_eyes",
                  "human_male_top_hands", },
            },
            attachments =
            {
               { bone = "item_slot4", name = "kabarog_hsg.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "head_slot", name = "thug_1_hat.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },

            },
         },
         ringo =
         {
            body =
            {
               { "bounty_hunter_2_legs",
                  "human_male_head",
                  "human_male_eyes",
                  "bounty_hunter_2_top",
                  "human_male_top_hands", },
            },
            attachments =
            {
               { bone = "head_slot", name = "biker_mask_2.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "item_slot1", name = "shotgun.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },

            },
         },
         jorgen =
         {
            body =
            {
               { "bounty_hunter_3_legs",
                  "bounty_hunter_1_top",
                  "human_male_top_hands",
                  "human_male_head",
                  "human_male_eyes", },
            },
            attachments =
            {
               { bone = "item_slot1", name = "shotgun.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "head_slot", name = "hat_leather.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },

            },
         },
         bandit_gunslinger_1 = {
            attachments = { {
               bone = 'head_slot',
               name = 'bandana_3.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            }, {
               bone = 'head_slot',
               name = 'bullet_hat.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            } },
            body = { { 'human_male_eyes' }, { 'human_male_head_big' }, { 'thug_1_top' },
               { 'human_male_top_arms' }, { 'worker_1_legs' } }
         },
         bandit_gunslinger_2 = {
            attachments = { {
               bone = 'head_slot',
               name = 'hair_hipster.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            }, {
               bone = 'head_slot',
               name = 'bandana_2.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            }, {
               bone = 'head_slot',
               name = 'nomad_goggles.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            } },
            body = { { 'human_male_eyes' }, { 'human_male_head_big' }, { 'farmer_1_legs'
               }, { 'thug_1_top' }, { 'human_male_top_arms' } }
         },
         bandit_gunslinger_3 = {
            attachments = { {
               bone = 'head_slot',
               name = 'hair_dreads.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            }, {
               bone = 'head_slot',
               name = 'bandana_1.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            } },
            body = { { 'peasant_1_legs' }, { 'human_male_head' }, { 'human_male_eyes' },
               { 'human_male_top_hands' }, { 'mechanic_1_top' } }
         },
         bandit_gunslinger_4 = {
            attachments = { {
               bone = 'head_slot',
               name = 'thug_1_hat.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            }, {
               bone = 'head_slot',
               name = 'bandana_3.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            } },
            body = { { 'human_male_eyes' }, { 'human_male_head' }, { 'peasant_1_top' }, {
               'human_male_top_hands' }, { 'worker_1_legs' } }
         },
         bandit_sharpshooter_1 = {
            attachments = { {
               bone = 'head_slot',
               name = 'human_turban.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            }, {
               bone = 'head_slot',
               name = 'bandana_1.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            } },
            body = { { 'worker_1_legs' }, { 'human_male_eyes' }, { 'human_male_head' }, {
               'sheriff_jack_top' }, { 'human_male_top_hands' } }
         },
         bandit_sharpshooter_2 = {
            attachments = { {
               bone = 'head_slot',
               name = 'hair_long_backward.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            }, {
               bone = 'head_slot',
               name = 'bandana_3.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            } },
            body = { { 'human_male_eyes' }, { 'human_male_head' }, {
               'bounty_hunter_1_legs' }, { 'sheriff_jack_top' }, { 'human_male_top_hands' }
            }
         },
         bandit_sharpshooter_3 = {
            attachments = { {
               bone = 'head_slot',
               name = 'bullet_hat.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            }, {
               bone = 'head_slot',
               name = 'bandana_2.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            } },
            body = { { 'human_male_eyes' }, { 'human_male_head' }, { 'sheriff_jack_top' }
               , { 'human_male_top_hands' }, { 'thug_1_legs' } }
         },
         bandit_sharpshooter_4 = {
            attachments = { {
               bone = 'head_slot',
               name = 'biker_helmet.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            } },
            body = { { 'farmer_1_legs' }, { 'sheriff_jack_top' }, {
               'human_male_top_hands' } }
         },
         bandit_sharpshooter_5 = {
            attachments = { {
               bone = 'head_slot',
               name = 'hair_long_backward.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            }, {
               bone = 'head_slot',
               name = 'bandana_3.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            } },
            body = { { 'human_male_eyes' }, { 'human_male_head' }, {
               'bounty_hunter_1_legs' }, { 'bounty_hunter_3_top' }, { 'human_male_top_hands' }
            }
         },
         mad_bandit_1 = {
            attachments = { {
               bone = 'head_slot',
               name = 'biker_mask_2.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            }, {
               bone = 'head_slot',
               name = 'rice_hat.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
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
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            }, {
               bone = 'head_slot',
               name = 'hair_dreads.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            } },
            body = { { 'human_male_top' }, { 'bounty_hunter_3_legs' } }
         },
         the_scarecrow = {
            body = { { 'bag_hat' }, { 'human_male_eyes' }, { 'human_male_head' }, {
               'bounty_hunter_3_legs' }, { 'sheriff_jack_top' }, { 'human_male_top_hands' } }
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
         hulk_naked =
         {
            body =
            {
               {"hulk_head_base"},
               {"hulk_jaws"},
               {"hulk_body"},
               {"eye_l", "eye_r",},
            },
            attachments = {},
         },
         abori_hulk_1 =
         {
            body =
            {
               {"hulk_head_retarded"},
               {"hulk_body"},
               {"eye_l", "eye_r",},
               {"hulk_amulet_2"},
               {"hulk_waist_2"}, 
               {"hulk_jaws"}, 
               {"hulk_flask"}, 
               {"hulk_feet_2"}, 
               {"hulk_necklace_1"}, 
               {"hulk_gems_2"}, 
               {"halk_shoulder_2_r"} 
            },
            attachments = {},
            textures = { 
             eye_l = 4,
             eye_r = 4,
             skin = 2 
                     }, 
         },
         abori_hulk_2 =
         {
            body =
            {
               {"hulk_head_base"},
               {"hulk_body"},
               {"eye_l", "eye_r",},
               {"hulk_pants_1"},
               {"hulk_kneeplate_1"}, 
               {"hulk_jaws"}, 
               {"hulk_kneeplate_1_r"}, 
               {"hulk_feet_1"}, 
               {"halk_top_1"}, 
               {"hulk_armband_1"}, 
               {"hulk_armband_1_r"},
               {"hulk_armstring_1_r"},
               {"hulk_armstring_1"},
               {"hulk_belt_2"} 
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
             eye_l = 2,
             eye_r = 2,
             skin = 3 
                     }, 
         },
         abori_hulk_3 = 
         {
            body =
            {
               {"hulk_head_angry"},
               {"hulk_body_saw"},
               {"eye_l", "eye_r",},
               {"halk_scarf"},
               {"halk_shoulder_1_r"}, 
               {"hulk_jaws"},  
               {"hulk_feet_1"}, 
               {"halk_shoulder_1"}, 
               {"hulk_powersaw"}, 
               {"hulk_armstring_1_r"},
               {"hulk_waist_1"}, 
               {"hulk_belt_3"}, 
               {"hulk_belt_1"}
            },
            attachments = {},
            textures = { 
             eye_l = 1,
             eye_r = 1,
             skin = 1 
                     }, 
         },
         abori_hulk_4 =
         {
            body =
            {
               {"hulk_jaws"}, 
               {"hulk_body"},
               {"eye_l", "eye_r",},
               {"hulk_head_cunning"},
               {"hulk_amulet_2"},
               {"hulk_belt_1"},
               {"halk_top_1"}, 
               {"halk_shoulder_1_r"},
               {"halk_shoulder_2"},
               {"halk_glove_1_r"},
               {"halk_glove_1"},
               {"hulk_pants_1"},
               {"hulk_feet_3"}, 
               {"hulk_kneeplate_1_r"}
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
             eye_l = 4,
             eye_r = 4,
             skin = 2 
                     }, 
         },
         abori_hulk_5 =
         {
            body =
            {
               {"hulk_body"},
               {"eye_l", "eye_r",},
               {"hulk_head_serious"},
               {"hulk_jaws"},
               {"hulk_kneeplate_1"}, 
               {"hulk_waist_2"},
               {"halk_glove_3_r"},
               {"hulk_flask"},
               {"hulk_gems_1"},
               {"hulk_feet_2"},
               {"hulk_belt_3"},
               {"hulk_armstring_1"},
               {"hulk_amulet_2"},
               {"halk_top_1"},
               {"halk_scarf"},
               {"halk_shoulder_1_r"}
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
             eye_l = 3,
             eye_r = 3,
             skin = 1 
                     }, 
         },
         abori_hulk_6 =
         {
            body =
            {
               {"hulk_jaws"},
               {"hulk_body"},
               {"eye_l", "eye_r",},
               {"hulk_head_serious"},
               {"hulk_gems_2"},
               {"hulk_flask"},
               {"hulk_gems_1"},
               {"hulk_feet_2"},
               {"hulk_waist_1"},
               {"hulk_glove_2_r"},
               {"hulk_amulet_1"},
               {"halk_shoulder_1_r"},
               {"halk_shoulder_1"},
               {"halk_scarf"},
               {"halk_glove_1"},
               {"hulk_kneeplate_1"}, 
               {"hulk_belt_2"}
            },
            attachments = {},
            textures = { 
             eye_l = 2,
             eye_r = 3,
             skin = 3 
                     }, 
         },
         abori_hulk_7 =
         {
            body =
            {
               {"hulk_body"},
               {"eye_l", "eye_r",},
               {"hulk_head_smiley"},
               {"hulk_jaws"},
               {"hulk_armband_1"}, 
               {"hulk_waist_2"},
               {"hulk_flask"},
               {"hulk_belt_3"},
               {"hulk_armstring_1"},
               {"hulk_pants_1"},
               {"hulk_necklace_1"},
               {"halk_shoulder_1"},
               {"halk_shoulder_2_r"}
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
             eye_l = 1,
             eye_r = 1,
             skin = 2 
                     }, 
         },
         abori_hulk_8 =
         {
            body =
            {
               {"hulk_body"},
               {"eye_l", "eye_r",},
               {"hulk_head_cunning"},
               {"hulk_jaws"},
               {"hulk_amulet_1"}, 
               {"hulk_waist_1"},
               {"hulk_waist_2"},
               {"hulk_glove_3_r"},
               {"hulk_glove_2"},
               {"hulk_feet_3"},
               {"hulk_belt_3"},
               {"hulk_amulet_1"},
               {"halk_top_1"},
               {"halk_shoulder_2"},
               {"halk_shoulder_1_r"}
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
             eye_l = 3,
             eye_r = 2,
             skin = 3 
                     }, 
         },
         abori_hulk_9 =
         {
            body =
            {
               {"hulk_body"},
               {"eye_l", "eye_r",},
               {"hulk_head_base"},
               {"hulk_jaws"},
               {"hulk_chief_arms_1"}, 
               {"hulk_chief_glove_1"},
               {"hulk_chief_legs_1"},
               {"hulk_chief_necklace_1"},
               {"hulk_chief_pants_1"},
               {"hulk_chief_top_1"},
               {"hulk_chief_waist_1"},
            },
            attachments = {},
            textures = { 
             eye_l = 1,
             eye_r = 1,
             skin = 1 
                     }, 
         },

      },

      abori = {
         -- ############### ABORI SET STYLES ################
         abori_naked =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[1],
               Body.abori.male.top,
               Body.abori.male.bottom,
            },
            attachments = {},
         },
         swift_strider =
         {
            body =
            {
               Body.abori.swift_strider.head,
               Body.abori.swift_strider.top,
               Body.abori.swift_strider.bottom,
            },
            attachments =
            {
            },
         },
         swift_strider_bandaged =
         {
            body =
            {
               Body.abori.swift_strider.head,
               Body.abori.swift_strider.top,
               Body.abori.swift_strider.bottom,
               Body.abori.swift_strider.bandages,
            },
            attachments =
            {
            },
         },
         abori_slave_1 =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[1],
               Body.abori.male.top,
               Body.abori.male.bottom,
               Body.abori.slave_1.top,
               Body.abori.slave_1.bottom,
            },
            attachments =
            {
               { bone = "head_slot", name = "rice_hat.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, }
            },
         },
         abori_slave_2 =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[2],
               Body.abori.male.top,
               Body.abori.male.bottom,
               Body.abori.slave_2.top,
               Body.abori.slave_2.bottom,
            },
            attachments =
            {
            },
         },
         abori_slave_3 =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.top,
               Body.abori.male.bottom,
               Body.abori.slave_3.top,
               Body.abori.slave_3.bottom,
            },
            attachments =
            {
               { bone = "head_slot", name = "abori_slave_hat_1.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "head_slot", name = "abori_slave_mask_1.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         abori_raider_1 =
         {
            body =
            {
               Body.abori.male.head[2],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[4],
               Body.abori.male.top,
               Body.abori.male.bottom,
               Body.abori.raider_1.top,
               Body.abori.raider_1.bottom,
            },
            attachments =
            {
            },
         },
         abori_raider_2 =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.top,
               Body.abori.male.bottom,
               Body.abori.raider_2.top,
               Body.abori.raider_2.bottom,
            },
            attachments =
            {
               { bone = "head_slot", name = "abori_raider_hat_1.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         abori_raider_3 =
         {
            body =
            {
               Body.abori.male.head[2],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[3],
               Body.abori.male.top,
               Body.abori.male.bottom,
               Body.abori.raider_3.top,
               Body.abori.raider_3.bottom,
            },
            attachments =
            {
               { bone = "head_slot", name = "abori_raider_hat_2.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         abori_raider_4 =
         {
            body =
            {
               Body.abori.male.head[3],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[2],
               Body.abori.male.top,
               Body.abori.male.bottom,
               Body.abori.raider_4.top,
               Body.abori.raider_4.bottom,
            },
            attachments =
            {
               { bone = "head_slot", name = "abori_raider_hat_3.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         abori_trader_1 =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[1],
               Body.abori.male.top,
               Body.abori.male.bottom,
               Body.abori.worker_2.top,
               Body.abori.worker_2.bottom,
               {"merchant_bag_1", "merchant_bag_2", "merchant_bag_3",},
            },
            attachments =
            {
               { bone = "item_slot_bag", name = "merchant_back_pack.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "head_slot", name = "abori_worker_hat_4.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "item_slot1", name = "plasma_spear.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         wandering_merchant =
         {
            body =
            {
               Body.abori.male.head[2],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[1],
               Body.abori.male.top,
               Body.abori.male.bottom,
               Body.abori.worker_2.top,
               Body.abori.worker_2.bottom,
               {"merchant_bag_1", "merchant_bag_2", "merchant_bag_3",},
            },
            attachments =
            {
               { bone = "item_slot_bag", name = "merchant_back_pack.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "head_slot", name = "abori_worker_hat_4.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "item_slot1", name = "plasma_spear.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         waga_the_tumbleweed =
         {
            body =
            {
               Body.abori.male.head[2],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[1],
               Body.abori.male.top,
               Body.abori.male.bottom,
               Body.abori.worker_2.top,
               Body.abori.worker_2.bottom,
               {"merchant_bag_1", "merchant_bag_2", "merchant_bag_3",},
            },
            attachments =
            {
               { bone = "item_slot_bag", name = "merchant_back_pack.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "head_slot", name = "abori_slave_hat_1.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "item_slot1", name = "plasma_spear.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },

         abori_worker_1 =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[2],
               Body.abori.male.top,
               Body.abori.male.bottom,
               Body.abori.worker_1.top,
               Body.abori.worker_1.bottom,
            },
            attachments =
            {
               { bone = "head_slot", name = "abori_worker_hat_1.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         abori_worker_2 =
         {
            body =
            {
               Body.abori.male.head[2],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[4],
               Body.abori.male.top,
               Body.abori.male.bottom,
               Body.abori.worker_2.top,
               Body.abori.worker_2.bottom,
            },
            attachments =
            {
               { bone = "head_slot", name = "abori_worker_hat_3.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         abori_worker_3 =
         {
            body =
            {
               Body.abori.male.head[3],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[3],
               Body.abori.male.top,
               Body.abori.male.bottom,
               Body.abori.worker_3.top,
               Body.abori.worker_3.bottom,
            },
            attachments =
            {
               { bone = "head_slot", name = "abori_worker_hat_4.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         abori_worker_wounded_1 =
         {
            body =
            {
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
            attachments =
            {
            },
         },
         abori_worker_wounded_2 =
         {
            body =
            {
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
            attachments =
            {
            },
         },
         abori_outcast_1 =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[4],
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_slave_legs_1",
                  "abori_slave_top_3",
                  "abori_slave_bottom_1",
                  "abori_slave_bottom_2", },
            },
            attachments =
            {},
         },
         abori_outcast_2 =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[4],
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_slave_top_1",
                  "abori_slave_legs_2",
                  "abori_slave_bottom_2", },
            },
            attachments =
            {},
         },
         abori_outcast_3 =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[4],
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_raider_shoulder_1",
                  "abori_raider_legs_2", },
            },
            attachments =
            {
            },
         },
         abori_outcast_4 =
         {
            body =
            {
               Body.abori.male.head[3],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[4],
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_slave_legs_1",
                  "abori_slave_bottom_3", },
            },
            attachments =
            {
            { bone = "head_slot", name = "abori_raider_hat_2.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         abori_outcast_5 =
         {
            body =
            {
               Body.abori.male.head[3],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[4],
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_slave_legs_1",
                  "abori_slave_top_3",
                  "abori_slave_bottom_1",
                  "abori_slave_bottom_2", },
            },
            attachments =
            {},
         },
         abori_outcast_6 =
         {
            body =
            {
               Body.abori.male.head[2],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[4],
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_slave_top_1",
                  "abori_slave_legs_2",
                  "abori_slave_bottom_2", },
            },
            attachments =
            {},
         },
         abori_outcast_7 =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[4],
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_raider_legs_1",
                  "abori_slave_top_3",
                  "abori_slave_bottom_1",
                  "abori_slave_bottom_2", },
            },
            attachments =
            { },
         },
         abori_outcast_8 =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[4],
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_raider_legs_1",
                  "abori_slave_top_3",
                  "abori_slave_bottom_1",
                  "abori_slave_bottom_2", },
            },
            attachments =
            {
             { bone = "head_slot", name = "abori_raider_hat_1.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
             { bone = "item_slot1", name = "alien_cactus_bat.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         abori_outcast_8_noweapon =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[4],
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_raider_legs_1",
                  "abori_slave_top_3",
                  "abori_slave_bottom_1",
                  "abori_slave_bottom_2", },
            },
            attachments =
            {
             { bone = "head_slot", name = "abori_raider_hat_1.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         abori_outcast_9 =
         {
            body =
            {
               Body.abori.male.head[2],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[4],
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_slave_top_1",
                  "abori_slave_legs_2",
                  "abori_slave_bottom_2", },
            },
            attachments =
            {
             { bone = "head_slot", name = "abori_raider_hat_1.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
             { bone = "item_slot1", name = "pipe.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         -- ############### ABORI NPC STYLES ################
         juggo =
         {
            body =
            {
               Body.abori.male.head[3],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[2],
               Body.abori.male.top,
               Body.abori.male.bottom,
               { "abori_slave_collar", "abori_raider_shoulder_1", "abori_raider_legs_2", },
            },
            attachments =
            {
               { bone = "head_slot", name = "abori_raider_hat_2.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "item_slot_bag", name = "alien_cactus_bat.sbg", pos = {x=0,y=0,z=10}, rot = {x=20,y=0,z=30}, scale = {x=1,y=1,z=1}, },
            },
         },
         chew =
         {
            body =
            {
               Body.abori.male.head[2],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[3],
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_slave_collar", "abori_slave_top_1", "abori_slave_legs_2", },
            },
            attachments =
            {
               { bone = "item_slot_bag", name = "alien_cactus_bat.sbg", pos = {x=0,y=0,z=10}, rot = {x=20,y=0,z=30}, scale = {x=1,y=1,z=1}, },
               { bone = "head_slot", name = "abori_slave_mask_1.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         ampa =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[4],
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_slave_collar",
                  "abori_slave_top_3",
                  "abori_slave_bottom_3",
                  "abori_slave_legs_3", },
            },
            attachments =
            {
               { bone = "item_slot_bag", name = "alien_cactus_bat.sbg", pos = {x=0,y=0,z=10}, rot = {x=20,y=0,z=30}, scale = {x=1,y=1,z=1}, },
               { bone = "head_slot", name = "abori_worker_hat_4.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         old_mug =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[1],
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_slave_collar",
                  "abori_slave_top_2",
                  "abori_worker_legs_1",
                  "abori_slave_legs_2", },
            },
            attachments =
            {
               { bone = "head_slot", name = "sheriff_hat.sbg", pos = {x=0,y=1,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1.2,y=1.2,z=1.2}, },
            },
         },
         nab =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[4],
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_slave_collar",
                  "abori_slave_top_2",
                  "abori_slave_legs_2",
                  "abori_slave_bottom_2", },
            },
            attachments =
            {
               { bone = "head_slot", name = "abori_worker_hat_4.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "item_slot1", name = "beacon_light.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         paga =
         {
            body =
            {
               Body.abori.male.head[2],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[2],
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_slave_collar",
                  "abori_raider_legs_1",
                  "abori_slave_top_3",
                  "abori_slave_top_1", },
            },
            attachments =
            {
               { bone = "head_slot", name = "abori_raider_hat_1.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         msasi =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[1],
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_raider_shoulder_1",
                  "abori_raider_legs_2", },
            },
            attachments =
            {
               { bone = "item_slot_bag", name = "abori_gun_rifle.sbg", pos = {x=10,y=20,z=0}, rot = {x=90,y=160,z=-90}, scale = {x=1,y=1,z=1}, },
               { bone = "head_slot", name = "abori_raider_hat_2.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         mute =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[1],
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_slave_collar",
                  "abori_slave_top_3",
                  "abori_slave_top_1", },
            },
            attachments =
            {
               { bone = "head_slot", name = "abori_raider_hat_1.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         abori_prisoner =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[2],
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_slave_top_3",
                  "abori_slave_top_1", },
            },
            attachments =
            {
            },
         },
         kampa =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[4],
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_slave_collar",
                  "abori_raider_shoulder_1",
                  "abori_raider_legs_2", },
            },
            attachments =
            {
               { bone = "head_slot", name = "abori_raider_hat_2.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         croaker =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_slave_collar",
                  "abori_raider_legs_2", },
            },
            attachments =
            {
               { bone = "head_slot", name = "abori_slave_mask_1.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "item_slot1", name = "big_spoon.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         obai =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[2],
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_raider_legs_2", },
            },
            attachments =
            {
               { bone = "head_slot", name = "abori_slave_mask_1.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         mister_green =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[1],
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_raider_shoulder_1",
                  "abori_raider_legs_2", },
            },
            attachments =
            {
               { bone = "head_slot", name = "abori_raider_hat_2.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "item_slot1", name = "big_spoon.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         angry_jag =
         {
            body =
            {
               Body.abori.male.head[3],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[3],
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_slave_top_3",
                  "abori_slave_legs_3",
                  "abori_slave_bottom_3", },
            },
            attachments =
            {
               { bone = "head_slot", name = "abori_worker_hat_4.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         mad_shaman =
         {
            body =
            {
               Body.abori.male.head[2],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[1],
               Body.abori.male.top,
               Body.abori.male.bottom,
               { "abori_slave_bottom_2", },
            },
            attachments =
            {},
         },
         sly =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[4],
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_raider_legs_1",
                  "abori_slave_top_3",
                  "abori_raider_bottom_1",
                  "abori_slave_bottom_2", },
            },
            attachments =
            {
               { bone = "head_slot", name = "abori_raider_hat_1.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "item_slot1", name = "abori_gun_pistol.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         ouga =
         {
            body =
            {
               Body.abori.male.head[2],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[2],
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_slave_collar",
                  "abori_raider_legs_1",
                  "abori_slave_top_3",
                  "abori_slave_bottom_3",},
            },
            attachments =
            {
               { bone = "item_slot_bag", name = "shovel.sbg", pos = {x=-20,y=60,z=10}, rot = {x=100,y=200,z=90}, scale = {x=1,y=1,z=1}, },
               { bone = "head_slot", name = "abori_raider_hat_1.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         mugs_abori_1 =
         {
            body =
            {
               Body.abori.male.head[3],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[4],
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_slave_collar",
                  "abori_slave_legs_3",
                  "abori_slave_top_1", },
            },
            attachments =
            {
               { bone = "head_slot", name = "abori_raider_hat_2.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         mugs_abori_2 =
         {
            body =
            {
               Body.abori.male.head[2],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[3],
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_slave_collar",
                  "abori_slave_top_3",
                  "abori_slave_top_1", },
            },
            attachments =
            {
               { bone = "head_slot", name = "abori_raider_hat_1.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         mugs_abori_3 =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[2],
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_slave_collar",
                  "abori_raider_legs_2", },
            },
            attachments =
            {
               { bone = "head_slot", name = "abori_slave_mask_1.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         mugs_abori_4 =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[1],
               Body.abori.male.top,
               Body.abori.male.bottom,
               {  "abori_slave_legs_2",
                  "abori_slave_collar",
                  "abori_slave_bottom_3",
                  "abori_slave_top_2", },
            },
            attachments =
            {
               { bone = "head_slot", name = "abori_worker_hat_4.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         stone_heads_scout_1 =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[3],
               Body.abori.male.top,
               Body.abori.male.bottom,
               Body.abori.raider_4.top,
               Body.abori.raider_4.bottom,
            },
            attachments =
            {
               { bone = "head_slot", name = "abori_raider_hat_3.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "item_slot1", name = "abori_gun_rifle.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         stone_heads_scout_2 =
         {
            body =
            {
               Body.abori.male.head[3],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[2],
               Body.abori.male.top,
               Body.abori.male.bottom,
               Body.abori.raider_4.top,
               Body.abori.raider_4.bottom,
            },
            attachments =
            {
               { bone = "item_slot1", name = "abori_gun_rifle.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "head_slot", name = "abori_raider_hat_3.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         stone_heads_scout_1_bandit =
         {
            body =
            {
               Body.abori.male.head[2],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[4],
               Body.abori.male.top,
               Body.abori.male.bottom,
               Body.abori.raider_4.top,
               Body.abori.raider_4.bottom,
            },
            attachments =
            {
               { bone = "head_slot", name = "abori_raider_hat_3.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         stone_heads_scout_2_bandit =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[3],
               Body.abori.male.top,
               Body.abori.male.bottom,
               Body.abori.raider_4.top,
               Body.abori.raider_4.bottom,
            },
            attachments =
            {
               { bone = "head_slot", name = "abori_raider_hat_3.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         stone_heads_warrior_1_bandit =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[1],
               Body.abori.male.top,
               Body.abori.male.bottom,
               Body.abori.raider_2.top,
               Body.abori.raider_2.bottom,
            },
            attachments =
            {
               { bone = "head_slot", name = "abori_raider_hat_1.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         stone_heads_warrior_2_bandit =
         {
            body =
            {
               Body.abori.male.head[2],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[1],
               Body.abori.male.top,
               Body.abori.male.bottom,
               Body.abori.raider_1.top,
               Body.abori.raider_1.bottom,
            },
            attachments =
            {
            },
         },
         stone_heads_warrior_1 =
         {
            body =
            {
               Body.abori.male.head[3],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[2],
               Body.abori.male.top,
               Body.abori.male.bottom,
               Body.abori.raider_2.top,
               Body.abori.raider_2.bottom,
            },
            attachments =
            {
               { bone = "item_slot1", name = "abori_gun_rifle.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "head_slot", name = "abori_raider_hat_1.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         stone_heads_warrior_2 =
         {
            body =
            {
               Body.abori.male.head[3],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[4],
               Body.abori.male.top,
               Body.abori.male.bottom,
               Body.abori.raider_1.top,
               Body.abori.raider_1.bottom,
            },
            attachments =
            {
               { bone = "item_slot1", name = "abori_gun_pistol.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         stone_heads_warrior_3 =
         {
            body =
            {
               Body.abori.male.head[3],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[1],
               Body.abori.male.top,
               Body.abori.male.bottom,
               Body.abori.raider_2.top,
               Body.abori.raider_2.bottom,
            },
            attachments =
            {
               { bone = "item_slot1", name = "abori_gun_pistol.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "head_slot", name = "abori_raider_hat_1.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         stone_heads_warrior_4 =
         {
            body =
            {
               Body.abori.male.head[3],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[1],
               Body.abori.male.top,
               Body.abori.male.bottom,
               Body.abori.raider_4.top,
               Body.abori.raider_4.bottom,
            },
            attachments =
            {
               { bone = "item_slot1", name = "abori_gun_mortar.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "head_slot", name = "abori_raider_hat_3.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         stone_heads_warrior_5 =
         {
            body =
            {
               Body.abori.male.head[3],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[1],
               Body.abori.male.top,
               Body.abori.male.bottom,
               Body.abori.raider_2.top,
               Body.abori.raider_2.bottom,
            },
            attachments =
            {
               { bone = "item_slot1", name = "abori_gun_mortar.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "head_slot", name = "abori_raider_hat_1.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         stone_heads_warchief =
         {
            body =
            {
               Body.abori.male.head[3],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[4],
               Body.abori.male.top,
               Body.abori.male.bottom,
               Body.abori.raider_3.top,
               Body.abori.raider_3.bottom,
            },
            attachments =
            {
               { bone = "item_slot_bag", name = "shotgun.sbg", pos = {x=10,y=20,z=0}, rot = {x=90,y=160,z=-90}, scale = {x=1,y=1,z=1}, },
               { bone = "head_slot", name = "abori_raider_hat_2.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         stone_heads_trader =
         {
            body =
            {
               Body.abori.male.head[1],
               Body.abori.male.eyes,
               Body.abori.male.teeth,
               Body.abori.male.whiskers[2],
               Body.abori.male.top,
               Body.abori.male.bottom,
               Body.abori.raider_2.top,
               Body.abori.raider_2.bottom,
               {"merchant_bag_1", "merchant_bag_2", "merchant_bag_3",},
            },
            attachments =
            {
               { bone = "item_slot_bag", name = "merchant_back_pack.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
               { bone = "head_slot", name = "abori_worker_hat_4.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            --         { bone = "item_slot1", name = "plasma_spear.sbg", pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, },
            },
         },
         abori_bandit_1 = {
            attachments = { {
               bone = 'head_slot',
               name = 'abori_raider_hat_1.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            } },
            body = { { 'eye_l' }, { 'eye_r' }, { 'abori_teeth_1' }, { 'abori_male_top' }, {
               'abori_male_legs' }, { 'abori_slave_top_2' }, { 'abori_raider_legs_2' }, {
               'abori_head_3' } }
         },
         abori_bandit_2 = {
            attachments = { {
               bone = 'head_slot',
               name = 'biker_mask.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            }, {
               bone = 'head_slot',
               name = 'hair_dreads.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            } },
            body = { { 'eye_l' }, { 'eye_r' }, { 'abori_head_2' }, {
               'abori_male_top' }, { 'abori_male_legs' }, { 'abori_slave_top_1' }, {
               'abori_slave_legs_2' }, { 'abori_raider_top_4' } }
         },
         abori_bandit_3 = {
            attachments = { {
               bone = 'head_slot',
               name = 'abori_slave_mask_1.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            }, {
               bone = 'head_slot',
               name = 'abori_slave_hat_1.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            } },
            body = { { 'eye_l' }, { 'eye_r' }, { 'abori_head_2' }, {
               'abori_male_legs' }, { 'abori_slave_top_3' }, { 'abori_raider_top_3' }, {
               'abori_slave_legs_3' }, { 'abori_slave_bottom_3' }, { 'abori_male_top' } }
         },
         abori_bandit_4 = {
            attachments = { {
               bone = 'head_slot',
               name = 'abori_worker_hat_4.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            }, {
               bone = 'head_slot',
               name = 'abori_raider_hat_2.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            }, {
               bone = 'head_slot',
               name = 'abori_slave_mask_1.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
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
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            }, {
               bone = 'head_slot',
               name = 'rice_hat.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
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
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            } },
            body = { { 'eye_l' }, { 'eye_r' }, { 'abori_teeth_1' }, { 'whiskers_4' }, { 'abori_head_1' }, {
               'abori_male_top' }, { 'abori_male_legs' }, { 'abori_slave_bottom_2' }, {
               'abori_slave_top_1' }, { 'abori_swift_strider_legs' }, {
                  'abori_slave_legs_3' }, { 'abori_worker_top_1' } }
         },
         scalphunter_1 = {
            attachments = {},
            body = { { 'abori_raider_shoulder_1' }, { 'abori_raider_shoulder_2' }, { 'eye_l' }, { 'eye_r' }, { 'abori_teeth_1' }, { 'abori_head_3' }, { 'abori_male_legs' }, {
               'abori_male_top' }, { 'abori_worker_top_2' }, { 'abori_raider_legs_3' }, {
                  'abori_raider_bottom_1' }, { 'abori_raider_belt_3' } }
         },
         scalphunter_2 = {
            attachments = { {
               bone = 'head_slot',
               name = 'abori_worker_hat_1.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            } },
            body = { { 'abori_raider_shoulder_1' }, { 'abori_raider_shoulder_2' }, {
               'abori_head_2' }, { 'abori_teeth_1' }, { 'abori_male_top' }, { 'abori_male_legs' }, { 'eye_l' }, { 'eye_r' },
            { 'abori_raider_legs_3' }, { 'abori_raider_top_4' }, { 'abori_raider_top_1' } }
         },
         scalphunter_3 = {
            attachments = { {
               bone = 'head_slot',
               name = 'abori_slave_mask_1.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            }, {
               bone = 'head_slot',
               name = 'nomad_goggles.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            }, {
               bone = 'head_slot',
               name = 'abori_slave_hat_1.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            }, {
               bone = 'head_slot',
               name = 'abori_worker_hat_3.sbg',
               pos = {x=0,y=0,z=0},
               rot = {x=0,y=0,z=0},
               scale = {x=1,y=1,z=1}
            } },
            body = { { 'abori_head_1' }, { 'abori_male_legs' }, { 'abori_male_top' }, { 'eye_l' }, { 'eye_r' }, { 'abori_raider_shoulder_2' }, { 'abori_raider_legs_2' }, {
               'abori_raider_shoulder_1' }, { 'abori_raider_top_4' } }
         },
         scalphunter_4 = {
            attachments = {},
            body = { { 'eye_l' }, { 'eye_r' }, { 'abori_teeth_1' }, { 'abori_head_3' }, {
               'abori_swift_strider_top' }, { 'abori_male_legs' }, {
               'abori_raider_belt_4' }, { 'abori_slave_legs_2' }, {
                  'abori_raider_shoulder_2' }, { 'abori_raider_shoulder_1' }
            },
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
                'abori_head_1' }, { 'eye_r' }, { 'abori_slave_bottom_3' }, {
                'abori_slave_legs_3' }, { 'abori_worker_top_3' } }
         },
         old_outcast = {
            attachments = {},
            body = { { 'abori_head_1' }, { 'eye_l', 'eye_r' }, { 'abori_teeth_1' }, {
                'abori_male_top' }, { 'abori_male_legs' }, { 'whiskers_2' }, {
                'abori_slave_legs_2' }, { 'abori_slave_top_1' } }
         },
      }
   }

local function getStyle( styleName )
   if not styleName then return end
   local styles = {}
   local f, err = loadfile( "./gdata/scripts/stylesDump/styles.lua" )
   if err then
      log(err)
   else
      styles = f()
   end
   local style = styles.human_male[styleName] or styles.abori[styleName] or styles.hulk[styleName]
               or Style.human_male[styleName] or Style.abori[styleName] or Style.hulk[styleName]
   return style
end

return {
   Body=Body,
   Style=Style,
   getStyle=getStyle,
}
