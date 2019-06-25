local animations = {
   idle = {
      default = {"idle","idle_2","idle_3","idle_4","idle_5","idle_look"},
      melee_low = "1hm_idle",
      shotgun = {"shotgun_idle", "shotgun_aim_idle"},
      carbine = {"rifle_idle", "rifle_aim_idle"},
      pistol = {"pistol_idle", "pistol_aim_idle"},
      attack = {
         default = "",
         melee_low = { "1hm_idle_melee", "1hm_idle_melee_2", "1hm_idle_melee_3", "1hm_idle_melee_4", },
         boxing = {"h2h_idle_melee", "h2h_idle_melee_2"},
         pistol = "recoil__pistol_idle",
         shotgun = "recoil__shotgun_idle",
         carbine = "recoil__rifle_idle",
      },
      cock = {
         shotgun = "cock__shotgun_aim_idle",
         carbine = "cock__carbine_aim_idle",
         rifle = "cock__rifle_aim_idle",
      },
      drink = {
         default = "idle_drink",
      },
      eat = {
         default = "idle_eat_long",
      },
      knockout = {
         front = {
            to = "idle_to_kd_idle_front",
            idle = "kd_idle_front",
            out = "kd_idle_front_to_idle",
         },
         back = {
            to = "idle_to_kd_idle_back",
            idle = "kd_idle_back",
            out = "kd_idle_back_to_idle",
         },
      },
      fear = {
         idle = "fear_idle"
      },
      to =
      {
         default = "",
         smoke = "idle_smoke",
      },
   },
   walk = {
      front = {
         default = "walk_front",
         attack = {
            melee_low = { "1hm_idle_melee", "1hm_idle_melee_2", "1hm_idle_melee_3", "1hm_idle_melee_4", },
            boxing = {"h2h_idle_melee", "h2h_idle_melee_2"},
            pistol = "recoil__pistol_idle",
            shotgun = "recoil__shotgun_walk_front",
            carbine = "recoil__rifle_walk_front",
         },
      },
      back = {
         default = "walk_back",
         attack = {
            melee_low = { "1hm_idle_melee", "1hm_idle_melee_2", "1hm_idle_melee_3", "1hm_idle_melee_4", },
            boxing = {"h2h_idle_melee", "h2h_idle_melee_2"},
            pistol = "recoil__pistol_idle",
            shotgun = "recoil__shotgun_walk_front",
            carbine = "recoil__rifle_walk_front",
         },
      },
      left = {
         default = "walk_left",
         attack = {
            melee_low = { "1hm_idle_melee", "1hm_idle_melee_2", "1hm_idle_melee_3", "1hm_idle_melee_4", },
            boxing = {"h2h_idle_melee", "h2h_idle_melee_2"},
            pistol = "recoil__pistol_idle",
            shotgun = "recoil__shotgun_walk_front",
            carbine = "recoil__rifle_walk_front",
         },
      },
      right = {
         default = "walk_right",
         attack = {
            melee_low = { "1hm_idle_melee", "1hm_idle_melee_2", "1hm_idle_melee_3", "1hm_idle_melee_4", },
            boxing = {"h2h_idle_melee", "h2h_idle_melee_2"},
            pistol = "recoil__pistol_idle",
            shotgun = "recoil__shotgun_walk_front",
            carbine = "recoil__rifle_walk_front",
         },
      },
   },
   run = {
      front = {
         default = "run_front",
         attack = {
            melee_low = { "1hm_idle_melee", "1hm_idle_melee_2", "1hm_idle_melee_3", "1hm_idle_melee_4", },
            boxing = {"h2h_idle_melee", "h2h_idle_melee_2"},
            pistol = "recoil__pistol_idle",
            shotgun = "recoil__shotgun_run_front",
            carbine = "recoil__rifle_run_front",
         },
      },
      back = {
         default = "run_front",
         -- default = "run_back",
         attack = {
            melee_low = { "1hm_idle_melee", "1hm_idle_melee_2", "1hm_idle_melee_3", "1hm_idle_melee_4", },
            boxing = {"h2h_idle_melee", "h2h_idle_melee_2"},
            pistol = "recoil__pistol_idle",
            shotgun = "recoil__shotgun_run_front",
            carbine = "recoil__rifle_run_front",
         },
      },
      left = {
         default = "run_front",
         -- default = "run_left",
         attack = {
            melee_low = { "1hm_idle_melee", "1hm_idle_melee_2", "1hm_idle_melee_3", "1hm_idle_melee_4", },
            boxing = {"h2h_idle_melee", "h2h_idle_melee_2"},
            pistol = "recoil__pistol_idle",
            shotgun = "recoil__shotgun_run_front",
            carbine = "recoil__rifle_run_front",
         },
      },
      right = {
         default = "run_front",
         -- default = "run_right",
         attack = {
            melee_low = { "1hm_idle_melee", "1hm_idle_melee_2", "1hm_idle_melee_3", "1hm_idle_melee_4", },
            boxing = {"h2h_idle_melee", "h2h_idle_melee_2"},
            pistol = "recoil__pistol_idle",
            shotgun = "recoil__shotgun_run_front",
            carbine = "recoil__rifle_run_front",
         },
      },
   },
   turn = {
      left = {
         step    = "idle_turn_left",
         quarter = "idle_turn_left_90",
         full    = "idle_turn_left_180",
      },
      right = {
         step    = "idle_turn_right",
         quarter = "idle_turn_right_90",
         full    = "idle_turn_right_180",
      },
   },
   talk = {
      default = { --Animations with no apparent emotion that could be used at random
         "dl_talk_1",
         "dl_talk_2",
         "dl_talk_3",
         "dl_bow_1",
         "dl_come_here",
         "dl_cough",
         "dl_count_to_one",
         "dl_hand_showforward",
         "dl_hand_showleft",
         "dl_hand_showright",
         "dl_hands_dontknow",
         "dl_hands_washing",
         "dl_head_scratch",
         "dl_point_forward",
         "dl_raisedfinger_left",
         "dl_raisedfinger_right",
         "dl_righthand_wave_short",
         "dl_shrug_short",
      },
      emote = { --Animations with a distinct emotion
         "dl_clench_fist",
         "dl_cut_throat",
         "dl_chuckle",
         "dl_frustration",
         "dl_hand_at_mouth_yelling",
         "dl_hand_chopfast",
         "dl_hand_chopslow",
         "dl_hand_facepalm",
         "dl_hand_negative",
         "dl_head_2nods",
         "dl_head_nod",
         "dl_head_shake",
         "dl_shrug_long",
         "dl_shrug_short",
         "dl_stop_onehand",
         "dl_stop_twohand",
      },
      directional = {
         "dl_look_down",
         "dl_look_down_long",
         "dl_look_left",
         "dl_look_right",
         "dl_look_up",
         "dl_point_back",
         "dl_point_forward",
         "dl_point_left",
         "dl_point_right",
         "dl_point_self",
      },
      misc = {
         "dl_idle",
         "dl_talk_1",
         "dl_talk_2",
         "dl_talk_3",
         "dl_bow_1",
         "dl_bow_2",
         "dl_chintouch_end",
         "dl_chintouch_loop",
         "dl_chintouch_start",
         "dl_come_here",
         "dl_cough",
         "dl_count_to_one",
         "dl_hand_showforward",
         "dl_hand_showleft",
         "dl_hand_showright",
         "dl_hands_dontknow",
         "dl_hands_washing",
         "dl_head_scratch",
         "dl_hands_strike",
         "dl_head_tap",
         "dl_head_wipe",
         "dl_raisedfinger_left",
         "dl_raisedfinger_right",
         "dl_righthand_wave_long",
         "dl_righthand_wave_med",
         "dl_righthand_wave_short",
         "dl_sneeze",
      },
   },
   hit = {
      default = "hit__front",
      pistol = {
         front = "hit__pistol_front",
         back = "hit__pistol_back",
         left = "hit__pistol_left",
         right = "hit__pistol_right",
      },
      shotgun = {
         front = "hit__shotgun_front",
         back = "hit__shotgun_back",
         left = "hit__shotgun_left",
         right = "hit__shotgun_right",
      },
      carbine = {
         front = "hit__rifle_front",
         back = "hit__rifle_back",
         left = "hit__rifle_left",
         right = "hit__rifle_right",
      },
      melee_low = {
         front = "hit__1hm_front",
         back = "hit__1hm_back",
         left = "hit__1hm_left",
         right = "hit__1hm_right",
      },
      shield = {
         pistol = {
            front = "hit__shield_pistol_front",
            back = "hit__shield_pistol_back",
            left = "hit__shield_pistol_left",
            right = "hit__shield_pistol_right",
         },
         melee_low = {
            front = "hit__shield_1hm_front",
            back = "hit__shield_1hm_back",
            left = "hit__shield_1hm_left",
            right = "hit__shield_1hm_right",
         },
      },
   },
   equip = {
      idle = {
         melee_low = "equip__1hm_idle",
         pistol    = "equip__pistol_idle",
         shotgun   = "equip__rifle_idle",
         carbine   = "equip__rifle_idle",
      },
   },
   unequip = {
      idle = {
         melee_low = "unequip__1hm_idle",
         pistol    = "unequip__pistol_idle",
         shotgun   = "unequip__rifle_idle",
         carbine   = "unequip__rifle_idle",
      },
   },
   fall = {
      default   = "fall_idle",
      pistol    = "fall_idle",
      shotgun   = "rifle_fall_idle",
      carbine   = "rifle_fall_idle",
   },
   land = {
      default = {
         default = "idle_land",
         pistol = "pistol_idle_land",
         shotgun = "rifle_idle_land",
         carbine = "rifle_idle_land",
      },
      hard = {
         default = "idle_land_hard",
         pistol = "pistol_idle_land_hard",
         shotgun = "rifle_idle_land_hard",
         carbine = "rifle_idle_land_hard",
      },
   },

   dance = {
      default = {"idle_dance", "idle_dance_2"}
   },
   die = {
      -- default = {"death", "idle_to_kd_idle_front", "idle_to_kd_idle_back"},
      default = "death",
   },

   swift_sit = {
      idle = {
         default = "swift_sit_idle",
      },
      death = {
         default = "swift_sit_death",
      },
      drink = {
         default = "swift_sit_idle_drink",
      },
      smoke = {
         default = "swift_sit_idle_smoke",
      },
      talk = {
         default = {"swift_sit_idle_talk"},
      },
   },
}


