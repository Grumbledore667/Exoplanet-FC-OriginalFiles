local animations = {
   idle =
   {
      default   = { "idle", "idle_2", "idle_3" },
      melee_low = "1hm_idle",
      boxing    = "h2h_idle",
      pistol    = { "pistol_idle",  "pistol_idle_2",  "pistol_aim_idle" },
      shotgun   = { "shotgun_idle", "shotgun_idle_2", "shotgun_aim_idle" },
      carbine   = { "shotgun_idle", "shotgun_idle_2", "shotgun_aim_idle" },
      detect    = "detector_idle",
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
         melee_low = "1hm_idle_melee",
         melee_alt = "1hm_idle_melee_2",
         boxing    = {"h2h_idle_melee", "h2h_idle_melee_4"},
         boxing_alt= {"h2h_idle_melee_2", "h2h_idle_melee_3"},
         pistol    = "recoil__pistol_idle",
         shotgun   = "recoil__shotgun_idle",
         carbine   = "recoil__shotgun_idle",
      },
      cock =
      {
         shotgun = "cock__shotgun_aim_idle",
         carbine = "cock__carbine_aim_idle",
      },
      scan =
      {
         default = "gadget__use_idle",
         detect = "gadget__detector_idle_use",
      },
      lootbox =
      {
         to   = "idle_to_chest_idle",
         loop = "chest_idle",
         out  = "chest_idle_to_idle",
      },
      drink =
      {
         default   = "idle_drink",
      },
      eat =
      {
         default   = "idle_eat_medium",
         left_handed = "idle_to_food_idle",
      },
      smoke =
      {
         default   = "idle_smoke_draw",
      },
      injector =
      {
         default   = "injector__use_idle",
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
      to =
      {
         default              = "",
         crouch               = "idle_to_crouch_idle",
         sitbyfire            = "idle_to_sitbyfire_idle",
         sleep                = "idle_to_sleep_ground_idle",
         smoke                = "idle_smoke",
         takeobject           = "idle_takeobj_down",
         takeobjectfast       = "idle_takeobj_down_fast",
         takeobjectfast_table = "idle_takeobj_front",
         takeobjectfast_top   = "idle_takeobj_up",
      },
   },
   walk =
   {
      back =
      {
         default   = "walk_back",
         melee_low = { "1hm_walk_back", "1hm_aim_walk_back", },
         pistol    = { "pistol_walk_back", "pistol_aim_walk_back" },
         shotgun   = { "shotgun_walk_back", "shotgun_aim_walk_back" },
         carbine   = { "shotgun_walk_back", "shotgun_aim_walk_back" },
         detect    = "detector_walk_back",
         jump      =
         {
            default   = "walk_jump_back",
            melee_low = "walk_jump_back",
            pistol    = "pistol_walk_jump_back",
            shotgun   = "shotgun_walk_jump_back",
            carbine   = "shotgun_walk_jump_back",
         },
         attack =
         {
            default   = "",
            melee_low = "melee__1hm",
            melee_alt = "melee__1hm_2",
            boxing    = "melee__1hm",
            pistol    = "recoil__pistol_walk_back",
            shotgun   = "recoil__shotgun_walk_back",
            carbine   = "recoil__shotgun_walk_back",
         },
         cock =
         {
            shotgun = "cock__shotgun_aim_walk",
            carbine = "cock__carbine_aim_walk",
         },
         scan =
         {
            default = "gadget__use_idle",
            detect = "gadget__detector_walk_use_back",
         },
      },
      front =
      {
         default   = "walk_front",
         melee_low = { "1hm_walk_front", "1hm_aim_walk_front", },
         pistol    = { "pistol_walk_front", "pistol_aim_walk_front" },
         shotgun   = { "shotgun_walk_front", "shotgun_aim_walk_front" },
         carbine   = { "shotgun_walk_front", "shotgun_aim_walk_front" },
         detect    = "detector_walk_front",
         jump      =
         {
            default   = "walk_jump_front",
            melee_low = "walk_jump_front",
            pistol    = "pistol_walk_jump_front",
            shotgun   = "shotgun_walk_jump_front",
            carbine   = "shotgun_walk_jump_front",
         },
         attack =
         {
            default   = "",
            melee_low = "melee__1hm",
            melee_alt = "melee__1hm_2",
            boxing    = "melee__1hm",
            pistol    = "recoil__pistol_walk_front",
            shotgun   = "recoil__shotgun_walk_front",
            carbine   = "recoil__shotgun_walk_front",
         },
         cock =
         {
            shotgun = "cock__shotgun_aim_walk",
            carbine = "cock__carbine_aim_walk",
         },
         scan =
         {
            default = "gadget__use_idle",
            detect = "gadget__detector_walk_use_front",
         },
      },
      left =
      {
         default   = "walk_left",
         melee_low = { "1hm_walk_left", "1hm_aim_walk_left", },
         pistol    = { "pistol_walk_left", "pistol_aim_walk_left" },
         shotgun   = { "shotgun_walk_left", "shotgun_aim_walk_left" },
         carbine   = { "shotgun_walk_left", "shotgun_aim_walk_left" },
         detect    = "detector_walk_left",
         jump      =
         {
            default   = "walk_jump_left",
            melee_low = "walk_jump_left",
            pistol    = "pistol_walk_jump_left",
            shotgun   = "shotgun_walk_jump_left",
            carbine   = "shotgun_walk_jump_left",
         },
         attack =
         {
            default   = "",
            melee_low = "melee__1hm",
            melee_alt = "melee__1hm_2",
            boxing    = "melee__1hm",
            pistol    = "recoil__pistol_walk_left",
            shotgun   = "recoil__shotgun_walk_left",
            carbine   = "recoil__shotgun_walk_left",
         },
         cock =
         {
            shotgun = "cock__shotgun_aim_walk",
            carbine = "cock__carbine_aim_walk",
         },
         scan =
         {
            default = "gadget__use_idle",
            detect = "gadget__detector_walk_use_left",
         },
      },
      right =
      {
         default   = "walk_right",
         melee_low = { "1hm_walk_right", "1hm_aim_walk_right", },
         pistol    = { "pistol_walk_right", "pistol_aim_walk_right" },
         shotgun   = { "shotgun_walk_right", "shotgun_aim_walk_right" },
         carbine   = { "shotgun_walk_right", "shotgun_aim_walk_right" },
         detect    = "detector_walk_right",
         jump      =
         {
            default   = "walk_jump_right",
            melee_low = "walk_jump_right",
            pistol    = "pistol_walk_jump_right",
            shotgun   = "shotgun_walk_jump_right",
            carbine   = "shotgun_walk_jump_right",
         },
         attack =
         {
            default   = "",
            melee_low = "melee__1hm",
            melee_alt = "melee__1hm_2",
            boxing    = "melee__1hm",
            pistol    = "recoil__pistol_walk_right",
            shotgun   = "recoil__shotgun_walk_right",
            carbine   = "recoil__shotgun_walk_right",
         },
         cock =
         {
            shotgun = "cock__shotgun_aim_walk",
            carbine = "cock__carbine_aim_walk",
         },
         scan =
         {
            default = "gadget__use_idle",
            detect = "gadget__detector_walk_use_right",
         },
      },
   },
   run =
   {
      back =
      {
         default   = "run_back",
         melee_low = { "1hm_run_back", "1hm_aim_run_back", },
         pistol    = { "pistol_run_back", "pistol_aim_run_back" },
         shotgun   = { "shotgun_run_back", "shotgun_aim_run_back" },
         carbine   = { "shotgun_run_back", "shotgun_aim_run_back" },
         jump      =
         {
            default   = "run_jump_back",
            melee_low = "run_jump_back",
            pistol    = "pistol_run_jump_back",
            shotgun   = "shotgun_run_jump_back",
            carbine   = "shotgun_run_jump_back",
         },
         attack =
         {
            default   = "",
            melee_low = "melee__1hm",
            melee_alt = "melee__1hm_2",
            boxing    = "melee__1hm",
            pistol    = "recoil__pistol_run_back",
            shotgun   = "recoil__shotgun_run_back",
            carbine   = "recoil__shotgun_run_back",
         },
         cock =
         {
            shotgun = "cock__shotgun_aim_run",
            carbine = "cock__carbine_aim_run",
         },
         scan =
         {
            default = "gadget__use_idle",
         },
      },
      front =
      {
         default   = "run_front",
         melee_low = { "1hm_run_front", "1hm_aim_run_front", },
         pistol    = { "pistol_run_front", "pistol_aim_run_front" },
         shotgun   = { "shotgun_run_front", "shotgun_aim_run_front" },
         carbine   = { "shotgun_run_front", "shotgun_aim_run_front" },
         jump      =
         {
            default   = "run_jump_front",
            melee_low = "run_jump_front",
            pistol    = "pistol_run_jump_front",
            shotgun   = "shotgun_run_jump_front",
            carbine   = "shotgun_run_jump_front",
         },
         attack =
         {
            default   = "",
            melee_low = "melee__1hm",
            melee_alt = "melee__1hm_2",
            boxing    = "melee__1hm",
            pistol    = "recoil__pistol_run_front",
            shotgun   = "recoil__shotgun_run_front",
            carbine   = "recoil__shotgun_run_front",
         },
         cock =
         {
            shotgun = "cock__shotgun_aim_run",
            carbine = "cock__carbine_aim_run",
         },
         scan =
         {
            default = "gadget__use_idle",
         },
      },
      left =
      {
         default   = "run_left",
         melee_low = { "1hm_run_left", "1hm_aim_run_left", },
         pistol    = { "pistol_run_left", "pistol_aim_run_left" },
         shotgun   = { "shotgun_run_left", "shotgun_aim_run_left" },
         carbine   = { "shotgun_run_left", "shotgun_aim_run_left" },
         jump      =
         {
            default   = "run_jump_left",
            melee_low = "run_jump_left",
            pistol    = "pistol_run_jump_left",
            shotgun   = "shotgun_run_jump_left",
            carbine   = "shotgun_run_jump_left",
         },
         attack =
         {
            default   = "",
            melee_low = "melee__1hm",
            melee_alt = "melee__1hm_2",
            boxing    = "melee__1hm",
            pistol    = "recoil__pistol_run_left",
            shotgun   = "recoil__shotgun_run_left",
            carbine   = "recoil__shotgun_run_left",
         },
         cock =
         {
            shotgun = "cock__shotgun_aim_run",
            carbine = "cock__carbine_aim_run",
         },
         scan =
         {
            default = "gadget__use_idle",
         },
      },
      right =
      {
         default   = "run_right",
         melee_low = { "1hm_run_right", "1hm_aim_run_right", },
         pistol    = { "pistol_run_right", "pistol_aim_run_right" },
         shotgun   = { "shotgun_run_right", "shotgun_aim_run_right" },
         carbine   = { "shotgun_run_right", "shotgun_aim_run_right" },
         jump      =
         {
            default   = "run_jump_right",
            melee_low = "run_jump_right",
            pistol    = "pistol_run_jump_right",
            shotgun   = "shotgun_run_jump_right",
            carbine   = "shotgun_run_jump_right",
         },
         attack =
         {
            default   = "",
            melee_low = "melee__1hm",
            melee_alt = "melee__1hm_2",
            boxing    = "melee__1hm",
            pistol    = "recoil__pistol_run_right",
            shotgun   = "recoil__shotgun_run_right",
            carbine   = "recoil__shotgun_run_right",
         },
         cock =
         {
            shotgun = "cock__shotgun_aim_run",
            carbine = "cock__carbine_aim_run",
         },
         scan =
         {
            default = "gadget__use_idle",
         },
      },
   },
   step =
   {
      back =
      {
         default   = "",
         melee_low = "1hm_idle_step_back",
         boxing    = "1hm_idle_step_back",
         pistol    = "pistol_aim_idle_step_back",
         shotgun   = "shotgun_aim_idle_step_back",
         carbine   = "shotgun_aim_idle_step_back",
      },
      right =
      {
         default   = "",
         melee_low = "1hm_idle_step_right",
         boxing    = "1hm_idle_step_right",
         pistol    = "pistol_aim_idle_step_right",
         shotgun   = "shotgun_aim_idle_step_right",
         carbine   = "shotgun_aim_idle_step_right",
      },
      left =
      {
         default   = "",
         melee_low = "1hm_idle_step_left",
         boxing    = "1hm_idle_step_left",
         pistol    = "pistol_aim_idle_step_left",
         shotgun   = "shotgun_aim_idle_step_left",
         carbine   = "shotgun_aim_idle_step_left",
      },
   },
   sprint = {
      front =
      {
         default = "sprint_front",
         shotgun = "shotgun_sprint_front",
         carbine = "shotgun_sprint_front",
         jump    =
         {
            default   = "run_jump_front",
            melee_low = "run_jump_front",
            pistol    = "pistol_run_jump_front",
            shotgun   = "shotgun_run_jump_front",
            carbine   = "shotgun_run_jump_front",
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
   swim = {
      idle  = "swim_surface_idle",
      back  = "swim_surface_back",
      front = "swim_surface_front",
      left  = "swim_surface_left",
      right = "swim_surface_right",
   },
   land = {
      default = {
         default = "idle_land",
         pistol = "pistol_idle_land",
         shotgun = "shotgun_idle_land",
         carbine = "shotgun_idle_land",
      },
      hard ={
         default = "idle_land_hard",
         pistol = "pistol_idle_land_hard",
         shotgun = "shotgun_idle_land_hard",
         carbine = "shotgun_idle_land_hard",
      },
   },
   slide = {
      default = "slide_vertical_idle",
      melee_low = "1hm_slide_vertical_idle",
      pistol = "pistol_slide_vertical_idle",
      shotgun = "shotgun_slide_vertical_idle",
      carbine = "shotgun_slide_vertical_idle",
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
         to = "idle_to_ladder_bottom",
         loop  = "ladder_up",
         out  = "ladder_idle_to_idle_top",
      },
      down = {
         to = "idle_to_ladder_top",
         loop  = "ladder_down",
         out  = "ladder_idle_to_idle_bottom",
      },
   },
   sleepAtBed =
   {
      to   = "idle_to_sleep_bed_idle",
      loop = "sleep_bed_idle",
      out  = "sleep_bed_idle_to_idle",
   },
   knockout =
   {
      idle   = "death_pose3",
   },
   fall      =
   {
      default   = "fall_idle",
      pistol    = "pistol_fall_idle",
      shotgun   = "shotgun_fall_idle",
      carbine   = "shotgun_fall_idle",
   },
   sitbyfire =
   {
      default = "sitbyfire_idle",
      cook = "sitbyfire_roast_meat",
      drink = "sitbyfire_drink",
      eat = "sitbyfire_eat",
      sleep = "sitbyfire_sleep",
      to =
      {
         idle = "sitbyfire_idle_to_idle",
      },
   },
   crouch =
   {
      default = "crouch_idle",
      cook = "crouch_roast_meat",
      takeobject = "crouch_takeobj_down_fast",
      device = "crouch_idle_gadget_lookright",
      to =
      {
         idle = "crouch_idle_to_idle",
      },
   },
   equip =
   {
      idle =
      {
         melee_low = "equip__1hm_idle",
         pistol = "equip__pistol_idle",
         shotgun = "equip__shotgun_idle",
         carbine = "equip__shotgun_idle",
         detect = "gadget__detector_start",
      },
      walk =
      {
         melee_low = "equip__1hm_walk",
         pistol = "equip__pistol_walk",
         shotgun = "equip__shotgun_walk",
         carbine = "equip__shotgun_walk",
         detect = "gadget__detector_start",
      },
      run =
      {
         melee_low = "equip__1hm_run",
         pistol = "equip__pistol_run",
         shotgun = "equip__shotgun_run",
         carbine = "equip__shotgun_run",
         detect = "gadget__detector_start",
      },
      sprint =
      {
         melee_low = "equip__1hm_run",
         pistol = "equip__pistol_run",
         shotgun = "equip__shotgun_run",
         carbine = "equip__shotgun_run",
         detect = "gadget__detector_start",
      },
   },
   unequip =
   {
      idle =
      {
         melee_low = "unequip__1hm_idle",
         pistol = "unequip__pistol_idle",
         shotgun = "unequip__shotgun_idle",
         carbine = "unequip__shotgun_idle",
      },
      walk =
      {
         melee_low = "unequip__1hm_walk",
         pistol = "unequip__pistol_walk",
         shotgun = "unequip__shotgun_walk",
         carbine = "unequip__shotgun_walk",
      },
      run =
      {
         melee_low = "unequip__1hm_run",
         pistol = "unequip__pistol_run",
         shotgun = "unequip__shotgun_run",
         carbine = "unequip__shotgun_run",
      },
      sprint =
      {
         melee_low = "unequip__1hm_run",
         pistol = "unequip__pistol_run",
         shotgun = "unequip__shotgun_run",
         carbine = "unequip__shotgun_run",
      },
   },
   reload =
   {
      idle =
      {
         pistol1 = "reload__revolver_aim_idle",
         pistol2 = "reload__pistol_aim_idle",
         flare = "reload__flaregun_aim_idle",
         shotgun1 = { "reload__shotgun_aim_idle_in", "reload__shotgun_idle_loop", "reload__shotgun_aim_idle_out" },
         shotgun2 = "reload__shotgun2_aim_idle",
         carbine = { "reload__carbine_aim_idle_in", "reload__carbine_idle_loop", "reload__carbine_aim_idle_out" },
      },
      walk =
      {
         pistol1 = "reload__revolver_aim_walk",
         pistol2 = "reload__pistol_aim_walk",
         flare = "reload__flaregun_aim_walk",
         shotgun1 = { "reload__shotgun_aim_walk_in", "reload__shotgun_walk_loop", "reload__shotgun_aim_walk_out" },
         shotgun2 = "reload__shotgun2_aim_walk",
         carbine = { "reload__carbine_aim_walk_in", "reload__carbine_walk_loop", "reload__carbine_aim_walk_out" },
      },
      run =
      {
         pistol1 = "reload__revolver_aim_run",
         pistol2 = "reload__pistol_aim_run",
         flare = "reload__flaregun_aim_run",
         shotgun1 = { "reload__shotgun_aim_run_in", "reload__shotgun_run_loop", "reload__shotgun_aim_run_out" },
         shotgun2 = "reload__shotgun2_aim_run",
         carbine = { "reload__carbine_aim_run_in", "reload__carbine_run_loop", "reload__carbine_aim_run_out" },
      },
   },
   mine =
   {
      down = "mine_down",
      front = "mine_front",
   },
   dig =
   {
      default = "dig_delve_right",
   },
   control =
   {
      default = "crouch_idle_gadget_lookright",
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
      --    front = "hit__1hm_front",
      --    back = "hit__1hm_back",
      --    left = "hit__1hm_left",
      --    right = "hit__1hm_right",
      -- },
      boxing = {
         front = "hit__h2h_front",
         back = "hit__h2h_back",
         left = "hit__h2h_left",
         right = "hit__h2h_right",
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

-- assign events to animations here
assignEvent "idle_gadget_use_long"                     "button" {120}
assignEvent "gadget__use_idle"             "button" {3}
assignEvent "gadget__detector_idle_use"         "button" {15}
assignEvent "gadget__detector_walk_use_front"   "button" {15}
assignEvent "gadget__detector_walk_use_back"    "button" {15}
assignEvent "gadget__detector_walk_use_left"    "button" {15}
assignEvent "gadget__detector_walk_use_right"   "button" {15}
assignEvent "idle_drink"                     "drink_sound"     {0}  "spawn_item"   {0}  "buff_apply"   {65}
assignEvent "idle_eat_medium"                       "eat_sound"       {0}  "spawn_item"   {0}  "buff_apply"   {15} "item_change" {44}
assignEvent "sitbyfire_drink"                 "spawn_item"      {0}  "buff_apply"   {10}
assignEvent "sitbyfire_eat"                   "spawn_item"      {10} "buff_apply"   {15} "item_change"  {74}
assignEvent "idle_smoke"                 "spawn_item"      {0}  "smoking_draw" {80} "smoking_blow" {115} "buff_apply" {115} "item_change" {125}
assignEvent "injector__use_idle"              "spawn_item"      {0}  "injector_sound" {16} "buff_apply" {20} "item_change" {20}
assignEvent "idle_cut_chip"               "chip_cut_sound"  {0}
assignEvent "idle_to_ladder_bottom"             "end" {11}
assignEvent "idle_to_ladder_top"                "end" {23}

--Interactions
assignEvent "idle_takeobj_down_fast"     "activate"    {10} "preemptive_end" {25}
assignEvent "idle_takeobj_front"         "activate"    {15} "preemptive_end" {25}
assignEvent "idle_takeobj_up"            "activate"    {10} "preemptive_end" {25}
assignEvent "idle_to_chest_idle"         "activate"    {25}
assignEvent "dig_delve_right"           "dust"         {25} "dig_sound" {20} "dig" {70}
assignEvent "mine_down"                 "mine_sound"   {42} "mine_success" {42} "hit" {42}
assignEvent "mine_front"                "mine_sound"   {30} "mine_success" {30} "hit" {30}

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
assignEvent "hit__h2h_front"            "hurt"         {0}
assignEvent "hit__h2h_left"             "hurt"         {0}
assignEvent "hit__h2h_right"            "hurt"         {0}
assignEvent "hit__h2h_back"             "hurt"         {0}

assignEvent "h2h_idle_melee"          "attack"       {4,7}
assignEvent "h2h_idle_melee_2"          "attack"       {11,15}
assignEvent "h2h_idle_melee_3"          "attack"       {12,18}
assignEvent "h2h_idle_melee_4"          "attack"       {9,13}
assignEvent "1hm_idle_melee"           "attack"       {8,12}
assignEvent "1hm_idle_melee_2"       "attack"       {5,10}
assignEvent "melee__1hm"          "attack"       {5,11}
assignEvent "melee__1hm_2"      "attack"       {9,16}

assignEvent "reload__carbine_aim_idle_in"    "startloop"    {9}
assignEvent "reload__carbine_idle_loop"  "reload"       {10}
assignEvent "reload__carbine_aim_run_in"     "startloop"    {9}
assignEvent "reload__carbine_run_loop"   "reload"       {10}
assignEvent "reload__carbine_aim_walk_in"    "startloop"    {9}
assignEvent "reload__carbine_walk_loop"  "reload"       {10}
assignEvent "reload__shotgun_aim_idle_in"    "startloop"    {9}
assignEvent "reload__shotgun_idle_loop"  "reload"       {10}
assignEvent "reload__shotgun_aim_run_in"     "startloop"    {9}
assignEvent "reload__shotgun_run_loop"   "reload"       {10}
assignEvent "reload__shotgun_aim_walk_in"    "startloop"    {9}
assignEvent "reload__shotgun_walk_loop"  "reload"       {10}
assignEvent "reload__revolver_aim_idle"         "reload"       {55}
assignEvent "reload__revolver_aim_walk"         "reload"       {55}
assignEvent "reload__revolver_aim_run"          "reload"       {55}
assignEvent "reload__pistol_aim_idle"         "reload"       {55}
assignEvent "reload__pistol_aim_walk"         "reload"       {55}
assignEvent "reload__pistol_aim_run"          "reload"       {55}
assignEvent "reload__flaregun_aim_idle"        "reload"       {55}
assignEvent "reload__flaregun_aim_run"         "reload"       {55}
assignEvent "reload__flaregun_aim_walk"        "reload"       {55}
assignEvent "reload__shotgun2_aim_idle"       "reload"       {15}
assignEvent "reload__shotgun2_aim_walk"       "reload"       {15}
assignEvent "reload__shotgun2_aim_run"        "reload"       {15}

assignEvent "equip__1hm_idle"            "equip"      {12}
assignEvent "equip__1hm_run"             "equip"      {12}
assignEvent "equip__1hm_walk"            "equip"      {12}
assignEvent "equip__pistol_idle"             "equip"      {7}
assignEvent "equip__pistol_run"              "equip"      {7}
assignEvent "equip__pistol_walk"             "equip"      {7}
assignEvent "equip__shotgun_idle"           "equip"      {10}
assignEvent "equip__shotgun_run"            "equip"      {10}
assignEvent "equip__shotgun_walk"           "equip"      {10}
assignEvent "gadget__detector_start"           "equip"      {20}
assignEvent "unequip__1hm_idle"          "unequip"    {11}
assignEvent "unequip__1hm_run"           "unequip"    {11}
assignEvent "unequip__1hm_walk"          "unequip"    {11}
assignEvent "unequip__pistol_idle"           "unequip"    {15}
assignEvent "unequip__pistol_run"            "unequip"    {15}
assignEvent "unequip__pistol_walk"           "unequip"    {15}
assignEvent "unequip__shotgun_idle"         "unequip"    {22}
assignEvent "unequip__shotgun_run"          "unequip"    {22}
assignEvent "unequip__shotgun_walk"         "unequip"    {22}

--Movement
assignEvent "run_back"                      "step1"        {10} "step2" {22}
assignEvent "1hm_run_back"              "step1"        {10} "step2" {22}
assignEvent "pistol_run_back"               "step1"        {10} "step2" {22}
assignEvent "pistol_aim_run_back"           "step1"        {10} "step2" {22}
assignEvent "shotgun_run_back"              "step1"        {10} "step2" {22}
assignEvent "shotgun_aim_run_back"          "step1"        {10} "step2" {22}
assignEvent "run_front"                     "step1"        {8}  "step2" {16}
assignEvent "1hm_run_front"             "step1"        {8}  "step2" {16}
assignEvent "pistol_run_front"              "step1"        {8}  "step2" {16}
assignEvent "pistol_aim_run_front"          "step1"        {8}  "step2" {16}
assignEvent "shotgun_run_front"             "step1"        {8}  "step2" {16}
assignEvent "shotgun_aim_run_front"         "step1"        {8}  "step2" {16}
assignEvent "run_left"                      "step1"        {10} "step2" {22}
assignEvent "1hm_run_left"              "step1"        {10} "step2" {22}
assignEvent "pistol_run_left"               "step1"        {10} "step2" {22}
assignEvent "pistol_aim_run_left"           "step1"        {10} "step2" {22}
assignEvent "shotgun_run_left"              "step1"        {10} "step2" {22}
assignEvent "shotgun_aim_run_left"          "step1"        {10} "step2" {22}
assignEvent "run_right"                     "step1"        {10} "step2" {22}
assignEvent "1hm_run_right"             "step1"        {10} "step2" {22}
assignEvent "pistol_run_right"              "step1"        {10} "step2" {22}
assignEvent "pistol_aim_run_right"          "step1"        {10} "step2" {22}
assignEvent "shotgun_run_right"             "step1"        {10} "step2" {22}
assignEvent "shotgun_aim_run_right"         "step1"        {10} "step2" {22}

assignEvent "walk_back"                      "step1"       {10} "step2" {25}
assignEvent "1hm_walk_back"              "step1"       {10} "step2" {25}
assignEvent "pistol_walk_back"               "step1"       {10} "step2" {25}
assignEvent "pistol_aim_walk_back"           "step1"       {10} "step2" {25}
assignEvent "shotgun_walk_back"              "step1"       {10} "step2" {25}
assignEvent "shotgun_aim_walk_back"          "step1"       {10} "step2" {25}
assignEvent "detector_walk_back"               "step1"       {10} "step2" {25}
assignEvent "walk_front"                     "step1"       {10} "step2" {25}
assignEvent "1hm_walk_front"             "step1"       {10} "step2" {25}
assignEvent "pistol_walk_front"              "step1"       {10} "step2" {25}
assignEvent "pistol_aim_walk_front"          "step1"       {10} "step2" {25}
assignEvent "shotgun_walk_front"             "step1"       {10} "step2" {25}
assignEvent "shotgun_aim_walk_front"         "step1"       {10} "step2" {25}
assignEvent "detector_walk_front"              "step1"       {10} "step2" {25}
assignEvent "walk_left"                      "step1"       {10} "step2" {25}
assignEvent "1hm_walk_left"              "step1"       {10} "step2" {25}
assignEvent "pistol_walk_left"               "step1"       {10} "step2" {25}
assignEvent "pistol_aim_walk_left"           "step1"       {10} "step2" {25}
assignEvent "shotgun_walk_left"              "step1"       {10} "step2" {25}
assignEvent "shotgun_aim_walk_left"          "step1"       {10} "step2" {25}
assignEvent "detector_walk_left"               "step1"       {10} "step2" {25}
assignEvent "walk_right"                     "step1"       {10} "step2" {25}
assignEvent "1hm_walk_right"             "step1"       {10} "step2" {25}
assignEvent "pistol_walk_right"              "step1"       {10} "step2" {25}
assignEvent "pistol_aim_walk_right"          "step1"       {10} "step2" {25}
assignEvent "shotgun_walk_right"             "step1"       {10} "step2" {25}
assignEvent "shotgun_aim_walk_right"         "step1"       {10} "step2" {25}
assignEvent "detector_walk_right"              "step1"       {10} "step2" {25}

assignEvent "sprint_front"                   "step1"       {8} "step2"  {16}
assignEvent "2hm_aim_sprint_front"     "step1"       {8} "step2"  {16}
assignEvent "1hm_aim_sprint_front"       "step1"       {8} "step2"  {16}
assignEvent "shotgun_sprint_front"           "step1"       {8} "step2"  {16}

assignEvent "swim_surface_front"             "swim"      {10} "swim" {43}
assignEvent "swim_surface_back"              "swim"      {10} "swim" {32}
assignEvent "swim_surface_left"              "swim"      {10} "swim" {32}
assignEvent "swim_surface_right"             "swim"      {10} "swim" {32}


-- assign sounds to events here
event "chip_cut_sound"   {"Play_scarecrow_cutting_chip"}
event "hurt"             {"Play_human_male_hurt"}
event "mine_sound"       {"Play_pickaxe_mining"}
event "mine_success"     {"Play_pickaxe_mining_success"}
event "drink_sound"      {"Play_human_male_drink"}
event "eat_sound"        {"Play_human_male_eat"}
event "injector_sound"   {"Play_injector_use"}
event "smoking_draw"     {"Play_human_male_smoking_draw"}
event "smoking_blow"     {"Play_human_male_smoking_blow"}
event "swim"             {"Play_human_male_swim"}
eventUnassigned "ammunition"   {"Play_ammunition"}
eventUnassigned "step_dirt"    {"Play_step_dirt"}
eventUnassigned "step_metal"   {"Play_step_metal"}
eventUnassigned "scan"         {"Play_scan_wave"}
eventUnassigned "scan_broken"  {"Play_scan_broken"}
eventUnassigned "death"        {"Play_human_male_death"}
eventUnassigned "dig_dirt"     {"Play_shovel_digging_dirt"}
eventUnassigned "dig_shit"     {"Play_shovel_digging_shit"}

-- set sound parameters here
sound "Play_shovel_digging_dirt"     {distance = 2000, channel = 0, priority= 1}
sound "Play_shovel_digging_shit"     {distance = 2000, channel = 0, priority= 1}
sound "Play_pickaxe_mining"          {distance = 500, channel = 0, priority= 1}
sound "Play_pickaxe_mining_success"  {distance = 500, channel = 1, priority= 1}
sound "Play_human_male_drink"        {distance = 500, channel = 0, priority = 1}
sound "Play_human_male_eat"          {distance = 500, channel = 0, priority = 1}
sound "Play_injector_use"            {distance = 500, channel = 0, priority = 1}
sound "Play_scan_wave"               {distance = 500, channel = 1, priority = 1}
sound "Play_scan_broken"             {distance = 500, channel = 1, priority = 1}
sound "Play_human_male_smoking_draw" {distance = 500, channel = 0, priority = 1}
sound "Play_human_male_smoking_blow" {distance = 500, channel = 0, priority = 1}
sound "Play_human_male_death"        {distance = 800, channel = 0, priority = 10}
sound "Play_scarecrow_cutting_chip"  {distance = 800, channel = 0, priority= 1}
sound "Play_human_male_hurt"         {distance = 800, channel = 4, priority= 1}
sound "Play_step_dirt"               {distance = 1000, channel = 5, priority= 1}
sound "Play_step_metal"              {distance = 1000, channel = 5, priority= 1}
sound "Play_ammunition"              {distance = 500, channel = 6, priority= 1}
sound "Play_human_male_swim"         {distance = 1000, channel = 7, priority = 1}


local data = {}

data.animations      = animations
data.animationEvents = animationEvents
data.events          = events
data.sounds          = sounds

return data
