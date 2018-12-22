local animations = {
   idle = {
      default = {"idle","idle_2","idle_3","idle_4","idle_5","idle_look"},
      melee_low = "idle_1h_weapon",
      shotgun = {"idle_shotgun", "idle_shotgun_aim"},
      carbine = {"idle_rifle", "idle_rifle_aim"},
      pistol = {"idle_pistol", "idle_pistol_aim"},
      attack = {
         default = "",
         melee_low = { "melee_idle_1h_weapon", "melee_idle_1h_weapon_1", "melee_idle_1h_weapon_2", "melee_idle_1h_weapon_3", },
         boxing = {"melee_idle_hand_1", "melee_idle_hand_2"},
         pistol = "recoil__idle_pistol",
         shotgun = "recoil__idle_shotgun",
         carbine = "recoil__idle_rifle",
      },
      cock = {
         shotgun = "cock__idle_shotgun",
         carbine = "cock__idle_carbine",
         rifle = "cock__idle_rifle",
      },
      drink = {
         default = "idle_drink",
      },
      eat = {
         default = "idle_eat_long",
      },
      to =
      {
         default = "",
         smoke = "idle_to_smoking",
      },
   },
   walk = {
      front = {
         default = "walk_front",
         attack = {
            melee_low = { "melee_idle_1h_weapon", "melee_idle_1h_weapon_1", "melee_idle_1h_weapon_2", "melee_idle_1h_weapon_3", },
            boxing = {"melee_idle_hand_1", "melee_idle_hand_2"},
            pistol = "recoil__idle_pistol",
            shotgun = "recoil__walk_front_shotgun",
            carbine = "recoil__walk_front_rifle",
         },
      },
      back = {
         default = "walk_back",
         attack = {
            melee_low = { "melee_idle_1h_weapon", "melee_idle_1h_weapon_1", "melee_idle_1h_weapon_2", "melee_idle_1h_weapon_3", },
            boxing = {"melee_idle_hand_1", "melee_idle_hand_2"},
            pistol = "recoil__idle_pistol",
            shotgun = "recoil__walk_front_shotgun",
            carbine = "recoil__walk_front_rifle",
         },
      },
      left = {
         default = "walk_left",
         attack = {
            melee_low = { "melee_idle_1h_weapon", "melee_idle_1h_weapon_1", "melee_idle_1h_weapon_2", "melee_idle_1h_weapon_3", },
            boxing = {"melee_idle_hand_1", "melee_idle_hand_2"},
            pistol = "recoil__idle_pistol",
            shotgun = "recoil__walk_front_shotgun",
            carbine = "recoil__walk_front_rifle",
         },
      },
      right = {
         default = "walk_right",
         attack = {
            melee_low = { "melee_idle_1h_weapon", "melee_idle_1h_weapon_1", "melee_idle_1h_weapon_2", "melee_idle_1h_weapon_3", },
            boxing = {"melee_idle_hand_1", "melee_idle_hand_2"},
            pistol = "recoil__idle_pistol",
            shotgun = "recoil__walk_front_shotgun",
            carbine = "recoil__walk_front_rifle",
         },
      },
   },
   run = {
      front = {
         default = "run_front",
         attack = {
            melee_low = { "melee_idle_1h_weapon", "melee_idle_1h_weapon_1", "melee_idle_1h_weapon_2", "melee_idle_1h_weapon_3", },
            boxing = {"melee_idle_hand_1", "melee_idle_hand_2"},
            pistol = "recoil__idle_pistol",
            shotgun = "recoil__run_front_shotgun",
            carbine = "recoil__run_front_rifle",
         },
      },
      back = {
         default = "run_front",
         -- default = "run_back",
         attack = {
            melee_low = { "melee_idle_1h_weapon", "melee_idle_1h_weapon_1", "melee_idle_1h_weapon_2", "melee_idle_1h_weapon_3", },
            boxing = {"melee_idle_hand_1", "melee_idle_hand_2"},
            pistol = "recoil__idle_pistol",
            shotgun = "recoil__run_front_shotgun",
            carbine = "recoil__run_front_rifle",
         },
      },
      left = {
         default = "run_front",
         -- default = "run_left",
         attack = {
            melee_low = { "melee_idle_1h_weapon", "melee_idle_1h_weapon_1", "melee_idle_1h_weapon_2", "melee_idle_1h_weapon_3", },
            boxing = {"melee_idle_hand_1", "melee_idle_hand_2"},
            pistol = "recoil__idle_pistol",
            shotgun = "recoil__run_front_shotgun",
            carbine = "recoil__run_front_rifle",
         },
      },
      right = {
         default = "run_front",
         -- default = "run_right",
         attack = {
            melee_low = { "melee_idle_1h_weapon", "melee_idle_1h_weapon_1", "melee_idle_1h_weapon_2", "melee_idle_1h_weapon_3", },
            boxing = {"melee_idle_hand_1", "melee_idle_hand_2"},
            pistol = "recoil__idle_pistol",
            shotgun = "recoil__run_front_shotgun",
            carbine = "recoil__run_front_rifle",
         },
      },
   },
   turn = {
      left = {
         step    = "turn_left",
         quarter = "turn_left_90",
         full    = "turn_left_180",
      },
      right = {
         step    = "turn_right",
         quarter = "turn_right_90",
         full    = "turn_right_180",
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
         front = "hit__front_pistol",
         back = "hit__back_pistol",
         left = "hit__left_pistol",
         right = "hit__right_pistol",
      },
      shotgun = {
         front = "hit__front_shotgun",
         back = "hit__back_shotgun",
         left = "hit__left_shotgun",
         right = "hit__right_shotgun",
      },
      carbine = {
         front = "hit__front_rifle",
         back = "hit__back_rifle",
         left = "hit__left_rifle",
         right = "hit__right_rifle",
      },
      melee_low = {
         front = "hit__front_1h_weapon",
         back = "hit__back_1h_weapon",
         left = "hit__left_1h_weapon",
         right = "hit__right_1h_weapon",
      },
      shield = {
         pistol = {
            front = "hit__shield_front_pistol",
            back = "hit__shield_back_pistol",
            left = "hit__shield_left_pistol",
            right = "hit__shield_right_pistol",
         },
         melee_low = {
            front = "hit__shield_front_1h_weapon",
            back = "hit__shield_back_1h_weapon",
            left = "hit__shield_left_1h_weapon",
            right = "hit__shield_right_1h_weapon",
         },
      },
   },
   equip = {
      idle = {
         melee_low = "equip__1h_weapon_idle",
         pistol    = "equip__pistol_idle",
         shotgun   = "equip__rifle_idle",
         carbine   = "equip__rifle_idle",
      },
   },
   unequip = {
      idle = {
         melee_low = "unequip__1h_weapon_idle",
         pistol    = "unequip__pistol_idle",
         shotgun   = "unequip__rifle_idle",
         carbine   = "unequip__rifle_idle",
      },
   },
   fall = {
      default   = "jump_falling",
      pistol    = "jump_falling",
      shotgun   = "jump_falling_rifle",
      carbine   = "jump_falling_rifle",
   },
   land = {
      default = {
         default = "jump_land",
         pistol = "jump_land_pistol",
         shotgun = "jump_land_rifle",
         carbine = "jump_land_rifle",
      },
      hard = {
         default = "jump_land_hard",
         pistol = "jump_land_hard_pistol",
         shotgun = "jump_land_hard_rifle",
         carbine = "jump_land_hard_rifle",
      },
   },

   dance = {
      default = {"dance_1", "dance_2"}
   },
   die = {
      -- default = {"death", "kd_front", "kd_back"},
      default = "death",
   },
}