local EventsGenerator = require "eventsGenerator"
local generator = EventsGenerator()
-- data
local animationEvents, events, sounds = generator.animationEvents, generator.events, generator.sounds
-- dsl functions
local assignEvent, event, eventUnassigned, sound = generator.assignEvent, generator.event, generator.eventUnassigned, generator.sound

-- assign events to animations here
assignEvent "idle_smoke"              "spawn_item"   {0}  "smoking_draw" {80} "smoking_blow" {115} "buff_apply"  {115} "item_change" {125}
assignEvent "idle_eat_long"           "eat_sound"    {0}  "spawn_item"   {0}  "buff_apply"   {30}  "item_change" {40}
assignEvent "idle_drink"              "drink_sound"  {0}  "spawn_item"   {0}  "buff_apply"   {30}
assignEvent "swift_sit_idle_drink"    "drink_sound"  {0}  "spawn_item"   {0}  "buff_apply"   {30}
assignEvent "swift_sit_idle_smoke"    "spawn_item"   {0}  "smoking_draw" {80} "smoking_blow" {115} "buff_apply"  {115} "item_change" {125}
assignEvent "dig_delve_right"         "dust"         {25} "dig_sound"    {20} "dig" {70}

--equip
assignEvent "equip__1hm_idle"   "equip"        {12}
assignEvent "equip__pistol_idle"      "equip"        {7}
assignEvent "equip__rifle_idle"       "equip"        {10}
assignEvent "equip__rifle_idle"       "equip"        {10}
--unequip
assignEvent "unequip__1hm_idle" "unequip"      {11}
assignEvent "unequip__pistol_idle"    "unequip"      {15}
assignEvent "unequip__rifle_idle"     "unequip"      {22}
assignEvent "unequip__rifle_idle"     "unequip"      {22}

