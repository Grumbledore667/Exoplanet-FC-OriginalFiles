local animations = {
   idle =
   {
      default   = { "idle", "idle_2", "idle_3" },
      melee_low = "idle_machete",
      boxing    = "idle_boxing",
      pistol    = { "idle_pistol",  "idle_pistol_2",  "idle_pistol_aim" },
      shotgun   = { "idle_shotgun", "idle_shotgun_2", "idle_shotgun_aim" },
      carbine   = { "idle_shotgun", "idle_shotgun_2", "idle_shotgun_aim" },
      detect    = "idle_detect",
      jump      =
      {
         default   = "idle_jump",
         melee_low = "idle_jump",
         boxing    = "idle_jump",
         pistol    = "idle_jump",
         shotgun   = "idle_jump",
         carbine   = "idle_jump",
      },
      attack =
      {
         default   = "",
         melee_low = "melee_idle_machete",
         melee_alt = "melee_idle_machete_alt",
         boxing    = {"melee_idle_boxing_1", "melee_idle_boxing_4"},
         boxing_alt= {"melee_idle_boxing_2", "melee_idle_boxing_3"},
         pistol    = "recoil__idle_pistol",
         shotgun   = "recoil2__idle_shotgun",
         carbine   = "recoil2__idle_shotgun",
      },
      cock =
      {
         shotgun = "reload2__shotgun_idle",
         carbine = "reload2__carbine_idle",
      },
      scan =
      {
         default = "device__hand_end_20",
         detect = "device__detect_use_idle",
      },
      lootbox =
      {
         to   = "idle_lootbox_open",
         loop = "idle_lootbox",
         out  = "idle_lootbox_close",
      },
      drink =
      {
         default   = "drink_short",
      },
      eat =
      {
         default   = "eat_short",
         left_handed = "idle_to_eat",
      },
      smoke =
      {
         default   = "idle_smoking",
      },
      injector =
      {
         default   = "use__injector_idle",
      },
      to =
      {
         default              = "",
         crouch               = "idle_to_crouch",
         sitbyfire            = "idle_to_sitbyfire",
         sleep                = "idle_to_sleep",
         smoke                = "idle_to_smoking",
         takeobject           = "idle_to_take_object",
         takeobjectfast       = "idle_to_take_object_fast",
         takeobjectfast_table = "idle_to_take_object_front",
         takeobjectfast_top   = "idle_to_take_object_top",
      },
   },
   walk =
   {
      back =
      {
         default   = "walk_back",
         melee_low = { "walk_back_machete", "walk_back_machete_aim", },
         pistol    = { "walk_back_pistol", "walk_back_pistol_aim" },
         shotgun   = { "walk_back_shotgun", "walk_back_shotgun_aim" },
         carbine   = { "walk_back_shotgun", "walk_back_shotgun_aim" },
         detect    = "walk_back_detect",
         jump      =
         {
            default   = "jump_walk_back",
            melee_low = "jump_walk_back",
            pistol    = "jump_walk_back_pistol",
            shotgun   = "jump_walk_back_shotgun",
            carbine   = "jump_walk_back_shotgun",
         },
         attack =
         {
            default   = "",
            melee_low = "melee__fire_machete",
            melee_alt = "melee__fire_machete_alt",
            boxing    = "melee__fire_machete",
            pistol    = "recoil__walk_back_pistol",
            shotgun   = "recoil2__walk_back_shotgun",
            carbine   = "recoil2__walk_back_shotgun",
         },
         cock =
         {
            shotgun = "reload2__shotgun_walk",
            carbine = "reload2__carbine_walk",
         },
         scan =
         {
            default = "device__hand_end_20",
            detect = "device__detect_use_walk_back",
         },
      },
      front =
      {
         default   = "walk_front",
         melee_low = { "walk_front_machete", "walk_front_machete_aim", },
         pistol    = { "walk_front_pistol", "walk_front_pistol_aim" },
         shotgun   = { "walk_front_shotgun", "walk_front_shotgun_aim" },
         carbine   = { "walk_front_shotgun", "walk_front_shotgun_aim" },
         detect    = "walk_front_detect",
         jump      =
         {
            default   = "jump_walk_front",
            melee_low = "jump_walk_front",
            pistol    = "jump_walk_front_pistol",
            shotgun   = "jump_walk_front_shotgun",
            carbine   = "jump_walk_front_shotgun",
         },
         attack =
         {
            default   = "",
            melee_low = "melee__fire_machete",
            melee_alt = "melee__fire_machete_alt",
            boxing    = "melee__fire_machete",
            pistol    = "recoil__walk_front_pistol",
            shotgun   = "recoil2__walk_front_shotgun",
            carbine   = "recoil2__walk_front_shotgun",
         },
         cock =
         {
            shotgun = "reload2__shotgun_walk",
            carbine = "reload2__carbine_walk",
         },
         scan =
         {
            default = "device__hand_end_20",
            detect = "device__detect_use_walk_front",
         },
      },
      left =
      {
         default   = "walk_left",
         melee_low = { "walk_left_machete", "walk_left_machete_aim", },
         pistol    = { "walk_left_pistol", "walk_left_pistol_aim" },
         shotgun   = { "walk_left_shotgun", "walk_left_shotgun_aim" },
         carbine   = { "walk_left_shotgun", "walk_left_shotgun_aim" },
         detect    = "walk_left_detect",
         jump      =
         {
            default   = "jump_walk_left",
            melee_low = "jump_walk_left",
            pistol    = "jump_walk_left_pistol",
            shotgun   = "jump_walk_left_shotgun",
            carbine   = "jump_walk_left_shotgun",
         },
         attack =
         {
            default   = "",
            melee_low = "melee__fire_machete",
            melee_alt = "melee__fire_machete_alt",
            boxing    = "melee__fire_machete",
            pistol    = "recoil__walk_left_pistol",
            shotgun   = "recoil2__walk_left_shotgun",
            carbine   = "recoil2__walk_left_shotgun",
         },
         cock =
         {
            shotgun = "reload2__shotgun_walk",
            carbine = "reload2__carbine_walk",
         },
         scan =
         {
            default = "device__hand_end_20",
            detect = "device__detect_use_walk_left",
         },
      },
      right =
      {
         default   = "walk_right",
         melee_low = { "walk_right_machete", "walk_right_machete_aim", },
         pistol    = { "walk_right_pistol", "walk_right_pistol_aim" },
         shotgun   = { "walk_right_shotgun", "walk_right_shotgun_aim" },
         carbine   = { "walk_right_shotgun", "walk_right_shotgun_aim" },
         detect    = "walk_right_detect",
         jump      =
         {
            default   = "jump_walk_right",
            melee_low = "jump_walk_right",
            pistol    = "jump_walk_right_pistol",
            shotgun   = "jump_walk_right_shotgun",
            carbine   = "jump_walk_right_shotgun",
         },
         attack =
         {
            default   = "",
            melee_low = "melee__fire_machete",
            melee_alt = "melee__fire_machete_alt",
            boxing    = "melee__fire_machete",
            pistol    = "recoil__walk_right_pistol",
            shotgun   = "recoil2__walk_right_shotgun",
            carbine   = "recoil2__walk_right_shotgun",
         },
         cock =
         {
            shotgun = "reload2__shotgun_walk",
            carbine = "reload2__carbine_walk",
         },
         scan =
         {
            default = "device__hand_end_20",
            detect = "device__detect_use_walk_right",
         },
      },
   },
   run =
   {
      back =
      {
         default   = "run_back",
         melee_low = { "run_back_machete", "run_back_machete_aim", },
         pistol    = { "run_back_pistol", "run_back_pistol_aim" },
         shotgun   = { "run_back_shotgun", "run_back_shotgun_aim" },
         carbine   = { "run_back_shotgun", "run_back_shotgun_aim" },
         jump      =
         {
            default   = "jump_run_back",
            melee_low = "jump_run_back",
            pistol    = "jump_run_back_pistol",
            shotgun   = "jump_run_back_shotgun",
            carbine   = "jump_run_back_shotgun",
         },
         attack =
         {
            default   = "",
            melee_low = "melee__fire_machete",
            melee_alt = "melee__fire_machete_alt",
            boxing    = "melee__fire_machete",
            pistol    = "recoil__run_back_pistol",
            shotgun   = "recoil2__run_back_shotgun",
            carbine   = "recoil2__run_back_shotgun",
         },
         cock =
         {
            shotgun = "reload2__shotgun_run",
            carbine = "reload2__carbine_run",
         },
         scan =
         {
            default = "device__hand_end_20",
         },
      },
      front =
      {
         default   = "run_front",
         melee_low = { "run_front_machete", "run_front_machete_aim", },
         pistol    = { "run_front_pistol", "run_front_pistol_aim" },
         shotgun   = { "run_front_shotgun", "run_front_shotgun_aim" },
         carbine   = { "run_front_shotgun", "run_front_shotgun_aim" },
         jump      =
         {
            default   = "jump_run_front",
            melee_low = "jump_run_front",
            pistol    = "jump_run_front_pistol",
            shotgun   = "jump_run_front_shotgun",
            carbine   = "jump_run_front_shotgun",
         },
         attack =
         {
            default   = "",
            melee_low = "melee__fire_machete",
            melee_alt = "melee__fire_machete_alt",
            boxing    = "melee__fire_machete",
            pistol    = "recoil__run_front_pistol",
            shotgun   = "recoil2__run_front_shotgun",
            carbine   = "recoil2__run_front_shotgun",
         },
         cock =
         {
            shotgun = "reload2__shotgun_run",
            carbine = "reload2__carbine_run",
         },
         scan =
         {
            default = "device__hand_end_20",
         },
      },
      left =
      {
         default   = "run_left",
         melee_low = { "run_left_machete", "run_left_machete_aim", },
         pistol    = { "run_left_pistol", "run_left_pistol_aim" },
         shotgun   = { "run_left_shotgun", "run_left_shotgun_aim" },
         carbine   = { "run_left_shotgun", "run_left_shotgun_aim" },
         jump      =
         {
            default   = "jump_run_left",
            melee_low = "jump_run_left",
            pistol    = "jump_run_left_pistol",
            shotgun   = "jump_run_left_shotgun",
            carbine   = "jump_run_left_shotgun",
         },
         attack =
         {
            default   = "",
            melee_low = "melee__fire_machete",
            melee_alt = "melee__fire_machete_alt",
            boxing    = "melee__fire_machete",
            pistol    = "recoil__run_left_pistol",
            shotgun   = "recoil2__run_left_shotgun",
            carbine   = "recoil2__run_left_shotgun",
         },
         cock =
         {
            shotgun = "reload2__shotgun_run",
            carbine = "reload2__carbine_run",
         },
         scan =
         {
            default = "device__hand_end_20",
         },
      },
      right =
      {
         default   = "run_right",
         melee_low = { "run_right_machete", "run_right_machete_aim", },
         pistol    = { "run_right_pistol", "run_right_pistol_aim" },
         shotgun   = { "run_right_shotgun", "run_right_shotgun_aim" },
         carbine   = { "run_right_shotgun", "run_right_shotgun_aim" },
         jump      =
         {
            default   = "jump_run_right",
            melee_low = "jump_run_right",
            pistol    = "jump_run_right_pistol",
            shotgun   = "jump_run_right_shotgun",
            carbine   = "jump_run_right_shotgun",
         },
         attack =
         {
            default   = "",
            melee_low = "melee__fire_machete",
            melee_alt = "melee__fire_machete_alt",
            boxing    = "melee__fire_machete",
            pistol    = "recoil__run_right_pistol",
            shotgun   = "recoil2__run_right_shotgun",
            carbine   = "recoil2__run_right_shotgun",
         },
         cock =
         {
            shotgun = "reload2__shotgun_run",
            carbine = "reload2__carbine_run",
         },
         scan =
         {
            default = "device__hand_end_20",
         },
      },
   },
   step =
   {
      back =
      {
         default   = "",
         melee_low = "step_back_machete",
         boxing    = "step_back_machete",
         pistol    = "step_back_pistol",
         shotgun   = "step_back_shotgun",
         carbine   = "step_back_shotgun",
      },
      right =
      {
         default   = "",
         melee_low = "step_right_machete",
         boxing    = "step_right_machete",
         pistol    = "step_right_pistol",
         shotgun   = "step_right_shotgun",
         carbine   = "step_right_shotgun",
      },
      left =
      {
         default   = "",
         melee_low = "step_left_machete",
         boxing    = "step_left_machete",
         pistol    = "step_left_pistol",
         shotgun   = "step_left_shotgun",
         carbine   = "step_left_shotgun",
      },
   },
   sprint = {
      front =
      {
         default = "sprint_front",
         shotgun = "sprint_front_shotgun",
         carbine = "sprint_front_shotgun",
         jump    =
         {
            default   = "jump_run_front",
            melee_low = "jump_run_front",
            pistol    = "jump_run_front_pistol",
            shotgun   = "jump_run_front_shotgun",
            carbine   = "jump_run_front_shotgun",
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
   swim = {
      idle  = "swim_surface_idle",
      back  = "swim_surface_back",
      front = "swim_surface_front",
      left  = "swim_surface_left",
      right = "swim_surface_right",
   },
   land = {
      default = {
         default = "jump_land",
         pistol = "jump_land_pistol",
         shotgun = "jump_land_shotgun",
         carbine = "jump_land_shotgun",
      },
      hard ={
         default = "jump_land_hard",
         pistol = "jump_land_hard_pistol",
         shotgun = "jump_land_hard_shotgun",
         carbine = "jump_land_hard_shotgun",
      },
   },
   slide = {
      default = "slide_idle",
      melee_low = "slide_idle_machete",
      pistol = "slide_idle_pistol",
      shotgun = "slide_idle_shotgun",
      carbine = "slide_idle_shotgun",
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
   ladder = {
      up = {
         to = "ladder_start_bottom_r",
         loop  = "ladder_loop_r",
         out  = "ladder_end_up_r",
      },
      down = {
         to = "ladder_start_up_l",
         loop  = "ladder_loop_down_l",
         out  = "ladder_end_down_l",
      },
   },
   sleepAtBed =
   {
      to   = "idle_to_sleep_bed",
      loop = "sleep_bed",
      out  = "sleep_bed_to_idle",
   },
   knockout =
   {
      idle   = "death_pose3",
   },
   fall      =
   {
      default   = "jump_falling",
      pistol    = "jump_falling_pistol",
      shotgun   = "jump_falling_shotgun",
      carbine   = "jump_falling_shotgun",
   },
   sitbyfire =
   {
      default = "sitbyfire",
      cook = "sitbyfire_roast_meat",
      drink = "sitbyfire_drink",
      eat = "sitbyfire_eat",
      sleep = "sitbyfire_sleep",
      to =
      {
         idle = "sitbyfire_to_idle",
      },
   },
   crouch =
   {
      default = "crouch",
      cook = "crouch_roast_meat",
      takeobject = "crouch_take_object_fast",
      device = "device_crouch_loop",
      to =
      {
         idle = "crouch_to_idle",
      },
   },
   equip =
   {
      idle =
      {
         melee_low = "equip__machete_idle",
         pistol = "equip__pistol_idle",
         shotgun = "equip__shotgun_idle",
         carbine = "equip__shotgun_idle",
         detect = "device__detect_start",
      },
      walk =
      {
         melee_low = "equip__machete_walk",
         pistol = "equip__pistol_walk",
         shotgun = "equip__shotgun_walk",
         carbine = "equip__shotgun_walk",
         detect = "device__detect_start",
      },
      run =
      {
         melee_low = "equip__machete_run",
         pistol = "equip__pistol_run",
         shotgun = "equip__shotgun_run",
         carbine = "equip__shotgun_run",
         detect = "device__detect_start",
      },
      sprint =
      {
         melee_low = "equip__machete_run",
         pistol = "equip__pistol_run",
         shotgun = "equip__shotgun_run",
         carbine = "equip__shotgun_run",
         detect = "device__detect_start",
      },
   },
   unequip =
   {
      idle =
      {
         melee_low = "unequip__machete_idle",
         pistol = "unequip__pistol_idle",
         shotgun = "unequip__shotgun_idle",
         carbine = "unequip__shotgun_idle",
      },
      walk =
      {
         melee_low = "unequip__machete_walk",
         pistol = "unequip__pistol_walk",
         shotgun = "unequip__shotgun_walk",
         carbine = "unequip__shotgun_walk",
      },
      run =
      {
         melee_low = "unequip__machete_run",
         pistol = "unequip__pistol_run",
         shotgun = "unequip__shotgun_run",
         carbine = "unequip__shotgun_run",
      },
      sprint =
      {
         melee_low = "unequip__machete_run",
         pistol = "unequip__pistol_run",
         shotgun = "unequip__shotgun_run",
         carbine = "unequip__shotgun_run",
      },
   },
   reload =
   {
      idle =
      {
         pistol1 = "reload__pistol1_idle",
         pistol2 = "reload__pistol2_idle",
         flare = "reload__flaregun_idle",
         shotgun1 = { "reload2__shotgun1_idle_in", "reload2__shotgun1_idle_loop", "reload2__shotgun1_idle_out" },
         shotgun2 = "reload2__shotgun2_idle",
         carbine = { "reload2__carabine_idle_in", "reload2__carabine_idle_loop", "reload2__carabine_idle_out" },
      },
      walk =
      {
         pistol1 = "reload__pistol1_walk",
         pistol2 = "reload__pistol2_walk",
         flare = "reload__flaregun_walk",
         shotgun1 = { "reload2__shotgun1_walk_in", "reload2__shotgun1_walk_loop", "reload2__shotgun1_walk_out" },
         shotgun2 = "reload2__shotgun2_walk",
         carbine = { "reload2__carabine_walk_in", "reload2__carabine_walk_loop", "reload2__carabine_walk_out" },
      },
      run =
      {
         pistol1 = "reload__pistol1_run",
         pistol2 = "reload__pistol2_run",
         flare = "reload__flaregun_run",
         shotgun1 = { "reload2__shotgun1_run_in", "reload2__shotgun1_run_loop", "reload2__shotgun1_run_out" },
         shotgun2 = "reload2__shotgun2_run",
         carbine = { "reload2__carabine_run_in", "reload2__carabine_run_loop", "reload2__carabine_run_out" },
      },
   },
   mine =
   {
      down = "pickaxe_down",
      front = "pickaxe_front",
   },
   dig =
   {
      default = "dig",
   },
   control =
   {
      default = "device_crouch_loop",
   },
   hit =
   {
      default = "hit__default",
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
      -- hit animations don't match current idle pose with melee weapons
      -- melee_low = {
      --    front = "hit__machete_front",
      --    back = "hit__machete_back",
      --    left = "hit__machete_left",
      --    right = "hit__machete_right",
      -- },
      boxing = {
         front = "hit__boxing_front",
         back = "hit__boxing_back",
         left = "hit__boxing_left",
         right = "hit__boxing_right",
      },
   },
   die =
   {
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
assignEvent "device_hand"                     "button" {120}
assignEvent "device__hand_end_20"             "button" {3}
assignEvent "device__detect_use_idle"         "button" {15}
assignEvent "device__detect_use_walk_front"   "button" {15}
assignEvent "device__detect_use_walk_back"    "button" {15}
assignEvent "device__detect_use_walk_left"    "button" {15}
assignEvent "device__detect_use_walk_right"   "button" {15}
assignEvent "device__left"                    "reload"          {50}
assignEvent "drink_short"                     "drink_start"     {0}  "buff_apply"   {65} "item_change" {81}
assignEvent "eat_short"                       "eat_start"       {10} "buff_apply"   {10} "item_change" {44}
assignEvent "idle_to_eat"                     "spawn_item"      {30} "buff_apply"   {167}
assignEvent "sitbyfire_drink"                 "drink_start"     {0}  "buff_apply"   {10}
assignEvent "sitbyfire_eat"                   "eat_start"       {10} "buff_apply"   {10} "item_change" {74}
assignEvent "idle_to_smoking"                 "smoking_draw"    {80} "smoking_blow" {115} "buff_apply" {115} "item_change" {125}
assignEvent "idle_smoking"                    "smoking_draw"    {52} "smoking_blow" {110} "smoke"      {110,133}
assignEvent "use__injector_idle"              "injector_sound"  {16} "buff_apply"   {20} "item_change" {20}
assignEvent "idle_cutting_chip"               "chip_cut_sound"  {0}

--Interactions
assignEvent "idle_to_take_object_fast"     "obj_taken"    {10} "end" {25}
assignEvent "idle_to_take_object_front"    "obj_taken"    {15} "end" {25}
assignEvent "idle_to_take_object_top"      "obj_taken"    {10} "end" {25}
assignEvent "idle_lootbox_open"            "end"          {25}
assignEvent "idle_lootbox_close"           "end"          {25}
assignEvent "dig"                          "dust"         {25} "dig_sound" {20} "dig" {70} "end" {98}
assignEvent "pickaxe_down"                 "mine_sound"   {42} "mine_success" {42} "hit" {42} "end" {100}
assignEvent "pickaxe_front"                "mine_sound"   {30} "mine_success" {30} "hit" {30} "end" {50}

--Combat
assignEvent "hit__default"                 "hurt"         {0}
assignEvent "hit__pistol_front"            "hurt"         {0}
assignEvent "hit__pistol_left"             "hurt"         {0}
assignEvent "hit__pistol_right"            "hurt"         {0}
assignEvent "hit__pistol_back"             "hurt"         {0}
assignEvent "hit__shotgun_front"           "hurt"         {0}
assignEvent "hit__shotgun_left"            "hurt"         {0}
assignEvent "hit__shotgun_right"           "hurt"         {0}
assignEvent "hit__shotgun_back"            "hurt"         {0}
assignEvent "hit__boxing_front"            "hurt"         {0}
assignEvent "hit__boxing_left"             "hurt"         {0}
assignEvent "hit__boxing_right"            "hurt"         {0}
assignEvent "hit__boxing_back"             "hurt"         {0}

assignEvent "melee_idle_boxing_1"          "attack"       {4,7}
assignEvent "melee_idle_boxing_2"          "attack"       {11,15}
assignEvent "melee_idle_boxing_3"          "attack"       {12,18}
assignEvent "melee_idle_boxing_4"          "attack"       {9,13}
assignEvent "melee_idle_machete"           "attack"       {8,12}
assignEvent "melee_idle_machete_alt"       "attack"       {5,10}
assignEvent "melee__fire_machete"          "attack"       {5,11}
assignEvent "melee__fire_machete_alt"      "attack"       {9,16}

assignEvent "reload2__carabine_idle_in"    "startloop"    {9}
assignEvent "reload2__carabine_idle_loop"  "reload"       {10}
assignEvent "reload2__carabine_run_in"     "startloop"    {9}
assignEvent "reload2__carabine_run_loop"   "reload"       {10}
assignEvent "reload2__carabine_walk_in"    "startloop"    {9}
assignEvent "reload2__carabine_walk_loop"  "reload"       {10}
assignEvent "reload2__shotgun1_idle_in"    "startloop"    {9}
assignEvent "reload2__shotgun1_idle_loop"  "reload"       {10}
assignEvent "reload2__shotgun1_run_in"     "startloop"    {9}
assignEvent "reload2__shotgun1_run_loop"   "reload"       {10}
assignEvent "reload2__shotgun1_walk_in"    "startloop"    {9}
assignEvent "reload2__shotgun1_walk_loop"  "reload"       {10}
assignEvent "reload__pistol1_idle"         "reload"       {55}
assignEvent "reload__pistol1_walk"         "reload"       {55}
assignEvent "reload__pistol1_run"          "reload"       {55}
assignEvent "reload__pistol2_idle"         "reload"       {55}
assignEvent "reload__pistol2_walk"         "reload"       {55}
assignEvent "reload__pistol2_run"          "reload"       {55}
assignEvent "reload__flaregun_idle"        "reload"       {55}
assignEvent "reload__flaregun_run"         "reload"       {55}
assignEvent "reload__flaregun_walk"        "reload"       {55}
assignEvent "reload2__shotgun2_idle"       "reload"       {15}
assignEvent "reload2__shotgun2_walk"       "reload"       {15}
assignEvent "reload2__shotgun2_run"        "reload"       {15}

assignEvent "equip__machete_idle"            "equip"      {12}
assignEvent "equip__machete_run"             "equip"      {12}
assignEvent "equip__machete_walk"            "equip"      {12}
assignEvent "equip__pistol_idle"             "equip"      {7}
assignEvent "equip__pistol_run"              "equip"      {7}
assignEvent "equip__pistol_walk"             "equip"      {7}
assignEvent "equip__shotgun_idle"           "equip"      {10}
assignEvent "equip__shotgun_run"            "equip"      {10}
assignEvent "equip__shotgun_walk"           "equip"      {10}
assignEvent "device__detect_start"           "equip"      {20}
assignEvent "unequip__machete_idle"          "unequip"    {11}
assignEvent "unequip__machete_run"           "unequip"    {11}
assignEvent "unequip__machete_walk"          "unequip"    {11}
assignEvent "unequip__pistol_idle"           "unequip"    {15}
assignEvent "unequip__pistol_run"            "unequip"    {15}
assignEvent "unequip__pistol_walk"           "unequip"    {15}
assignEvent "unequip__shotgun_idle"         "unequip"    {22}
assignEvent "unequip__shotgun_run"          "unequip"    {22}
assignEvent "unequip__shotgun_walk"         "unequip"    {22}

--Movement
assignEvent "run_back"                      "step1"        {10} "step2" {22}
assignEvent "run_back_m67"                  "step1"        {10} "step2" {22}
assignEvent "run_back_machete"              "step1"        {10} "step2" {22}
assignEvent "run_back_pistol"               "step1"        {10} "step2" {22}
assignEvent "run_back_pistol_aim"           "step1"        {10} "step2" {22}
assignEvent "run_back_shotgun"              "step1"        {10} "step2" {22}
assignEvent "run_back_shotgun_aim"          "step1"        {10} "step2" {22}
assignEvent "run_front"                     "step1"        {8}  "step2" {16}
assignEvent "run_front_m67"                 "step1"        {8}  "step2" {16}
assignEvent "run_front_machete"             "step1"        {8}  "step2" {16}
assignEvent "run_front_pistol"              "step1"        {8}  "step2" {16}
assignEvent "run_front_pistol_aim"          "step1"        {8}  "step2" {16}
assignEvent "run_front_shotgun"             "step1"        {8}  "step2" {16}
assignEvent "run_front_shotgun_aim"         "step1"        {8}  "step2" {16}
assignEvent "run_left"                      "step1"        {10} "step2" {22}
assignEvent "run_left_m67"                  "step1"        {10} "step2" {22}
assignEvent "run_left_machete"              "step1"        {10} "step2" {22}
assignEvent "run_left_pistol"               "step1"        {10} "step2" {22}
assignEvent "run_left_pistol_aim"           "step1"        {10} "step2" {22}
assignEvent "run_left_shotgun"              "step1"        {10} "step2" {22}
assignEvent "run_left_shotgun_aim"          "step1"        {10} "step2" {22}
assignEvent "run_right"                     "step1"        {10} "step2" {22}
assignEvent "run_right_m67"                 "step1"        {10} "step2" {22}
assignEvent "run_right_machete"             "step1"        {10} "step2" {22}
assignEvent "run_right_pistol"              "step1"        {10} "step2" {22}
assignEvent "run_right_pistol_aim"          "step1"        {10} "step2" {22}
assignEvent "run_right_shotgun"             "step1"        {10} "step2" {22}
assignEvent "run_right_shotgun_aim"         "step1"        {10} "step2" {22}

assignEvent "walk_back"                      "step1"       {10} "step2" {25}
assignEvent "walk_back_m67"                  "step1"       {10} "step2" {25}
assignEvent "walk_back_machete"              "step1"       {10} "step2" {25}
assignEvent "walk_back_pistol"               "step1"       {10} "step2" {25}
assignEvent "walk_back_pistol_aim"           "step1"       {10} "step2" {25}
assignEvent "walk_back_shotgun"              "step1"       {10} "step2" {25}
assignEvent "walk_back_shotgun_aim"          "step1"       {10} "step2" {25}
assignEvent "walk_back_detect"               "step1"       {10} "step2" {25}
assignEvent "walk_front"                     "step1"       {10} "step2" {25}
assignEvent "walk_front_m67"                 "step1"       {10} "step2" {25}
assignEvent "walk_front_machete"             "step1"       {10} "step2" {25}
assignEvent "walk_front_pistol"              "step1"       {10} "step2" {25}
assignEvent "walk_front_pistol_aim"          "step1"       {10} "step2" {25}
assignEvent "walk_front_shotgun"             "step1"       {10} "step2" {25}
assignEvent "walk_front_shotgun_aim"         "step1"       {10} "step2" {25}
assignEvent "walk_front_detect"              "step1"       {10} "step2" {25}
assignEvent "walk_left"                      "step1"       {10} "step2" {25}
assignEvent "walk_left_m67"                  "step1"       {10} "step2" {25}
assignEvent "walk_left_machete"              "step1"       {10} "step2" {25}
assignEvent "walk_left_pistol"               "step1"       {10} "step2" {25}
assignEvent "walk_left_pistol_aim"           "step1"       {10} "step2" {25}
assignEvent "walk_left_shotgun"              "step1"       {10} "step2" {25}
assignEvent "walk_left_shotgun_aim"          "step1"       {10} "step2" {25}
assignEvent "walk_left_detect"               "step1"       {10} "step2" {25}
assignEvent "walk_right"                     "step1"       {10} "step2" {25}
assignEvent "walk_right_m67"                 "step1"       {10} "step2" {25}
assignEvent "walk_right_machete"             "step1"       {10} "step2" {25}
assignEvent "walk_right_pistol"              "step1"       {10} "step2" {25}
assignEvent "walk_right_pistol_aim"          "step1"       {10} "step2" {25}
assignEvent "walk_right_shotgun"             "step1"       {10} "step2" {25}
assignEvent "walk_right_shotgun_aim"         "step1"       {10} "step2" {25}
assignEvent "walk_right_detect"              "step1"       {10} "step2" {25}

assignEvent "sprint_front"                   "step1"       {8} "step2"  {16}
assignEvent "sprint_front_2h_weapon_aim"     "step1"       {8} "step2"  {16}
assignEvent "sprint_front_machete_aim"       "step1"       {8} "step2"  {16}
assignEvent "sprint_front_shotgun"           "step1"       {8} "step2"  {16}

assignEvent "swim_surface_front"             "swim_r"      {10} "swim_l" {43}
assignEvent "swim_surface_back"              "swim_r"      {10} "swim_l" {32}
assignEvent "swim_surface_left"              "swim_r"      {10} "swim_l" {32}
assignEvent "swim_surface_right"             "swim_r"      {10} "swim_l" {32}


-- assign sounds to events here
event "chip_cut_sound"   {getSoundTable "human_male.chip_cut"}
event "hurt"             {getSoundTable "human_male.hurt"}
event "mine_sound"       {getSoundTable "shared.mine_hit"}
event "mine_success"     {getSoundTable "shared.mine_success"}
event "drink_start"      {getSoundTable "shared.drink"}
event "eat_start"        {getSoundTable "shared.eat"}
event "injector_sound"   {getSoundTable "shared.injector_use"}
event "smoking_draw"     {getSoundTable "shared.smoke_draw"}
event "smoking_blow"     {getSoundTable "shared.smoke_blow"}
event "swim_r"           {getSoundTable "shared.swim_r"}
event "swim_l"           {getSoundTable "shared.swim_l"}
eventUnassigned "ammunition"   {getSoundTable "shared.ammunition"}
eventUnassigned "step_dirt"    {getSoundTable "shared.step_dirt"}
eventUnassigned "step_metal"   {getSoundTable "shared.step_metal"}
eventUnassigned "scan"         {getSoundTable "shared.scan"}
eventUnassigned "scan_broken"  {getSoundTable "shared.scan_broken"}
eventUnassigned "death"        {getSoundTable "human_male.death"}
eventUnassigned "dig_dirt"     {getSoundTable "shared.dig_dirt"}
eventUnassigned "dig_shit"     {getSoundTable "shared.dig_shit"}

-- set sound parameters here
soundTable "shared.dig_dirt"          {distance = 2000, channel = 0, priority= 1}
soundTable "shared.dig_shit"          {distance = 2000, channel = 0, priority= 1}
soundTable "shared.mine_hit"          {distance = 500, channel = 0, priority= 1}
soundTable "shared.mine_success"      {distance = 500, channel = 1, priority= 1}
soundTable "shared.drink"             {distance = 500, channel = 0, priority = 1}
soundTable "shared.eat"               {distance = 500, channel = 0, priority = 1}
soundTable "shared.injector_use"      {distance = 500, channel = 0, priority = 1}
soundTable "shared.scan"              {distance = 500, channel = 1, priority = 1}
soundTable "shared.scan_broken"       {distance = 500, channel = 1, priority = 1}
soundTable "shared.smoke_draw"        {distance = 500, channel = 0, priority = 1}
soundTable "shared.smoke_blow"        {distance = 500, channel = 0, priority = 1}
soundTable "human_male.death"         {distance = 800, channel = 0, priority = 10}
soundTable "human_male.chip_cut"      {distance = 800, channel = 0, priority= 1}
soundTable "human_male.hurt"          {distance = 800, channel = 4, priority= 1}
soundTable "shared.step_dirt"         {distance = 1000, channel = 5, priority= 1}
soundTable "shared.step_metal"        {distance = 1000, channel = 5, priority= 1}
soundTable "shared.ammunition"        {distance = 500, channel = 6, priority= 1}
soundTable "shared.swim_r"            {distance = 1000, channel = 7, priority = 1}
soundTable "shared.swim_l"            {distance = 1000, channel = 8, priority = 1}


local data = {}

data.animations      = animations
data.animationEvents = animationEvents
data.events          = events
data.sounds          = sounds

return data