local EventsGenerator = require "eventsGenerator"
local generator = EventsGenerator()
-- data
local animationEvents, events, sounds = generator.animationEvents, generator.events, generator.sounds
-- dsl functions
local assignEvent, event, eventUnassigned, sound = generator.assignEvent, generator.event, generator.eventUnassigned, generator.sound
local soundTable, getSoundTable = generator.soundTable, generator.getSoundTable

-- assign events to animations here
assignEvent "sit_swift_smoke"         "smoking_draw" {57} "smoking_blow" {93} "smoke"        {93,158}
assignEvent "idle_to_smoking"         "spawn_item"   {0}  "smoking_draw" {80} "smoking_blow" {115} "buff_apply"  {115} "item_change" {125}
assignEvent "idle_eat_long"           "eat_sound"    {0}  "spawn_item"   {0}  "buff_apply"   {30}  "item_change" {40}
assignEvent "idle_drink"              "drink_sound"  {0}  "spawn_item"   {0}  "buff_apply"   {30}

--equip
assignEvent "equip__1h_weapon_idle"   "equip"        {12}
assignEvent "equip__pistol_idle"      "equip"        {7}
assignEvent "equip__rifle_idle"       "equip"        {10}
assignEvent "equip__rifle_idle"       "equip"        {10}
--unequip
assignEvent "unequip__1h_weapon_idle" "unequip"      {11}
assignEvent "unequip__pistol_idle"    "unequip"      {15}
assignEvent "unequip__rifle_idle"     "unequip"      {22}
assignEvent "unequip__rifle_idle"     "unequip"      {22}