--Combat
assignEvent "1hm_idle_melee"    "attack"       {15,19}
assignEvent "1hm_idle_melee_2"  "attack"       {15,19}
assignEvent "1hm_idle_melee_3"  "attack"       {17,20}
assignEvent "1hm_idle_melee_4"  "attack"       {15,30}
assignEvent "h2h_idle_melee"       "attack"       {9,13}
assignEvent "h2h_idle_melee_2"       "attack"       {15,17}

--Movement
assignEvent "walk_front"                 "step1" {10} "step2" {33}
assignEvent "walk_left"                  "step1" {10} "step2" {33}
assignEvent "walk_right"                 "step1" {10} "step2" {33}
assignEvent "walk_back"                  "step1" {10} "step2" {33}
assignEvent "walk_front"                 "step1" {10} "step2" {33}
assignEvent "1hm_walk_front"       "step1" {10} "step2" {33}
assignEvent "bag_walk_front"             "step1" {10} "step2" {33}
assignEvent "bag_walk_front_2"           "step1" {10} "step2" {33}
assignEvent "pistol_walk_front"          "step1" {10} "step2" {33}
assignEvent "pistol_aim_walk_front"      "step1" {10} "step2" {33}
assignEvent "revolver_walk_front"        "step1" {10} "step2" {33}
assignEvent "revolver_aim_walk_front"    "step1" {10} "step2" {33}
assignEvent "rifle_walk_front"           "step1" {10} "step2" {33}
assignEvent "rifle_aim_walk_front"       "step1" {10} "step2" {33}
assignEvent "shotgun_walk_front"         "step1" {10} "step2" {33}
assignEvent "shotgun_aim_walk_front"     "step1" {10} "step2" {33}
assignEvent "run_front"                  "step1" {10} "step2" {22}
assignEvent "pistol_run_front"           "step1" {10} "step2" {22}
assignEvent "pistol_aim_run_front"       "step1" {10} "step2" {22}
assignEvent "revolver_run_front"         "step1" {10} "step2" {22}
assignEvent "revolver_aim_run_front"     "step1" {10} "step2" {22}
assignEvent "rifle_run_front"            "step1" {10} "step2" {22}
assignEvent "rifle_aim_run_front"        "step1" {10} "step2" {22}
assignEvent "shotgun_run_front"          "step1" {10} "step2" {22}
assignEvent "shotgun_aim_run_front"      "step1" {10} "step2" {22}

-- assign sounds to events here
event "smoking_draw"     {"Play_human_male_smoking_draw"}
event "smoking_blow"     {"Play_human_male_smoking_blow"}
event "drink_sound"      {"Play_human_male_drink"}
event "eat_sound"        {"Play_human_male_eat"}

eventUnassigned "step_dirt"    {"Play_step_dirt"}
eventUnassigned "step_metal"   {"Play_step_metal"}
eventUnassigned "dig_dirt"     {"Play_shovel_digging_dirt"}
eventUnassigned "dig_shit"     {"Play_shovel_digging_shit"}

-- set sound parameters here
sound "Play_shovel_digging_dirt"     {distance = 2000, channel = 0, priority= 1}
sound "Play_shovel_digging_shit"     {distance = 2000, channel = 0, priority= 1}
sound "Play_human_male_smoking_draw" {distance = 500, channel = 0, priority = 1}
sound "Play_human_male_smoking_blow" {distance = 500, channel = 0, priority = 1}
sound "Play_human_male_drink"        {distance = 500, channel = 0, priority = 1}
sound "Play_human_male_eat"          {distance = 500, channel = 0, priority = 1}
sound "Play_step_dirt"               {distance = 1000, channel = 5, priority= 1}
sound "Play_step_metal"              {distance = 1000, channel = 5, priority= 1}

local data = {}

data.animations      = animations
data.animationEvents = animationEvents
data.events          = events
data.sounds          = sounds

return data