--Combat
assignEvent "melee_idle_1h_weapon"    "attack"       {15,19}
assignEvent "melee_idle_1h_weapon_1"  "attack"       {15,19}
assignEvent "melee_idle_1h_weapon_2"  "attack"       {17,20}
assignEvent "melee_idle_1h_weapon_3"  "attack"       {15,30}
assignEvent "melee_idle_hand_1"       "attack"       {9,13}
assignEvent "melee_idle_hand_2"       "attack"       {15,17}

--Movement
assignEvent "walk_front"                 "step1" {10} "step2" {33}
assignEvent "walk_left"                  "step1" {10} "step2" {33}
assignEvent "walk_right"                 "step1" {10} "step2" {33}
assignEvent "walk_back"                  "step1" {10} "step2" {33}
assignEvent "walk_front"                 "step1" {10} "step2" {33}
assignEvent "walk_front_1h_weapon"       "step1" {10} "step2" {33}
assignEvent "walk_front_bag"             "step1" {10} "step2" {33}
assignEvent "walk_front_bag_2"           "step1" {10} "step2" {33}
assignEvent "walk_front_pistol"          "step1" {10} "step2" {33}
assignEvent "walk_front_pistol_aim"      "step1" {10} "step2" {33}
assignEvent "walk_front_revolver"        "step1" {10} "step2" {33}
assignEvent "walk_front_revolver_aim"    "step1" {10} "step2" {33}
assignEvent "walk_front_rifle"           "step1" {10} "step2" {33}
assignEvent "walk_front_rifle_aim"       "step1" {10} "step2" {33}
assignEvent "walk_front_shotgun"         "step1" {10} "step2" {33}
assignEvent "walk_front_shotgun_aim"     "step1" {10} "step2" {33}
assignEvent "run_front"                  "step1" {10} "step2" {22}
assignEvent "run_front_pistol"           "step1" {10} "step2" {22}
assignEvent "run_front_pistol_aim"       "step1" {10} "step2" {22}
assignEvent "run_front_revolver"         "step1" {10} "step2" {22}
assignEvent "run_front_revolver_aim"     "step1" {10} "step2" {22}
assignEvent "run_front_rifle"            "step1" {10} "step2" {22}
assignEvent "run_front_rifle_aim"        "step1" {10} "step2" {22}
assignEvent "run_front_shotgun"          "step1" {10} "step2" {22}
assignEvent "run_front_shotgun_aim"      "step1" {10} "step2" {22}

-- assign sounds to events here
event "smoking_draw"     {getSoundTable "shared.smoke_draw"}
event "smoking_blow"     {getSoundTable "shared.smoke_blow"}
event "drink_sound"      {getSoundTable "shared.drink"}
event "eat_sound"        {getSoundTable "shared.eat"}

eventUnassigned "step_dirt"    {getSoundTable "shared.step_dirt"}
eventUnassigned "step_metal"   {getSoundTable "shared.step_metal"}

-- set sound parameters here
soundTable "shared.smoke_draw"    {distance = 500, channel = 0, priority = 1}
soundTable "shared.smoke_blow"    {distance = 500, channel = 0, priority = 1}
soundTable "shared.drink"         {distance = 500, channel = 0, priority = 1}
soundTable "shared.eat"           {distance = 500, channel = 0, priority = 1}
soundTable "shared.step_dirt"     {distance = 1000, channel = 5, priority= 1}
soundTable "shared.step_metal"    {distance = 1000, channel = 5, priority= 1}

local data = {}

data.animations      = animations
data.animationEvents = animationEvents
data.events          = events
data.sounds          = sounds

return data
