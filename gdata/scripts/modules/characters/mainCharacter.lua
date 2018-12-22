local oo = require "loop.simple"
local CAction = (require "action").CAction
local CNode = (require "node").CNode
local ItemsData = (require "itemsData")
local ItemsInfo = (require "itemsData").ItemsInfo
local ItemsDecompose = (require "itemsData").ItemsDecompose
local CPlayer = (require "player").CPlayer
local CCharacter = (require "character").CCharacter
local SkySystem = (require "environment.sky").SkySystem
local WeatherSystem = (require "environment.weather").WeatherSystem
local InstallationData = (require "items.installation").ItemRecipes
local miscLabels = require("miscLabels")

local hlp = require "helpers"

local List = require "pl.List"

local CMainCharacter = oo.class({}, CPlayer)

function CMainCharacter:init()
   CMainCharacter.loadParameters( self )

   self.god_mode = false
   self.super_speed = false

   self.installations = {}

   self.itemsManager:setMainInventoryUI( true )

   self.stats = {
      armor  = {base = 0, current = 0, min = 0},

      health      = {            current = 100, min = 0},
      healthMax   = {base = 100, current = 100, min = 1},
      healthRegen = {base = 0,   current = 0},

      stamina      = {            current = 100, min = 0},
      staminaMax   = {base = 100, current = 100, min = 0},
      staminaRegen = {base = 0,   current = 0},

      energy      = {            current = 100, min = 0},
      energyMax   = {base = 100, current = 100, min = 0},
      energyRegen = {base = 5,   current = 5},

      food      = {              current = 3200, min = 0},
      foodMax   = {base = 3200,  current = 3200, min = 0},
      foodRegen = {base = -0.25, current = -0.25},

      water      = {              current = 3000, min = 0},
      waterMax   = {base = 3000,  current = 3000, min = 0},
      waterRegen = {base = -0.25, current = 0},

      sleep      = {              current = 100, min = 0},
      sleepMax   = {base = 100,   current = 100, min = 0},
      sleepRegen = {base = -0.01, current = -0.01},

      --MISC
      staminaRunCost         = {base = -1.25, current = -1.25, max = 0},
      staminaStepMoveCost    = {base = -20,   current = -20,   max = 0},
      staminaJumpCost        = {base = -5,    current = -5,    max = 0},
      staminaMeleeAttackCost = {base = -5,    current = -5,    max = 0},
      staminaRangeAttackCost = {base = -1,    current = -1,    max = 0},
      staminaRest            = {              current = 10,    min = 0},

      energyScanCost = {base = -50,   current = -50, max = 0},

      sleepRest = {current = 10, min = 0},
   }
   self:setStatCount( "health", self.stats.healthMax.current )

   self.statusEffectsManager:addStatusEffect( { name = "basicRegens" } )
   self.statusEffectsManager:addStatusEffect( { name = "basicArmor" } )
   self.statusEffectsManager:addStatusEffect( { name = "basicStatUpgrade" } )

   self.level = 1
   self.attributePoints = 0
   self.experience = { current = 0, max = 1000, maxStarting = 1000, }

   self.levelUpBonuses =     { healthMax = 0, staminaMax = 0, energyMax = 0 }
   self.upgradeBonuses =     { healthMax = 10, staminaMax = 10, energyMax = 10 }
   self.assignedAttributes = { healthMax = 0, staminaMax = 0, energyMax = 0 }

   gameplayUI:updateStatisticsAttributePoints()

   CPlayer.subscribeOnDeath(self, self.onDeath, self)

   --Timer that checks the current player pos to manually update shadows
   self.updateShadowsTimer = runTimer(0.2, nil, function()
      local pos = getPlayer():getPose():getPos()
      if not self.previousPosition or getDistance( pos, self.previousPosition ) > 5000 then
         updateGlobalShadows()
      end
      self.previousPosition = pos
   end, true)
end

function CMainCharacter:initEffects()
   self.fx = {}

   self.fx.fry = self:createAspect( "fry_smoke.sps" )
   self.fx.fry:disable()

   self.fx.antigrav_hit = self:createAspect( "antigrav_hit.sps" )
   self.fx.antigrav_hit:setLoop( false )
   self.fx.antigrav_hit:getPose():setScale( {x=1,y=1,z=1} )
   self.fx.antigrav_hit:getPose():setParent( self:getPose() )
   self.fx.antigrav_hit:getPose():resetLocalPos()
   self.fx.antigrav_hit:disable()

   self.fx.smoking_smoke = self:createAspect( "koster_smoke.sps" )
   self.fx.smoking_smoke:setLoop( true )
   self.fx.smoking_smoke:getPose():setParent( self:getBonePose("head_slot") )
   self.fx.smoking_smoke:getPose():resetLocalPose()
   self.fx.smoking_smoke:getPose():setLocalPos( {z=-13, y=-13} )
   self.fx.smoking_smoke:getPose():setLocalRotQuat(quatFromEuler({x=-90}) )
   self.fx.smoking_smoke:getPose():setLocalScale( {x=0.25, y=0.25, z=0.25} )
   self.fx.smoking_smoke:disable()

   self.fx.digging_dust = self:createAspect( "sand_flow.sps" )
   self.fx.digging_dust:setLoop( true )
   self.fx.digging_dust:getPose():setScale( {x=0.5,y=0.5,z=0.5} )
   self.fx.digging_dust:getPose():setParent( self:getPose() )
   self.fx.digging_dust:getPose():resetLocalPos()
   self.fx.digging_dust:getPose():setLocalPos( {x=0,y=0,z=-50} )
   self.fx.digging_dust:disable()
end

function CMainCharacter:initSounds()
   self.sounds = {}

   self.sounds.cough = self:createAspect( "main_hero_cough_1.wav" )
   self.sounds.cough:getPose():setParent( self:getPose() )
   self.sounds.cough:getPose():resetLocalPos()
   self.sounds.cough:setLoop( true )
   self.sounds.cough:setDelay( 2 )
   self.sounds.cough:setDistance( 1000 )

   self.sounds.fry = self:createAspect( "fry.wav" )
   self.sounds.fry:getPose():setParent( self:getPose() )
   self.sounds.fry:getPose():resetLocalPos()
   self.sounds.fry:setLoop    ( false )
   self.sounds.fry:setDistance( 1000 )

   self.sounds.death = self:createAspect( "game_over.wav" )
   self.sounds.death:getPose():setParent( self:getPose() )
   self.sounds.death:getPose():resetLocalPos()
   self.sounds.death:setLoop    ( false )
   self.sounds.death:setDistance( 2000 )

   self.sounds.jump = self:createAspect( "jump_1.wav" )
   self.sounds.jump:getPose():setParent( self:getPose() )
   self.sounds.jump:getPose():resetLocalPos()
   self.sounds.jump:setLoop    ( false )
   self.sounds.jump:setDistance( 500 )

   self.sounds.jump_land_1 = self:createAspect( "jump_3.wav" )
   self.sounds.jump_land_1:getPose():setParent( self:getPose() )
   self.sounds.jump_land_1:getPose():resetLocalPos()
   self.sounds.jump_land_1:setLoop    ( false )
   self.sounds.jump_land_1:setDistance( 500 )

   self.sounds.jump_land_2 = self:createAspect( "jump_4.wav" )
   self.sounds.jump_land_2:getPose():setParent( self:getPose() )
   self.sounds.jump_land_2:getPose():resetLocalPos()
   self.sounds.jump_land_2:setLoop    ( false )
   self.sounds.jump_land_2:setDistance( 500 )
end

function CMainCharacter:loadParameters()
   self.animations =
   {
      idle =
      {
         default   = { "idle.caf", "idle_2.caf", "idle_3.caf" },
         melee_low = "idle_machete.caf",
         boxing    = "idle_boxing.caf",
         pistol    = { "idle_pistol.caf",  "idle_pistol_2.caf",  "idle_pistol_aim.caf" },
         shotgun   = { "idle_shotgun.caf", "idle_shotgun_2.caf", "idle_shotgun_aim.caf" },
         carbine   = { "idle_shotgun.caf", "idle_shotgun_2.caf", "idle_shotgun_aim.caf" },
         jump      =
         {
            default   = "idle_jump.caf",
            melee_low = "idle_jump.caf",
            boxing    = "idle_jump.caf",
            pistol    = "idle_jump.caf",
            shotgun   = "idle_jump.caf",
            carbine   = "idle_jump.caf",
         },
         attack =
         {
            default   = "",
            melee_low = "melee_idle_machete.caf",
            melee_alt = "melee_idle_machete_alt.caf",
            boxing    = {"melee_idle_boxing_1.caf", "melee_idle_boxing_4.caf"},
            boxing_alt= {"melee_idle_boxing_2.caf", "melee_idle_boxing_3.caf"},
            pistol    = "recoil__idle_pistol.caf",
            shotgun   = "recoil2__idle_shotgun.caf reload2__shotgun_idle.caf",
            carbine   = "recoil2__idle_shotgun.caf reload2__carbine_idle.caf",
         },
         drink =
         {
            default   = "drink_short.caf",
         },
         eat =
         {
            default   = "eat_short.caf",
         },
         smoke =
         {
            default   = "idle_smoking.caf",
         },
         to =
         {
            default              = "",
            crouch               = "idle_to_crouch.caf",
            sitbyfire            = "idle_to_sitbyfire.caf",
            sleep                = "idle_to_sleep.caf",
            smoke                = "idle_to_smoking.caf",
            takeobject           = "idle_to_take_object.caf",
            takeobjectfast       = "idle_to_take_object_fast.caf",
            takeobjectfast_table = "idle_to_take_object_front.caf",
            takeobjectfast_top   = "idle_to_take_object_top.caf",
         },
      },
      walk =
      {
         back =
         {
            default   = "walk_back.caf",
            melee_low = { "walk_back_machete.caf", "walk_back_machete_aim.caf", },
            pistol    = { "walk_back_pistol.caf", "walk_back_pistol_aim.caf" },
            shotgun   = { "walk_back_shotgun.caf", "walk_back_shotgun_aim.caf" },
            carbine   = { "walk_back_shotgun.caf", "walk_back_shotgun_aim.caf" },
            jump      =
            {
               default   = "jump_walk_back.caf",
               melee_low = "jump_walk_back.caf",
               pistol    = "jump_walk_back_pistol.caf",
               shotgun   = "jump_walk_back_shotgun.caf",
               carbine   = "jump_walk_back_shotgun.caf",
            },
            attack =
            {
               default   = "",
               melee_low = "melee__fire_machete.caf",
               melee_alt = "melee__fire_machete_alt.caf",
               boxing    = "melee__fire_machete.caf",
               pistol    = "recoil__walk_back_pistol.caf",
               shotgun   = "recoil2__walk_back_shotgun.caf reload2__shotgun_walk.caf",
               carbine   = "recoil2__walk_back_shotgun.caf reload2__carbine_walk.caf",
            },
         },
         front =
         {
            default   = "walk_front.caf",
            melee_low = { "walk_front_machete.caf", "walk_front_machete_aim.caf", },
            pistol    = { "walk_front_pistol.caf", "walk_front_pistol_aim.caf" },
            shotgun   = { "walk_front_shotgun.caf", "walk_front_shotgun_aim.caf" },
            carbine   = { "walk_front_shotgun.caf", "walk_front_shotgun_aim.caf" },
            jump      =
            {
               default   = "jump_walk_front.caf",
               melee_low = "jump_walk_front.caf",
               pistol    = "jump_walk_front_pistol.caf",
               shotgun   = "jump_walk_front_shotgun.caf",
               carbine   = "jump_walk_front_shotgun.caf",
            },
            attack =
            {
               default   = "",
               melee_low = "melee__fire_machete.caf",
               melee_alt = "melee__fire_machete_alt.caf",
               boxing    = "melee__fire_machete.caf",
               pistol    = "recoil__walk_front_pistol.caf",
               shotgun   = "recoil2__walk_front_shotgun.caf reload2__shotgun_walk.caf",
               carbine   = "recoil2__walk_front_shotgun.caf reload2__carbine_walk.caf",
            },
         },
         left =
         {
            default   = "walk_left.caf",
            melee_low = { "walk_left_machete.caf", "walk_left_machete_aim.caf", },
            pistol    = { "walk_left_pistol.caf", "walk_left_pistol_aim.caf" },
            shotgun   = { "walk_left_shotgun.caf", "walk_left_shotgun_aim.caf" },
            carbine   = { "walk_left_shotgun.caf", "walk_left_shotgun_aim.caf" },
            jump      =
            {
               default   = "jump_walk_left.caf",
               melee_low = "jump_walk_left.caf",
               pistol    = "jump_walk_left_pistol.caf",
               shotgun   = "jump_walk_left_shotgun.caf",
               carbine   = "jump_walk_left_shotgun.caf",
            },
            attack =
            {
               default   = "",
               melee_low = "melee__fire_machete.caf",
               melee_alt = "melee__fire_machete_alt.caf",
               boxing    = "melee__fire_machete.caf",
               pistol    = "recoil__walk_left_pistol.caf",
               shotgun   = "recoil2__walk_left_shotgun.caf reload2__shotgun_walk.caf",
               carbine   = "recoil2__walk_left_shotgun.caf reload2__carbine_walk.caf",
            },
         },
         right =
         {
            default   = "walk_right.caf",
            melee_low = { "walk_right_machete.caf", "walk_right_machete_aim.caf", },
            pistol    = { "walk_right_pistol.caf", "walk_right_pistol_aim.caf" },
            shotgun   = { "walk_right_shotgun.caf", "walk_right_shotgun_aim.caf" },
            carbine   = { "walk_right_shotgun.caf", "walk_right_shotgun_aim.caf" },
            jump      =
            {
               default   = "jump_walk_right.caf",
               melee_low = "jump_walk_right.caf",
               pistol    = "jump_walk_right_pistol.caf",
               shotgun   = "jump_walk_right_shotgun.caf",
               carbine   = "jump_walk_right_shotgun.caf",
            },
            attack =
            {
               default   = "",
               melee_low = "melee__fire_machete.caf",
               melee_alt = "melee__fire_machete_alt.caf",
               boxing    = "melee__fire_machete.caf",
               pistol    = "recoil__walk_right_pistol.caf",
               shotgun   = "recoil2__walk_right_shotgun.caf reload2__shotgun_walk.caf",
               carbine   = "recoil2__walk_right_shotgun.caf reload2__carbine_walk.caf",
            },
         },
      },
      run =
      {
         back =
         {
            default   = "run_back.caf",
            melee_low = { "run_back_machete.caf", "run_back_machete_aim.caf", },
            pistol    = { "run_back_pistol.caf", "run_back_pistol_aim.caf" },
            shotgun   = { "run_back_shotgun.caf", "run_back_shotgun_aim.caf" },
            carbine   = { "run_back_shotgun.caf", "run_back_shotgun_aim.caf" },
            jump      =
            {
               default   = "jump_run_back.caf",
               melee_low = "jump_run_back.caf",
               pistol    = "jump_run_back_pistol.caf",
               shotgun   = "jump_run_back_shotgun.caf",
               carbine   = "jump_run_back_shotgun.caf",
            },
            attack =
            {
               default   = "",
               melee_low = "melee__fire_machete.caf",
               melee_alt = "melee__fire_machete_alt.caf",
               boxing    = "melee__fire_machete.caf",
               pistol    = "recoil__run_back_pistol.caf",
               shotgun   = "recoil2__run_back_shotgun.caf reload2__shotgun_run.caf",
               carbine   = "recoil2__run_back_shotgun.caf reload2__carbine_run.caf",
            },
         },
         front =
         {
            default   = "run_front.caf",
            melee_low = { "run_front_machete.caf", "run_front_machete_aim.caf", },
            pistol    = { "run_front_pistol.caf", "run_front_pistol_aim.caf" },
            shotgun   = { "run_front_shotgun.caf", "run_front_shotgun_aim.caf" },
            carbine   = { "run_front_shotgun.caf", "run_front_shotgun_aim.caf" },
            jump      =
            {
               default   = "jump_run_front.caf",
               melee_low = "jump_run_front.caf",
               pistol    = "jump_run_front_pistol.caf",
               shotgun   = "jump_run_front_shotgun.caf",
               carbine   = "jump_run_front_shotgun.caf",
            },
            attack =
            {
               default   = "",
               melee_low = "melee__fire_machete.caf",
               melee_alt = "melee__fire_machete_alt.caf",
               boxing    = "melee__fire_machete.caf",
               pistol    = "recoil__run_front_pistol.caf",
               shotgun   = "recoil2__run_front_shotgun.caf reload2__shotgun_run.caf",
               carbine   = "recoil2__run_front_shotgun.caf reload2__carbine_run.caf",
            },
         },
         left =
         {
            default   = "run_left.caf",
            melee_low = { "run_left_machete.caf", "run_left_machete_aim.caf", },
            pistol    = { "run_left_pistol.caf", "run_left_pistol_aim.caf" },
            shotgun   = { "run_left_shotgun.caf", "run_left_shotgun_aim.caf" },
            carbine   = { "run_left_shotgun.caf", "run_left_shotgun_aim.caf" },
            jump      =
            {
               default   = "jump_run_left.caf",
               melee_low = "jump_run_left.caf",
               pistol    = "jump_run_left_pistol.caf",
               shotgun   = "jump_run_left_shotgun.caf",
               carbine   = "jump_run_left_shotgun.caf",
            },
            attack =
            {
               default   = "",
               melee_low = "melee__fire_machete.caf",
               melee_alt = "melee__fire_machete_alt.caf",
               boxing    = "melee__fire_machete.caf",
               pistol    = "recoil__run_left_pistol.caf",
               shotgun   = "recoil2__run_left_shotgun.caf reload2__shotgun_run.caf",
               carbine   = "recoil2__run_left_shotgun.caf reload2__carbine_run.caf",
            },
         },
         right =
         {
            default   = "run_right.caf",
            melee_low = { "run_right_machete.caf", "run_right_machete_aim.caf", },
            pistol    = { "run_right_pistol.caf", "run_right_pistol_aim.caf" },
            shotgun   = { "run_right_shotgun.caf", "run_right_shotgun_aim.caf" },
            carbine   = { "run_right_shotgun.caf", "run_right_shotgun_aim.caf" },
            jump      =
            {
               default   = "jump_run_right.caf",
               melee_low = "jump_run_right.caf",
               pistol    = "jump_run_right_pistol.caf",
               shotgun   = "jump_run_right_shotgun.caf",
               carbine   = "jump_run_right_shotgun.caf",
            },
            attack =
            {
               default   = "",
               melee_low = "melee__fire_machete.caf",
               melee_alt = "melee__fire_machete_alt.caf",
               boxing    = "melee__fire_machete.caf",
               pistol    = "recoil__run_right_pistol.caf",
               shotgun   = "recoil2__run_right_shotgun.caf reload2__shotgun_run.caf",
               carbine   = "recoil2__run_right_shotgun.caf reload2__carbine_run.caf",
            },
         },
      },
      step =
      {
         back =
         {
            default   = "",
            melee_low = "step_back_machete.caf",
            boxing    = "step_back_machete.caf",
            pistol    = "step_back_pistol.caf",
            shotgun   = "step_back_shotgun.caf",
            carbine   = "step_back_shotgun.caf",
         },
         right =
         {
            default   = "",
            melee_low = "step_right_machete.caf",
            boxing    = "step_right_machete.caf",
            pistol    = "step_right_pistol.caf",
            shotgun   = "step_right_shotgun.caf",
            carbine   = "step_right_shotgun.caf",
         },
         left =
         {
            default   = "",
            melee_low = "step_left_machete.caf",
            boxing    = "step_left_machete.caf",
            pistol    = "step_left_pistol.caf",
            shotgun   = "step_left_shotgun.caf",
            carbine   = "step_left_shotgun.caf",
         },
      },
      sprint = {
         front =
         {
            default = "sprint_front.caf",
            shotgun = "sprint_front_shotgun.caf",
            carbine = "sprint_front_shotgun.caf",
            jump    =
            {
               default   = "jump_run_front.caf",
               melee_low = "jump_run_front.caf",
               pistol    = "jump_run_front_pistol.caf",
               shotgun   = "jump_run_front_shotgun.caf",
               carbine   = "jump_run_front_shotgun.caf",
            },
         },
      },
      swim = {
         idle  = "swim_surface_idle.caf",
         back  = "swim_surface_back.caf",
         front = "swim_surface_front.caf",
         left  = "swim_surface_left.caf",
         right = "swim_surface_right.caf",
      },
      land = {
         default = {
            default = "jump_land.caf",
            pistol = "jump_land_pistol.caf",
            shotgun = "jump_land_shotgun.caf",
            carbine = "jump_land_shotgun.caf",
         },
         hard ={
            default = "jump_land_hard.caf",
            pistol = "jump_land_hard_pistol.caf",
            shotgun = "jump_land_hard_shotgun.caf",
            carbine = "jump_land_hard_shotgun.caf",
         },
      },
      slide = {
         default = "slide_idle.caf",
         melee_low = "slide_idle_machete.caf",
         pistol = "slide_idle_pistol.caf",
         shotgun = "slide_idle_shotgun.caf",
         carbine = "slide_idle_shotgun.caf",
      },
      talk =
      {
         default = { "talk.caf", "talk_2.caf", "talk_3.caf" },
      },
      sleepAtBed =
      {
         sleepIn   = "idle_to_sleep_bed.caf",
         sleepLoop = "sleep_bed.caf",
         sleepOut  = "sleep_bed_to_idle.caf",
      },
      knockout =
      {
         idle   = "death_pose3.caf",
      },
      rest =
      {
         default = "rest.caf",
      },
      fall      =
      {
         default   = "jump_falling.caf",
         pistol    = "jump_falling_pistol.caf",
         shotgun   = "jump_falling_shotgun.caf",
         carbine   = "jump_falling_shotgun.caf",
      },
      sitbyfire =
      {
         default = "sitbyfire.caf",
         cook = "sitbyfire_roast_meat.caf",
         drink = "sitbyfire_drink.caf",
         eat = "sitbyfire_eat.caf",
         sleep = "sitbyfire_sleep.caf",
         to =
         {
            idle = "sitbyfire_to_idle.caf",
         },
      },
      crouch =
      {
         default = "crouch.caf",
         cook = "crouch_roast_meat.caf",
         takeobject = "crouch_take_object_fast.caf",
      device = "device_crouch_loop.caf",
         to =
         {
            idle = "crouch_to_idle.caf",
         },
      },
      interact =
      {
         default = "interact.caf",
      },
      reload =
      {
         idle =
         {
            pistol1 = "reload__pistol1_idle.caf",
            pistol2 = "reload__pistol2_idle.caf",
            flare = "reload__flaregun_idle.caf",
            shotgun1 = { "reloady_shotgun1_idle_in.caf", "reloady_shotgun1_idle_loop.caf", "reloady_shotgun1_idle_out.caf" },
            shotgun2 = "reload2__shotgun2_idle.caf",
            carbine = { "reloady_carabine_idle_in.caf", "reloady_carabine_idle_loop.caf", "reloady_carabine_idle_out.caf" },
         },
         walk =
         {
            pistol1 = "reload__pistol1_walk.caf",
            pistol2 = "reload__pistol2_walk.caf",
            flare = "reload__flaregun_walk.caf",
            shotgun2 = "reload2__shotgun2_walk.caf",
         },
         run =
         {
            pistol1 = "reload__pistol1_run.caf",
            pistol2 = "reload__pistol2_run.caf",
            flare = "reload__flaregun_run.caf",
            shotgun2 = "reload2__shotgun2_run.caf",
         },
      },
      mine =
      {
         down = "pickaxe_down.caf",
         front = "pickaxe_front.caf",
      },
      dig =
      {
         default = "dig.caf",
      },
      hit =
      {
         default = "hit__default.caf",
      },
      die =
      {
         default = "death.caf",
      },
   }

   self.parameters.maxLandingSpeed  = 1000

   self.fastAccessSlots = {}
   self.fastAccessSlots[3] = nil
   self.fastAccessSlots[4] = nil
   self.fastAccessSlots[5] = nil
   self.fastAccessSlots[6] = nil

   self.initialStyle = "jack_naked"
   self:setupAppearance( self.initialStyle )

   local items = loadParamItemCounts(self, "items", {})
   for name, count in pairs(items) do
      self:obtainItem(name, count)
   end
end

function CMainCharacter:wearHair()
   self:setupAccessory({{bone="head_slot", name="hair_jack.sbg"}})
end

function CMainCharacter:OnCreate()
   setDefaultPlayer( self )
   CPlayer.OnCreate( self )
   CMainCharacter.init( self )
   self:initEffects()
   self:initSounds()

   setDefaultPlayerCameraFov( getPlayerFov() )
   self.prevCamOffset = getDefaultPlayerCameraOffset()
   self.rightShoulderAim = true
   self:updateCamera()

   local function itemsToHotbar()
      local items = loadParamStrings(self, "toHotbar", {})
      for i, name in ipairs(items) do
         self.itemsManager:setToHotbarByName(i, name)
      end
   end

   if isDebug("inventory") then
      runTimer(0, self, function(self)
         self.obtainCheatInventory(self)
         itemsToHotbar()
         self:equipHatOnStart()
         self:equipAttireOnStart()
      end, false)
   else
      runTimer(0, self, function(self)
         if not self.loadedGame then
            runTimer(0, self, function(self) self:equipHatOnStart(); self:equipAttireOnStart() end, false)
         end
         self.obtainStartInventory(self)
         itemsToHotbar()
      end, false)
   end

   --self.hat = self:createAspect( "hair_jack.sbg" )
   --self.hat = self:createAspect( "hat_leather.sbg" )
   --self.hat = self:createAspect( "biker_mask.sbg" )
   --self.hat = self:createAspect( "biker_mask_2.sbg" )
   --self.hat = self:createAspect( "rice_hat.sbg" )
   -- self.hat:getPose():setParent( self:getBonePose( "head_slot" ) )
   -- self.hat:getPose():resetLocalPose()

   self.animationsManager:stopAnimation( "death.caf" )
   --[[
   self.heatEffect = getScene():createEntity( "cylinder_invert.sbg", "" )
   self.heatEffect:getPose():setParent( self:getPose() )
   self.heatEffect:getPose():resetLocalPose()
   self.heatEffect:getPose():setLocalScale( {x=10,y=20,z=10} )
   self.heatEffect:setMaterials( "heat_depth" )]]

   runTimer(1.0 / 10, self, self.updateFocus, true)
end

function CMainCharacter:updateFocus()
   -- focus
   if getPlayer() == self then -- raycast only when not remote controlling
      local obj
      local camHeight = self:getCameraHeight()
      local camDist = self:getCameraDist()
      local distToCamera = vec3Length({x=0,y=camHeight,z=camDist})
      local dist = distToCamera + 150
      local interactY = self:getPose():getPos().y + 100
      -- first raycast closest character
      obj = raycastCharacterOnScreen({x=0.5, y=0.5}, false)
      if obj then
         if obj:isEnemy( self ) and objInDist(self:getPose():getPos(), obj:getPose():getPos(), 4000) then
            gameplayUI:showEnemyCursor( true )
         else
            gameplayUI:showEnemyCursor( false )
         end

         if not objInDist(self:getPose():getPos(), obj:getPose():getPos(), 300) then
            obj = nil
         end
         if not oo.issubclassof(oo.getclass(obj), CCharacter) then
            obj = nil
         end
      else
         gameplayUI:showEnemyCursor( false )
      end
      -- then try raycasting interactors
      if not obj then
         obj = raycastInteractorOnScreen({x=0.5, y=0.5}, dist, true)
         if obj then
            obj = obj:getObject()
            if math.abs(interactY - obj:getPose():getPos().y) > 150 then
               obj = nil
            end
         end
      end
      -- then try for closest to the camera in angle
      if not obj then
         -- try for closest character
         obj = self.senseScheduler:getCharInFocus(dist)
         -- then try for closest interactor
         if not obj then
            local ints = getInteractorsInView(500)
            if #ints > 0 then
               local cameraPos = self:getCamera():getPose():getPos()
               local playerPos = self:getPose():getPos()
               ints = List(ints):filter(function(arg)
                  local argPos = arg:getPose():getPos()
                  -- check for interactor that doesn't want to be seen by raycast
                  if arg:getRaycastRadius() == 0 then
                     return false
                  end
                  if checkPointInSector(cameraPos, self:getDirTarget(), argPos, 40, dist) then
                     if objInDist( playerPos, argPos, dist ) then
                        if math.abs(interactY - arg:getPose():getPos().y) > 150 then
                           return false
                        else
                           return true
                        end
                     end
                  end
                  return false
               end)
               if #ints > 0 then
                  local distances = List()
                  for _, v in ipairs( ints ) do
                     distances:append(getDistance(cameraPos, self:getPose():getPos()))
                  end
                  local min = distances:minmax()
                  obj = ints[distances:index(min)]
                  if obj then
                     obj = obj:getObject()
                  end
               end
            end
         end
      end
      if obj then
         if gameplayUI:getFocusObj() ~= obj then
            questSystem:fireEvent( "find", obj:getName() )
         end
         gameplayUI:setFocusObj(obj)
      else
         gameplayUI:setFocusObj(nil)
      end
   end
   -- end focus
end

function CMainCharacter:equipHatOnStart()
   self:wearHair()
   CCharacter.equipHatOnStart( self )
end

function CMainCharacter:obtainCheatInventory()
   if self.loadedGame then
      self.loadedGame = false
      return
   end

   local blacklist = {
      "message_test.itm",
      "drawing_test.itm",
      "abori_gun_mortar.gun",
      "spacer_jacket.itm",
      "spacer_pants.itm",
      "hat_jack.itm",
      "energy_shield_1.itm",
      "energy_boots.itm",
      "power_cell.itm",
   }

   for itemName,v in pairs(ItemsInfo) do
      local category = ItemsData.getItemInvCategory( itemName )
      if not inList( blacklist, itemName ) and v.category ~= "test" and v.category ~= "quest" then
         local count = 1
         if ItemsData.isItemMoney( itemName ) then
            count = 10000
         elseif category == "ammo" then
            count = 300
         elseif category == "tech" or category == "food" or category == "drink" or category == "smokable" or category == "meds" or category == "misc" then
            count = 10
         end
         self:obtainItem( itemName, count )
      end
   end

   self.itemsManager:setToHotbarByName( 1, "machete.wpn"  )
   self.itemsManager:setToHotbarByName( 2, "revolver.gun" )
   self.itemsManager:setToHotbarByName( 3, "shotgun.gun"  )
   self.itemsManager:setToHotbarByName( 4, "howdah.gun" )
   self.itemsManager:setToHotbarByName( 5, "scamp_22.gun" )
   self.itemsManager:setToHotbarByName( 6, "kabarog_hsg.gun" )
   self.itemsManager:setToHotbarByName( 7, "carbine.gun" )
   self.itemsManager:setToHotbarByName( 11, "scanner.itm" )
end

function CMainCharacter:obtainStartInventory()
   if self.loadedGame then
      self.loadedGame = false
      return
   end

   self:obtainItem( "hand_to_hand.wpn", 1 )
   self:obtainItem( "hat_jack.itm", 1 )
   self:obtainItem( "spacer_jacket.itm", 1 )
   self:obtainItem( "spacer_pants.itm", 1 )
   self:obtainItem( "scanner.itm", 1 )

   self.itemsManager:setToHotbarByName( 1, "hand_to_hand.wpn" )
   self.itemsManager:setToHotbarByName( 11, "scanner.itm" )

   startQuest("notes")
end

function CMainCharacter:timeSkipStart()
   gameplayUI:closeUI()
   self:setState( "blockItemUse", true )
   self:setState( "sleeping", true )
   if self:getState( "sleepAtBed" ) then
      gameplayUI:setupBillboard("Sleeping", string.format( "Press '%s' to wake up", getButtonCurrentKeyName( "ACTIVATE" ) ) )
   else
      self.animationsManager:loopAnimation(self.animations.sitbyfire.sleep)
      self:setState( "disableInteraction", true )
   end
end

function CMainCharacter:timeSkipStop()
   self:setState( "blockItemUse", false )
   self:setState( "sleeping", false )
   if self:getState( "sleepAtBed" ) then
      self:setStatCount( "health", self.stats.healthMax.current )
      self.interactTarget:deactivate( self )
   else
      self.animationsManager:loopAnimation(self.animations.sitbyfire.default)
      self:setState( "disableInteraction", false )
   end
   --work around status effect time not respecting game speed
   self.statusEffectsManager:zeroAllTimes() --TODO:FIXME: make  status effect respect game speed
end

function CMainCharacter:restAtBed( obj )
   gameplayUI:closeUI()
   gameplayUI:showWaiting()
   self:setDisableActionStates( true )
   self:setState( "sleepAtBed", true )
   self:holsterWeapon()
   self:setCollision(false)
   runTimer(1, nil, function()
      self:setState( "disableInteraction", false )
   end, false)

   local offset = localPointToWorld({x=0,y=0,z=-80}, self.interactTarget:getPose())
   offset.y = self:getPose():getPos().y
   local dir = vec3RotateQuat( {x=0,y=0,z=-1}, self.interactTarget:getPose():getRotQuat() )
   self:moveAndOrientate( offset, dir, 0.2)
   self.animationsManager:loopAnimation( self.animations.sleepAtBed.sleepLoop )
   self.animationsManager:playAnimation( self.animations.sleepAtBed.sleepIn )
   gameplayUI:setupBillboard("Sleeping", string.format( "Press '%s' to get up", getButtonCurrentKeyName( "ACTIVATE" ) ) )
   return true
end

function CMainCharacter:sleepOutCallback()
   self:setDisableActionStates( false )
   getScene():tryAutoSave()
end

function CMainCharacter:leaveBed( obj )
   if gameplayUI:isWaitingMode() then
      return false
   end

   gameplayUI:hideBillboard()
   self.animationsManager:loopAnimation( "idle.caf")
   self.animationsManager:playAnimation( self.animations.sleepAtBed.sleepOut )
   self.animationsManager:subscribeAnimationEnd( self.animations.sleepAtBed.sleepOut, self, self.sleepOutCallback )
   gameplayUI:hideRestHints()
   gameplayUI:hideWaiting()
   self:setState( "disableInteraction", true )
   self:setState( "sleepAtBed", false )
   self:setCollision(true)
   return true
end

--Unified method for stats that DON'T recieve bonuses
function CMainCharacter:changeStatCount( statName, delta )
   CPlayer.changeStatCount( self, statName, delta )
   if statName == "stamina" then
      if ( delta < 0 ) then
         self:changeStatCount( "food", delta * 0.00005 * self:getStatCount( "food" ) )
         self:changeStatCount( "water", delta * 0.0001 * self:getStatCount( "water" ) )
      end
      if self:getStatCount( "stamina" ) <= 0 then
         self:setState( "tired", true )
      elseif self:getStatCount( "stamina" ) > self:getStatCount( "staminaMax" ) * 0.2 and self:getState( "tired" ) then
         self:setState( "tired", false )
      end
   end
end

function CMainCharacter:regenerate()
   self:changeStatCount( "health", self:getStatCount( "healthRegen" ) * getFrameTime() )
   self:changeStatCount( "stamina", self:getStatCount( "staminaRegen" ) * getFrameTime() )
   self:changeStatCount( "energy", self:getStatCount( "energyRegen" ) * getFrameTime() )
   self:changeStatCount( "food", self:getStatCount( "foodRegen" ) * getFrameTime() )
   self:changeStatCount( "water", self:getStatCount( "waterRegen" ) * getFrameTime() )
   self:changeStatCount( "sleep", self:getStatCount( "sleepRegen" ) * getFrameTime() )
end

function CMainCharacter:OnIdle()
   CPlayer.OnIdle( self )

   gameplayUI:updateStatisticsAttributePoints()
   gameplayUI:updateAllPlayerEffectsUI()

   --energy gun ammo
   if self:getWeaponSlotItem() and self:getWeaponSlotItem():getWeaponType() == "energy" then
      self:updateAmmoGui()
   end

   if ( not self.camSlope ) then
      self.camSlope = 0.0
   end

   if self:getState("hipFire") then
      self.camSlope = mixF( self.camSlope, getAngle( {x=0, y=1, z=0}, self:getCamera():getUp(), self:getCamera():getRight() ), getFrameTime() * 20 )
   else
      self.camSlope = mixF( self.camSlope, 0.0, getFrameTime() )
   end

   if ( math.abs(self.camSlope) < 1.0 ) then
      return
   end

   self:rotateBone( "Man Spine" , self.camSlope*0.2 )
   self:rotateBone( "Man Spine1", self.camSlope*0.2 )
   self:rotateBone( "Man Spine2", self.camSlope*0.5 )

   self:rotateBone( "Man Neck", self.camSlope )
   self:rotateBone( "Man Head", self.camSlope )

   self:rotateBone( "Man L Clavicle", self.camSlope )
   self:rotateBone( "Man R Clavicle", self.camSlope )
end

function CMainCharacter:OnAir(dist)
   if not self:getState( "climbing_ladder" ) and not self:getState( "climbing_ladder_down" ) then
      CPlayer.OnAir( self, dist )
      self:setState( "inAir", true )
      self:setState( "disableJump", true )
      self:setState( "blockItemUse", true )
      self:setState( "disableInteraction", true )

      local delay = 0.9
      if not self:getState( "jumping" ) then
         delay = 0.3
      end

      if self.fallTimer then
         self.fallTimer:stop()
         self.fallTimer = nil
      end

      self.fallTimer = runTimer(delay, nil, function()
         if self:getState( "inAir" ) then
            local animationSet = self.itemsManager:getSlotAnimationSet( self.parameters.weaponSlotId )
            local anim = self.animations.fall[animationSet] or self.animations.fall.default
            self.animationsManager:loopAnimationDelay(anim, 0.1)
            self:setState( "falling", true )
         end
         self.fallTimer = nil
      end, false)
      self:tryCancelActions( false )
   end
end

function CMainCharacter:OnLanding( landingSpeed )
   if rand(2) < 1 then
      self.sounds.jump_land_1:play()
   else
      self.sounds.jump_land_2:play()
   end

   if self.fallTimer then
      self.fallTimer:stop()
      self.fallTimer = nil
   end
   self.deltaLandingSpeed = (-landingSpeed) - self.parameters.maxLandingSpeed
   if not self:getState("swimming") then
      if ( self.deltaLandingSpeed > 0 ) then
         local damage = scaleValue(self:getStatCount("healthMax"), self.deltaLandingSpeed, self.parameters.maxLandingSpeed)
         local boots = self:getInventory():getSlotItem( "boots" )
         if boots and boots.fallDamageBlockMul and self:getStatCount("energy") >= boots.fallEnergyCost then
            damage = damage * boots.fallDamageBlockMul
            self:changeStatCount( "energy", -boots.fallEnergyCost )
         end
         self:hit( damage, nil )
      end

      self:animatedEvent( "land" )
      self:setState     ( "blockItemUse", false )
      self:setState     ( "disableInteraction", false )
      self:setState     ( "disableJump", false )
   end

   self:animatedEvent( "land" )
   self:setState     ( "inAir", false )
   self:setState     ( "falling", false )
   self:setState     ( "jumping", false )
   self:setState     ( "disableAirPickup", false )
   self:tryCancelActions( false )
end

function CMainCharacter:OnSlideBegin()
   self:setState( "sliding", true )
   self:setDisableActionStates( true )
   self:setState( "disableMove", false )
   local animationSet = self.itemsManager:getSlotAnimationSet( self.parameters.weaponSlotId )
   local anim
   if animationSet == "" or not self.animations.slide[animationSet] then
      anim = self.animations.slide.default
   else
      anim = self.animations.slide[animationSet]
   end
   self.animationsManager:loopAnimation( anim )
   self:tryCancelActions( false )
end

function CMainCharacter:OnSlideEnd()
   self:setState( "sliding", false )
   self:setDisableActionStates( false )
   self:tryCancelActions( false )
end

function CMainCharacter:OnControlDown( code )
   if not CPlayer.OnControlDown( self, code ) then
      return false
   end

   local currentWeapon = self:getWeaponSlotItem()
   local focusObj = gameplayUI:getFocusObj()

   if ( code == getButtonCode( "ATTACK" ) and self:canAttack() ) then
      gameplayUI:updateImmersiveUITimeRef( "ammo" )
      if currentWeapon and not self:getState( "waitReloadEnd") then
      elseif self.lastWeapon then
         setButton( "ATTACK", false )
         local lastWeapon = self.itemsManager:getItemById( self.lastWeapon.id )
         if lastWeapon then
            self:useItem( lastWeapon )
         end
      else
         setButton( "ATTACK", false )
         local handWeapon = self.itemsManager:getItemByName( "hand_to_hand.wpn" )
         self:useItem( handWeapon )
      end

   elseif ( code == getButtonCode( "AIM" ) and not gameplayUI:clickableWindowsVisible()
            and not terminalUI:isCursorVisible() ) then
      gameplayUI:updateImmersiveUITimeRef( "ammo" )
      if currentWeapon and currentWeapon:isMeleeWeapon() and self:canAttack() then
         self:useItem( currentWeapon )
      elseif not currentWeapon or currentWeapon and currentWeapon:isRangedWeapon() then
         self:startAiming()
      end

   elseif ( code == getButtonCode( "JUMP" ) and self:canJump() ) then
      local boots = self:getInventory():getSlotItem( "boots" )
      if getButton("SPRINT") and boots then
         if boots.OnActivate and self:getStatCount("energy") >= boots.jumpEnergyCost then
            boots:OnActivate()
            self:changeStatCount( "energy", -boots.jumpEnergyCost )
         end
      end

   elseif ( code == getButtonCode( "ACTIVATE" ) ) then
      if self:canInteract() then
         if self:getState("sleepAtBed") and self.interactTarget and gameplayUI.waiting.waitMode then
            WeatherSystem:unsubscribeDaytimeChange( gameplayUI.cbWaitStop, gameplayUI.timeChangeSub )
            gameplayUI.timeChangeSub = nil
            gameplayUI.waiting.waitMode = false

            setGameSpeed                ( 1.0 )
            WeatherSystem:changeTimeRate( -gameplayUI.waiting.rates.weather )
            SkySystem:changeTimeRate    ( -gameplayUI.waiting.rates.sky )

            self:timeSkipStop()
         elseif self:getState("sleepAtBed") and self.interactTarget then
            self.interactTarget:deactivate( self )
         elseif self:getState( "gathering" ) and not self:getState( "waitGatherFinish" ) then
            self:forceStopGathering( false )
         elseif self.exchangeTarget and not self:getState( "trading" ) then
            self:interactObject( "deactivate", self.exchangeTarget, nil )
         else
            self:preActivateObject()
         end
      --Exception to be able to pickup 1 item during airtime/jumping
      elseif self:getState( "inAir" ) and focusObj and focusObj.getType and focusObj:getType() == "pickup" and not self:getState( "disableAirPickup" ) then
         self:preActivateObject()
         --restore air states and restrict another air pickup
         self:setState( "disableInteraction", true )
         self:setState( "disableJump", true )
         self:setState( "blockItemUse", true )
         self:setState( "disableAirPickup", true )
      end

   elseif ( code == getButtonCode( "RELOAD" ) and self:canInteract() ) then
      gameplayUI:updateImmersiveUITimeRef( "ammo" )
      self:onReloadGun()

   elseif ( code == getButtonCode( "PREVIOUS" ) ) then
      gameplayUI:updateImmersiveUITimeRef( "ammo" )
      self:prevWeapon()

   elseif ( code == getButtonCode( "HOTBAR1" ) ) then
      self:OnHotbarItemClick( 1 )
   elseif ( code == getButtonCode( "HOTBAR2" ) ) then
      self:OnHotbarItemClick( 2 )
   elseif ( code == getButtonCode( "HOTBAR3" ) ) then
      self:OnHotbarItemClick( 3 )
   elseif ( code == getButtonCode( "HOTBAR4" ) ) then
      self:OnHotbarItemClick( 4 )
   elseif ( code == getButtonCode( "HOTBAR5" ) ) then
      self:OnHotbarItemClick( 5 )
   elseif ( code == getButtonCode( "HOTBAR6" ) ) then
      self:OnHotbarItemClick( 6 )
   elseif ( code == getButtonCode( "HOTBAR7" ) ) then
      self:OnHotbarItemClick( 7 )
   elseif ( code == getButtonCode( "HOTBAR8" ) ) then
      self:OnHotbarItemClick( 8 )
   elseif ( code == getButtonCode( "HOTBAR9" ) ) then
      self:OnHotbarItemClick( 9 )
   elseif ( code == getButtonCode( "HOTBAR0" ) ) then
      self:OnHotbarItemClick( 10 )
   elseif ( code == getButtonCode( "HOTBARQ" ) ) then
      self:OnHotbarItemClick( 11 )

   elseif ( code == getButtonCode( "HOLSTER" ) and self:canAttack() ) then
      gameplayUI:updateImmersiveUITimeRef( "ammo" )
      if currentWeapon then
         self:holsterWeapon()
      elseif self.lastWeapon then
         local lastWeapon = self.itemsManager:getItemById( self.lastWeapon.id )
         if lastWeapon then
            self:useItem( lastWeapon )
         end
      end

   elseif ( ( code == getButtonCode( "INVENTORY" ) or code == getButtonCode( "INVENTORYALT" ) )
         and self:canUseUI()) then
      if gameplayUI:isInventoryVisible() or gameplayUI:isCharacterWindowVisible() then
         gameplayUI:showCharacterWindow( false )
         self:OnInventoryClose()
      else
         gameplayUI:showCharacterWindow( true )
         self.itemsManager:showInventory( true )
      end

   elseif code == getButtonCode( "CHARACTER") and self:canUseUI() then
      gameplayUI:showCharacterWindow( not gameplayUI:isCharacterWindowVisible() )

   elseif code == getButtonCode( "TIMESKIP" ) and self:canUseUI() then
      if ( self:getState("resting") ) then
         if ( gameplayUI:isWaitingVisible() ) then
            gameplayUI:hideWaiting()
         else
            gameplayUI:showWaiting()
         end
      end

   elseif code == getButtonCode( "RESTING" ) and self:canUseUI() then
      if ( isDebug("keys") and not self:getState("cooking") and not self:getState("talk")) then
         self:setState( "resting", not self:getState("resting") )
      end

   elseif code == getButtonCode( "MAP" ) and self:canUseUI() then
      local mapItem = self:getInventory():getItemByName("windscream_canyon_map.itm")
      if mapItem then
         self:useItem( mapItem )
      else
         gameplayUI:showInfoTextEx("You don't have any maps", "minor", "")
      end

   elseif code == getButtonCode( "CAMVIEW" ) then
      local rangedMode = currentWeapon and currentWeapon:isRangedWeapon()
      local aimMode = self:getState("aiming")
      if rangedMode or aimMode then
         self.rightShoulderAim = not self.rightShoulderAim
         if self.rightShoulderAim then
            self.prevCamOffset = 53
         else
            self.prevCamOffset = -47
         end
      else
         self.prevCamOffset = self.prevCamOffset + 50
         if self.prevCamOffset > 53 then
            self.prevCamOffset = -47
            self.rightShoulderAim = false
         else
            self.rightShoulderAim = true
         end
      end
      self:updateCamera()

   elseif ( code == getButtonCode( "CAMUP" ) ) then
      if getDefaultPlayerCameraHeight() < getGlobalParam("maxCamHeight") then
         setGlobalParam( "camHeight", getDefaultPlayerCameraHeight() + 10 )
         setDefaultPlayerCameraHeight(getDefaultPlayerCameraHeight() + 10)
         self:updateCamera()
      end
   elseif ( code == getButtonCode( "CAMDOWN" ) ) then
      if getDefaultPlayerCameraHeight() > getGlobalParam("minCamHeight") then
         setGlobalParam( "camHeight", getDefaultPlayerCameraHeight() - 10 )
         setDefaultPlayerCameraHeight(getDefaultPlayerCameraHeight() - 10)
         self:updateCamera()
      end

   elseif ( code == getButtonCode( "GODMODE" ) and isDebug("keys")) then
      local msg = "God mode on"
      if not self.god_mode and not self.super_speed then
         self.god_mode = true
      elseif self.god_mode and not self.super_speed then
         msg = "Super speed on"
         self.super_speed = true
      else
         msg = "God mode and super speed off"
         self.god_mode = false
         self.super_speed = false
      end
      gameplayUI:showInfoTextEx(msg, "major", "")
   end

   --To be able to cancel standing shotgun reloading
   if code == getButtonCode( "ATTACK" ) or code == getButtonCode( "FORWARD" )
      or code == getButtonCode( "BACK" ) or code == getButtonCode( "LEFT" )
      or code == getButtonCode( "RIGHT" ) or code == getButtonCode( "JUMP" ) then
      self:tryCancelReloading()
   end

   return true
end

function CMainCharacter:OnControlUp( code )
   if ( not CPlayer.OnControlUp( self, code ) ) then
      return false
   end

   local currentWeapon = self:getWeaponSlotItem()

   if ( code == getButtonCode( "AIM" ) ) then
      self:stopAiming()

   elseif ( code == getButtonCode( "ACTIVATE" ) ) then
      if self:getState( "interacting" ) then
         self:activateObject()
      end
   end

   return true
end

function CMainCharacter:OnInventoryDrag( item, count )
   log ( "OnInventoryDrag: " .. item.name .. " count: " .. tostring(count) )

   if ( not self.exchangeTarget ) then
      return
   elseif ( item:isQuestItem() ) then
      gameplayUI:showInfoTextEx( "I might need that for later.", "minor", "" )
      return
   end

   self.exchangeTarget:takeItemFrom( item.id, self, count )
end

function CMainCharacter:OnInventoryDrop( item, count )
   log ( "OnInventoryDrop: " .. item.name .. " count: " .. tostring(count) )

   if ( not self.exchangeTarget ) then
      return
   end

   self.exchangeTarget:giveItem( item.id, self, count )
end

function CMainCharacter:OnInventoryClose()
   if ( self.exchangeTarget ) then
      self:interactObject( "deactivate", self.exchangeTarget, nil )
   end

   self.itemsManager:showInventory( false )
   gameplayUI.message.wnd:setVisible( false )
end

function CMainCharacter:OnInventoryTakeAll()
   if ( not self.exchangeTarget ) then
      return
   end

   local items = {}

   for i=1,#self.exchangeTarget.itemsManager.items do
      items[#items + 1] = self.exchangeTarget.itemsManager.items[i]
   end

   for i=1,#items do
      self.exchangeTarget:giveItem( items[i].id, self, items[i].count )
   end
end

function CMainCharacter:OnPopupInventoryOpen( item )
   log( "OnPopupInventoryOpen: " .. item.name )

   local decomposeList   = ItemsDecompose[item.name]
   self.popupMenuItem    = item
   self.popupMenuOptions = {}

   if ( item:isEquipable() and not self:getState("resting") ) then
      if self.itemsManager:getSlotItem( item:getAttireType() ) == item then
         self.popupMenuOptions[#self.popupMenuOptions+1] = "unequip"
      else
         self.popupMenuOptions[#self.popupMenuOptions+1] = "equip"
      end
   end

   if ( decomposeList ) then
      self.popupMenuOptions[#self.popupMenuOptions+1] = "decompose"
   end

   if ( ItemsData.isItemCookable(item.name) and self:getState("resting") ) then
      self.popupMenuOptions[#self.popupMenuOptions+1] = "cook"
   end

   if ( item:isConsumable() or ItemsData.isItemPermaBuff(item.name) or ItemsData.isItemUsable(item.name)) then
      self.popupMenuOptions[#self.popupMenuOptions+1] = "use"
   end

   if ( item.isInstallable and item:isInstallable() and not self:getState("resting") ) then
      self.popupMenuOptions[#self.popupMenuOptions+1] = "install"
   end

   if ItemsData.isItemMessage(item.name) then
      self.popupMenuOptions[#self.popupMenuOptions+1] = "read"
   end

   if ItemsData.isItemDrawing(item.name) or item:isMap() then
      self.popupMenuOptions[#self.popupMenuOptions+1] = "view"
   end

   gameplayUI:setupPopupMenu( self.popupMenuOptions )
end

function CMainCharacter:OnPopupInventoryClick( text )
   log( "OnPopupInventoryClick: " .. text )
   if self:getState("blockItemUse") then return end

   --local option = self.popupMenuOptions[uiIndex]
   local option = text

   if ( option == "equip" ) then
      self:useItem( self.popupMenuItem )
   elseif ( option == "unequip" ) then
      local slotId = self.popupMenuItem:getAttireType() or getKeyByValue( self.fastAccessSlots, self.popupMenuItem.name ) or 1
      self.itemsManager:unequipSlot( slotId )
   elseif ( option == "decompose" ) then
      self.itemsManager:decomposeItem( self.popupMenuItem.id )
   elseif ( option == "cook" ) then
      if self.popupMenuItem.count > 1 then
         gameplayUI:setupItemDelimiter( self.popupMenuItem, "cook" )
         gameplayUI:showItemDelimiter()
      else
         self:setState( "cooking", true )
      end
      self.cookItem = self.popupMenuItem
   elseif ( option == "cook_multi" ) then
      self:setState( "cooking", true )
   elseif ( option == "use" ) then
      self:useItem( self.popupMenuItem )
   elseif ( option == "install" ) then
      self:interactObject( "drop", self.popupMenuItem, nil )
   elseif ( option == "read" ) then
      self:useItem( self.popupMenuItem )
   elseif ( option == "view" ) then
      self:useItem( self.popupMenuItem )
   elseif ( option == "clear slot" ) then
      local slotID = self.popupMenuItem
      gameplayUI:clearHotbarSlot( slotID )
   end
end

function CMainCharacter:OnCraftPrepare( listIds )
   log( "CMainCharacter:OnCraftPrepare" )

   local itemName = self.itemsManager:checkComposeItem( listIds )

   if ( itemName and ItemsInfo[itemName] ) then
      gameplayUI:setCraftResultImage( ItemsInfo[itemName].icon )
      self.craftPrepareItems = listIds
   else
      gameplayUI:setCraftResultImage( "" )
      self.craftPrepareItems = nil
   end
end

function CMainCharacter:OnCraftClear()
   log( "CMainCharacter:OnCraftClear" )
   self.craftPrepareItems = nil
end

function CMainCharacter:OnCraft()
   log( "CMainCharacter:OnCraft" )
   self.itemsManager:composeItem( self.craftPrepareItems )
   self:OnCraftClear()
   self.itemsManager:updateInventoryUI()
end

function CMainCharacter:exchangeStart( object )
   self.itemsManager:showInventory( true )
   self.exchangeTarget = object
end

function CMainCharacter:exchangeStop()
   self.itemsManager:showInventory( false )
   self.exchangeTarget = nil
end

function CMainCharacter:addActions()
   local move = CAction{}
   move:allowRestartOnEvent("onChangeButtonState")
   move:allowRestartOnEvent("onChangeState")
   move.start = self.move_start
   move.stop  = self.move_stop
   move.name  = "move"

   local jump = CAction{}
   jump.start = self.jump
   jump.name  = "jump"

   local attack = CAction{}
   attack.start = self.attack
   attack.name  = "attack"

   local rest = CAction{}
   --rest:allowRestartOnEvent("onChangeState")
   rest.start = self.rest_start
   rest.stop  = self.rest_stop
   rest.name  = "rest"

   local cook = CAction{}
   cook:allowRestartOnEvent("onChangeState")
   cook.start = self.cook_start
   --cook.stop  = self.cook_stop
   cook.name  = "cook"

   local interact = CAction{}
   interact:allowRestartOnEvent("onChangeState")
   interact.start = self.interact_start
   --interact.stop  = self.interact_stop
   interact.name  = "interact"

   local climb_ladder = CAction{}
   -- climb_ladder:allowRestartOnEvent("onChangeState")
   climb_ladder.start = self.climb_ladder_start
   climb_ladder.stop  = self.toIdle
   climb_ladder.name  = "climb_ladder"

   local climb_ladder_down = CAction{}
   -- climb_ladder_down:allowRestartOnEvent("onChangeState")
   climb_ladder_down.start = self.climb_ladder_down_start
   climb_ladder_down.stop  = self.toIdle
   climb_ladder_down.name  = "climb_ladder_down"

   local root = CNode{}
   root:yes (self.climb_ladder_down_):no  (self.climb_ladder_):no  (self.interact_):no  (self.rest_):no  (self.jump_):no   (self.attack_):yes  (attack)
   root:yes (self.climb_ladder_down_):no  (self.climb_ladder_):no  (self.interact_):no  (self.rest_):no  (self.jump_):yes  (jump)
   root:yes (self.climb_ladder_down_):no  (self.climb_ladder_):no  (self.interact_):no  (self.rest_):no  (self.move_):yes  (move)
   root:yes (self.climb_ladder_down_):no  (self.climb_ladder_):no  (self.interact_):no  (self.rest_):yes (self.cook_):no   (rest)
   root:yes (self.climb_ladder_down_):no  (self.climb_ladder_):no  (self.interact_):no  (self.rest_):yes (self.cook_):yes  (cook)
   root:yes (self.climb_ladder_down_):no  (self.climb_ladder_):no  (self.interact_):yes (interact)
   root:yes (self.climb_ladder_down_):no  (self.climb_ladder_):yes (climb_ladder)
   root:yes (self.climb_ladder_down_):yes (self.climb_ladder_):no  (climb_ladder_down)

   self.actionsScheduler.root = root
   self.notificationCenter:postNotification( "onActionsSchedulerRootUpdate" )
end

-- action methods and predecates
function CMainCharacter:climb_ladder_()
   return self:getState( "climbing_ladder" )
end
function CMainCharacter:climb_ladder_down_()
   return self:getState( "climbing_ladder_down" )
end

function CMainCharacter:climb_ladder_start()
   self.animationsManager:loopAnimation("ladder_loop_r.caf")
   self.animationsManager:playAnimation("ladder_start_bottom_r.caf", false)
   self.animationsManager:subscribeAnimationEnd("ladder_start_bottom_r.caf", self, self.climb_ladder_loop)
end

-- ladder_start_bottom_r.caf　11 farmes
-- ladder_loop_r.caf 19 frames
-- ladder_end_up_r.caf 30 frames

function CMainCharacter:climb_ladder_loop()
   local cm_per_sec = 145
   local climb_time = 0.6
   self.animationsManager:loopAnimation("ladder_loop_r.caf")
   local offset = self:getPose():getPos()
   offset.y = offset.y + (((cm_per_sec * climb_time) / 2) * (self.ladderObj.steps - 3))
   local dir = vec3RotateQuat( {x=0,y=0,z=1}, self.ladderObj:getPose():getRotQuat() )
   self:moveAndOrientate( offset, dir, (climb_time / 2) * (self.ladderObj.steps - 3))
   runTimer((climb_time / 2) * (self.ladderObj.steps - 3), self, self.climb_ladder_finish, false)
end

function CMainCharacter:climb_ladder_finish()
   self.animationsManager:loopAnimation("idle.caf")
   self.animationsManager:playAnimation("ladder_end_up_r.caf", false)
   self.animationsManager:subscribeAnimationEnd("ladder_end_up_r.caf", self, self.onClimbEndAnimationEnd)

   local offset = localPointToWorld({x=0,y=140,z=-50}, self:getPose())

   self:moveAndOrientate( offset, self:getDir(), 0.76 )
end

function CMainCharacter:onClimbEndAnimationEnd()
   self:setState("climbing_ladder", false)
   self:setState("climbing_ladder_down", false)
end

function CMainCharacter:climb_ladder_down_start()
   func = function (self)
      local myy = self:getPose():getPos().y - self.ladderObj:getPose():getPos().y
      local pos = localPointToWorld({x=0,y=myy,z=-45}, self.ladderObj:getPose())
      local orient = vec3RotateQuat( {x=0,y=0,z=1}, self.ladderObj:getPose():getRotQuat() )

      self:moveAndOrientate(pos, orient, 0.5)

      self.animationsManager:loopAnimation("ladder_loop_down_l.caf")
      self.animationsManager:playAnimation("ladder_start_up_l.caf", false)
      self.animationsManager:subscribeAnimationEnd("ladder_start_up_l.caf", self, self.climb_ladder_down_loop)
   end
   runTimer(0.2, self, func, false)
end

function CMainCharacter:climb_ladder_down_loop()
   local posl = self.ladderObj:getPose():getPos()
   local poss = self:getPose():getPos()
   poss.y = posl.y

   local dir = vec3RotateQuat( {x=0,y=0,z=1}, self.ladderObj:getPose():getRotQuat() )
   self:moveAndOrientate(poss, dir, (0.5 / 5) * self.ladderObj.steps)
   self.animationsManager:loopAnimation("ladder_loop_down_l.caf")
   runTimer((0.5 / 5) * self.ladderObj.steps, self, CMainCharacter.climb_ladder_down_finish, false)
end

function CMainCharacter:climb_ladder_down_finish()
   self.animationsManager:loopAnimation("idle.caf")
   self.animationsManager:playAnimation("ladder_end_down_l.caf", false)
   self.animationsManager:subscribeAnimationEnd("ladder_end_down_l.caf", self, self.onClimbEndAnimationEnd)
end

function CMainCharacter:rest_()
   return self:getState( "resting" )
end

function CMainCharacter:rest_start()
   if ( self:getState( "cooking" ) ) then
      return
   end

   self:holsterWeapon()

   self:stopMove()
   -- self.animationsManager:playAnimation( self.animations.idle.to.crouch, false )
   -- self.animationsManager:subscribeAnimationEnd( self.animations.idle.to.crouch, self, function() self.animationsManager:loopAnimation( self.animations.crouch.default ) end )

   -- problem place: if transition anim is loop, then it's not played. if it's play then jack jerks up when finished cooking
   -- solved now
   if ( not self:getState( "finished_cooking") and not self:getState("finished_drinking") and not self:getState("finished_eating") ) then
      self.animationsManager:playAnimation( self.animations.idle.to.sitbyfire )
   else
      self:setState( "finished_cooking", false )
      self:setState( "finished_drinking", false )
      self:setState( "finished_eating", false )
   end
   self.animationsManager:loopAnimation( self.animations.sitbyfire.default )

   self:setOrientationSpeed( 0 )

   self:setCameraHeight( 70, 1.0 )
   self:setCameraDist  ( 100, 1.5 )
   self:setCameraFov   ( getDefaultPlayerCameraFov(), 0.5 )

   gameplayUI:showRestHints()
end

function CMainCharacter:rest_stop()
   if ( not self:getState( "cooking" ) and not self:getState( "eating" ) and not self:getState( "drinking" ) ) then
      self.animationsManager:playAnimation( self.animations.sitbyfire.to.idle, false )


      self.animationsManager:subscribeAnimationEnd( self.animations.sitbyfire.to.idle, self, self.toIdle )

      self:setState( "disableInteraction", true )
   end

   gameplayUI:hideRestHints()
   gameplayUI:hideWaiting()
end

function CMainCharacter:toIdle()
   self:setDisableActionStates( false )
end

function CMainCharacter:setDisableActionStates( state )
   self:setState( "blockItemUse", state )
   self:setState( "disableAttack", state )
   self:setState( "disableMove", state )
   self:setState( "disableJump", state )
   self:setState( "disableInteraction", state )
end

function CMainCharacter:forceStopResting()
   if gameplayUI.waiting.waitMode then
      gameplayUI.waiting.waitMode = false
      gameplayUI.timeChangeSub = nil

      WeatherSystem:unsubscribeDaytimeChange( gameplayUI.cbWaitStop, gameplayUI.timeChangeSub )

      setGameSpeed                ( 1.0 )
      WeatherSystem:changeTimeRate( -gameplayUI.waiting.rates.weather )
      SkySystem:changeTimeRate    ( -gameplayUI.waiting.rates.sky )
   end

   self:setState( "sleeping", false )
   self:setState( "resting", false )
   self:setDisableActionStates( false )

   self.animationsManager:playAnimation( self.animations.sitbyfire.to.idle, false )

   gameplayUI:hideRestHints()
   gameplayUI:hideWaiting()
end

function CMainCharacter:cook_start()
   if ( self.cookTimer ) then
      return
   end

   self:setState( "blockItemUse", true )

   self:setState( "disableInteraction", true )

   -- after finishing the cook animation jack is twitching to standup. NOT ANYMORE
   self.animationsManager:playAnimation( self.animations.sitbyfire.cook, false )


   self.itemsManager:unequipSlot( self:getWeaponSlot() )

   local cookInfo = ItemsData.getItemCookInfo( self.cookItem.name )

   self.cookingStick = getScene():createEntity( "wooden_stick.sbg", "" )
   self.cookingStick:getPose():setParent( self:getBonePose( "item_slot" .. self:getWeaponSlot() ) )
   self.cookingStick:getPose():resetLocalPose()

   self.cookEntity = getScene():createEntity( cookInfo.model, "" )
   local px = 0
   local py = 20
   local pz = -35
   local qx = 0

   self.cookEntity:getPose():setParent( self.cookingStick:getPose() )
   self.cookEntity:getPose():resetLocalPose()
   self.cookEntity:getPose():setLocalRotQuat( quatFromEuler({x=qx}) )
   self.cookEntity:getPose():setLocalPos    ( {x=px,y=py,z=pz} )
   --self.cookEntity:getPose():setLocalScale  ( {x=2,y=2,z=2} )
   self.cookEntity:setTexture( 0, cookInfo.texRaw )

   self.cookEntityReady = getScene():createEntity( cookInfo.model, "" )

   self.cookEntityReady:getPose():setParent( self.cookingStick:getPose() )
   self.cookEntityReady:getPose():resetLocalPose()
   self.cookEntityReady:getPose():setLocalRotQuat( quatFromEuler({x=qx}) )
   self.cookEntityReady:getPose():setLocalPos    ( {x=px,y=py,z=pz} )
   self.cookEntityReady:getPose():setLocalScale  ( {x=0.01,y=0.01,z=0.01} )
   self.cookEntityReady:setTexture( 0, cookInfo.texCooked )

   self.fx.fry:getPose():setParent( self.cookEntity:getPose() )
   self.fx.fry:getPose():resetLocalPose()
   self.fx.fry:play()

   self.sounds.fry:getPose():setParent( self.cookEntity:getPose() )
   self.sounds.fry:getPose():resetLocalPose()
   self.sounds.fry:play()
   self.sounds.fry:setVolume( 1 )

   local cookTime = 5

   gameplayUI:showInteractProgress( "Cooking", cookTime )

   self.cookTimer = runTimer( cookTime, self, self.cook_stop, false )

   runTimer( cookTime/2, self, self.cook_half, false )
end

function CMainCharacter:cook_half()
   self.cookEntityReady:getPose():setLocalScale( {x=1,y=1,z=1} )
   self.cookEntity:setVisible( false )
   self.sounds.fry:setVolume( 3 )
end

function CMainCharacter:cook_stop()
   if ( not self:getState( "cooking" ) ) then
      return
   end
   self:setState( "blockItemUse", false )

   self:setState( "disableInteraction", false )

   self:setState( "cooking", false )
   self:setState( "resting", true )
   self:setState( "finished_cooking", true )

   self.cookCount = self.cookCount or 1
   for i = 1, self.cookCount do
      self.itemsManager:destroyItem( self.cookItem.id )
      self.itemsManager:addItem    ( ItemsData.getItemCookInfo( self.cookItem.name ).item )
   end
   self.cookCount = nil

   self.fx.fry:getPose():resetParent()
   self.fx.fry:stop()

   getScene():destroyEntity( self.cookingStick )
   getScene():destroyEntity( self.cookEntity )
   getScene():destroyEntity( self.cookEntityReady )

   self.cookEntity      = nil
   self.cookEntityReady = nil
   self.cookItem        = nil
   self.cookTimer       = nil

   -- self.animationsManager.loopAnimation(self.animations.sitbyfire.default)
end

function CMainCharacter:cook_()
   return self:getState( "cooking" )
end

function CMainCharacter:smoke_start( item )
   if ( self:getState( "resting" )) then return end
   self:setDisableActionStates( true )
   self:setState( "smoking", true )

   self:holsterWeapon()

   local anim = self.animations.idle.to.smoke
   self.animationsManager:loopAnimation(randChoice(self.animations.idle.default))
   self.animationsManager:playAnimation(anim)
   self.animationsManager:subscribeAnimationEventIn(anim, "smoking_blow", self.fx.smoking_smoke, self.fx.smoking_smoke.play )
   self.animationsManager:subscribeAnimationEnd(anim, self, self.smoke_stop )

   local smokeModel = ItemsData.getItemModel( item.name )
   self.smokeEntity = getScene():createEntity( smokeModel, "" )
   self.smokeEntity:getPose():setParent( self:getBonePose( "item_slot" .. self:getWeaponSlot() ) )
   self.smokeEntity:getPose():resetLocalPose()
   self.smokeEntity:getPose():setLocalPos( ItemsData.ItemsInfo[item.name].attachInfo.pos )

   runTimer(4.5, nil, function()
      getScene():destroyEntity( self.smokeEntity )
      self.smokeEntity = nil
      self.item = nil
   end, false)
end

function CMainCharacter:smoke_stop()
   self.fx.smoking_smoke:stop()
   self:setState( "smoking", false )
   self:setDisableActionStates( false )
end

function CMainCharacter:drink_start( item )
   self:setState( "drinking", true )
   self:setDisableActionStates( true )
   local anim
   if ( self:getState( "resting" )) then
      anim = self.animations.sitbyfire.drink
   else
      anim = self.animations.idle.drink.default
      self.animationsManager:loopAnimation(randChoice(self.animations.idle.default))
   end
   self.animationsManager:playAnimation(anim)
   self.animationsManager:subscribeAnimationEnd(anim, self, self.drink_stop )

   self:holsterWeapon()

   local drinkModel = ItemsData.getItemModel(item.name)
   self.drinkEntity = getScene():createEntity( drinkModel, "" )

   self.drinkEntity:getPose():setParent( self:getBonePose( "item_slot" .. self:getWeaponSlot() ) )
   self.drinkEntity:getPose():resetLocalPose()
   -- self.drinkEntity:getPose():setLocalRotQuat( quatFromEuler({x=-20}) )
   self.drinkEntity:getPose():setLocalPos( ItemsData.ItemsInfo[item.name].attachInfo.pos )
end

function CMainCharacter:drink_stop()
   self:setState( "drinking", false )
   self:setState( "finished_drinking", true )

   getScene():destroyEntity( self.drinkEntity )

   self.drinkEntity = nil
   self.drinkItem = nil
   if self:getState( "resting" ) then
      self:setState( "blockItemUse", false )
      self:setState( "disableInteraction", false )
   else
      self:setDisableActionStates( false )
   end
end


function CMainCharacter:eat_start( item )
   self:setState( "eating", true )
   self:setDisableActionStates( true )
   local anim
   if ( self:getState( "resting" )) then
      anim = self.animations.sitbyfire.eat
   else
      anim = self.animations.idle.eat.default
      self.animationsManager:loopAnimation(randChoice(self.animations.idle.default))
   end
   self.animationsManager:playAnimation(anim)
   self.animationsManager:subscribeAnimationEnd(anim, self, self.eat_stop )
   self.animationsManager:subscribeAnimationEventIn(anim, "eat_stop", self, self.onEatStopEventIn)

   self:holsterWeapon()

   local eatModel = ItemsData.getItemModel(item.name)
   local texture = ItemsData.getItemTexture(item.name)
   if eatModel then
      self.eatEntity = getScene():createEntity( eatModel, "" )
      if texture then
         self.eatEntity:setTexture(0, texture)
      end

      self.eatEntity:getPose():setParent( self:getBonePose( "item_slot" .. self:getWeaponSlot() ) )
      self.eatEntity:getPose():resetLocalPose()
      self.eatEntity:getPose():setLocalScale( {x=0.6,y=0.6,z=0.6})
   end
end

function CMainCharacter:onEatStopEventIn()
   if self.eatEntity then
      getScene():destroyEntity( self.eatEntity )
      self.eatEntity     = nil
   end
end

function CMainCharacter:eat_stop()
   self:setState( "eating", false )
   self:setState( "finished_eating", true )

   if self.eatEntity then
      getScene():destroyEntity( self.eatEntity )
      self.eatEntity = nil
   end
   self.eatItem = nil
   if self:getState( "resting" ) then
      self:setState( "blockItemUse", false )
      self:setState( "disableInteraction", false )
   else
      self:setDisableActionStates( false )
   end
end

function CMainCharacter:interact_start()
   if ( self:getState("talk") ) then
      self:animatedMoveEvent( "idle", nil )
   else
      self:holsterWeapon()
      self.animationsManager:loopAnimation( self.animations.crouch.device )
   end
end

function CMainCharacter:interactStart()
   self:interactStopTimer()

   --log( "Interact Start: ".. self.interactType )

   if ( self.interactType == "activate" ) then
      log( "Activating" )

      if ( self.interactTime > 0 ) then
         questSystem:fireEvent("start_activate", self.interactTarget:getName(), self.interactTarget)
         self:setState( "interacting", true )

         gameplayUI:showInteractProgress( "Interacting", self.interactTime )

         self.interactTimer = runTimer( self.interactTime, self,  function ( obj )
            if ( obj.interactTarget.activate ) then
               obj.interactTarget:activate( obj )
            end
            obj:interactStop()
         end, false )
      else
         if ( self.interactTarget.activate ) then
            self.interactTarget:activate( self )
         end
         self:interactStop()
      end

   elseif ( self.interactType == "deactivate" ) then
      log( "Deactivating" )

      if ( self.interactTarget.deactivate ) then
         self.interactTarget:deactivate( self )
      end

      self:interactStop()

   elseif ( self.interactType == "drop" ) then
      if ( self.interactTime > 0 ) then
         self:setState( "interacting", true )

         gameplayUI:showInteractProgress( "Installing", self.interactTime )

         self.interactTimer = runTimer( self.interactTime, nil,  function ()
            local target = self.interactTarget
            self.interactTarget:OnAltActivate()
            gameplayUI:showInventoryPickInfo( target:getLabel() .. " was removed from Inventory" )
            self.itemsManager:destroyItem( target.id )
            self:interactStop()
         end, false )
      else
      -- drop item
      end

   elseif ( self.interactType == "pick" ) then
      if self.interactTarget.itemType and ItemsData.isItemAlive(self.interactTarget.itemType) and not self.interactTarget:getState("dead") and self:getInventory():isItemsAliveLimit() then
         gameplayUI:showInventoryPickInfo( "Can't add to Inventory (Limit reached)" )
         return
      end
      self.animationsManager:stopAnimations()
      self:setState( "picking", true )
      if isDebug("fastLoot") or self:getState( "inAir" ) then
         self:onObjectTakenEventIn()
         self:onPickupAnimationEnd()
      else
         self:setDisableActionStates( true )
         local difference = self.interactTarget:getPose():getPos().y - self:getPose():getPos().y
         if difference > 130 then
            self.pickupAnimation = self.animations.idle.to.takeobjectfast_top
         elseif difference > 70 then
            self.pickupAnimation = self.animations.idle.to.takeobjectfast_table
         else
            self.pickupAnimation = self.animations.idle.to.takeobjectfast
         end

         self.animationsManager:loopAnimation( self.pickupAnimation )
         self.animationsManager:subscribeAnimationEventIn( self.pickupAnimation, "obj_taken", self, self.onObjectTakenEventIn )

         if self.pickupTimer then
            self.pickupTimer:stop()
            self.pickupTimer = nil
         end
         self.pickupTimer = runTimer(0.85, self, self.onPickupAnimationEnd, false )
      end
   elseif ( self.interactType == "talk" ) then
      self:startTalk(self.interactTarget)
      self:interactStop()
   end
end

function CMainCharacter:onObjectTakenEventIn()
   if not self.interactTarget then
      return
   end

   local item
   local res  = nil
   local itemCount
   local countText = ""
   if ( self.interactTarget.isItem ) then
      item = self.interactTarget
      itemCount = item.count
      res  = self.itemsManager:addItemObj( self.interactTarget )
   else
      item = self.interactTarget:getAsItem()
      if item then
         itemCount = item.count
         res  = self.itemsManager:addItemObj( item )
      end
   end
   if itemCount then
      countText = string.format("(%d)", itemCount)
   end
   if ( res ) then
      gameplayUI:showInventoryPickInfo( item:getLabel() .. countText  .. " was added to Inventory")
   else
      gameplayUI:showInventoryPickInfo( "Can't add to Inventory (Limit reached)" )
   end
end

function CMainCharacter:onPickupAnimationEnd()
   self:setState( "picking", false )
   self:setDisableActionStates( false )
   self:interactStop()
   self.animationsManager:clearCallbacks( self.pickupAnimation )
   if self.pickupTimer then
      self.pickupTimer:stop()
      self.pickupTimer = nil
   end
end

function CMainCharacter:interactStop()
   log("Interact Stop")
   self:interactStopTimer()

   gameplayUI:hideInteractProgress()

   self.interactTarget = nil
   self.interactInterruptCB = nil

   self:setState ( "interacting", false )
end

function CMainCharacter:interactStopTimer()
   if ( self.interactTimer ) then
      self.interactTimer:stop()
      self.interactTimer = nil
   end
end

function CMainCharacter:interact_()
   return self:getState( "interacting" ) or self:getState( "talk" )
end

function CMainCharacter:startAiming()
   self:setState("aiming", true)
   if self:canAttack() then
      self:startHipFire( 0.5 )
   end
end

function CMainCharacter:stopAiming()
   self:setState("aiming", false)
   self:stopHipFire( 5 )
end

function CMainCharacter:startHipFire( speed )
   local currentWeapon = self:getWeaponSlotItem()
   if self:getState("reloading") or not currentWeapon or (currentWeapon and not currentWeapon:isRangedWeapon()) then return end
   self:setState("hipFire", true)
   if self.aimAnimation then
      self.animationsManager:loopAnimationDelay( self.aimAnimation, speed )
   end
   self:stopHipFire( 5 )
end

function CMainCharacter:stopHipFire( delay, force )
   delay = delay or 0
   if self.hipFireTimer then
      self.hipFireTimer:stop()
   end
   self.hipFireTimer = runTimer( delay, nil, function()
      self.hipFireTimer = nil
      if force or not self:getState("aiming") and not self:getState("reloading") then
         self:setState("hipFire", false)
      end
   end, false )
end

function CMainCharacter:tryShoulder( delay )
   delay = delay or 0
   self:stopShoulderTimer()
   self.shoulderTimer = runTimer( delay, nil, function()
      if self:canInteract() and self:canAttack()
         and self:canMove() and self:canJump()
         and self.shoulderAnimation then
         self.animationsManager:loopAnimation( self.shoulderAnimation )
      end
   end, false)
end

function CMainCharacter:stopShoulderTimer()
   if self.shoulderTimer then
      self.shoulderTimer:stop()
      self.shoulderTimer = nil
   end
end

-- animations
function CMainCharacter:animatedMoveEvent( moveType, dirType )
   if ( not CPlayer.animatedMoveEvent( self, moveType, dirType ) ) then
      return false
   end

   if self:getState( "sliding" ) or self:getState( "gathering" ) or self:getState( "picking" )
      or self:getState("knockout") or self:getState("sleepAtBed") or self:getState("falling") then return false end

   local animations   = nil
   local animationSet = self.itemsManager:getSlotAnimationSet( self.parameters.weaponSlotId )
   local jumpAnims    = nil
   local attackAnims  = nil
   local reloadAnims  = nil
   local currentWeapon = self:getWeaponSlotItem()

   local default = false

   self:stopShoulderTimer()

   if ( not self.animations[moveType] ) then
      return false
   else
      if ( not self.animations[moveType][dirType] or not dirType ) then
         animations = self.animations[ moveType ][ animationSet ]
         if ( not animations ) then
            animations = self.animations[ moveType ][ "default" ]
            default = true
         end
         jumpAnims   = self.animations[ moveType ]["jump"]
         attackAnims = self.animations[ moveType ]["attack"]
         reloadAnims = self.animations["reload"][ moveType ]
      else
         animations = self.animations[ moveType ][ dirType ][ animationSet ]
         if ( not animations ) then
            animations = self.animations[ moveType ][ dirType ][ "default" ]
            default = true
         end
         jumpAnims   = self.animations[ moveType ][ dirType ]["jump"]
         attackAnims = self.animations[ moveType ][ dirType ]["attack"]
         reloadAnims = self.animations["reload"][ moveType ]
      end
   end

   local animation = animations

   if ( type(animations) == "table" ) then
      if (default) then
         animation = randChoice(animations)
      else
         animation = animations[1]
      end
   end

   if jumpAnims then
      self.animations.jump = jumpAnims[animationSet]
      if not self.animations.jump then
         self.animations.jump = jumpAnims["default"]
      end
   end

   if ( self:getState("swimming") ) then
      if moveType == "idle" then
         animation = self.animations.swim.idle
      elseif moveType == "walk" or moveType == "run" or moveType == "sprint" then
         animation = self.animations.swim[dirType]
      end
   elseif self:getState("crouch") then
      animation = self.animations.crouch.default
   elseif self:getState("jumping") then
      animation = self.animations.jump
   end

   --log( "event type = " .. eventType )
   -- aim animation processing
   if ( animations and type(animations) == "table" and not default
         and not self:getState("swimming") and not self:getState("jumping")
         and currentWeapon:isRangedWeapon() ) then
      self.loopAnimation = animations[1]
      self.aimAnimation  = animations[#animations]
      self.shoulderAnimation = animations[2]

      if self:getState("hipFire") then
         animation = self.aimAnimation
      else
         animation = self.loopAnimation
         if moveType == "idle" then
            self:tryShoulder( 5 )
         end
      end
   else
      self:stopHipFire( 0 )
      self.loopAnimation = animation
      self.aimAnimation  = nil
   end

   --log(animation)
   if not self:getState("reloading") or self:getState("reloading") and currentWeapon:getReloadAnimations() ~= "shotgun1" and currentWeapon:getReloadAnimations() ~= "carbine" then
      self.animationsManager:loopAnimation( animation )
      if type(animation) ~= "table" then
         self.animationsManager:subscribeAnimationEventIn(animation, "step", self, self.onStepEventIn)
      end
   elseif self:getState("reloading") and currentWeapon:getReloadAnimations() == "shotgun1" or currentWeapon:getReloadAnimations() == "carbine" then
      if not string.find(animation, "idle" ) then
         self:reloadEnd()
         self.animationsManager:stopAnimations()
         self.animationsManager:loopAnimation( animation )
      end
   end


   if ( attackAnims ) then
      self.animations.attack = attackAnims[ animationSet ]
      self.animations.attackAlt = attackAnims.melee_alt
      if animationSet == "boxing" and attackAnims.boxing_alt then
         self.animations.attackAlt = attackAnims.boxing_alt
      end

      if ( not self.animations.attack ) then
         self.animations.attack = attackAnims[ "default" ]
      elseif type(self.animations.attack) == "table" then
         self.animations.attack = randChoice(self.animations.attack)
      end
      if type(self.animations.attackAlt) == "table" then
         self.animations.attackAlt = randChoice(self.animations.attackAlt)
      end
   end

   if ( reloadAnims and currentWeapon ) then
      if currentWeapon:getReloadAnimations() then
         if currentWeapon:getReloadAnimations() == "shotgun1" or currentWeapon:getReloadAnimations() == "carbine" then
            self.animations.currentReloadAnim = self.animations["reload"].idle[ currentWeapon:getReloadAnimations() ]
         else
            self.animations.currentReloadAnim = reloadAnims[ currentWeapon:getReloadAnimations() ]
         end
      else
         self.animations.currentReloadAnim = "device__left.caf"
      end
   end

   return true
end

function CMainCharacter:onStepEventIn()
   for k, v in pairs(self.triggers) do
      if v.metalSteps then
         local metalSteps = {"step_metal_1.wav",
            "step_metal_2.wav",
            "step_metal_3.wav",
            "step_metal_4.wav",
            "step_metal_5.wav",
            "step_metal_6.wav",
            "step_metal_7.wav",
            "step_metal_8.wav", }
         if ( not self.metalStepsList ) then
            self.metalStepsList = {}
         end
         local wavName = randChoice(metalSteps)
         local wavAspect = self.metalStepsList[wavName]
         if not wavAspect then
            wavAspect = self:createAspect( wavName )
            wavAspect:getPose():setParent( self:getPose() )
            wavAspect:getPose():resetLocalPose()
            wavAspect:setLoop( false )
            wavAspect:setVolume( 0.15 )
            self.metalStepsList[wavName] = wavAspect
         end
         wavAspect:play()
         break
      end
   end
end

function CMainCharacter:animatedEvent( eventType )
   if ( not CPlayer.animatedEvent( self, eventType ) ) then
      return false
   end

   if ( not self.animations[eventType] ) then
      return false
   end
   --log( "event = " .. eventType )

   if ( eventType == "attack" or eventType == "attackAlt" ) then
      if ( self.itemsManager:getSlotItem(self.parameters.weaponSlotId) == nil ) then
         return false
      end

      local currentWeapon = self.itemsManager:getSlotItem( self.parameters.weaponSlotId )
      local anim = self.animations.attack

      --TODO:FIXME: Figure out why attack event sometimes sent before self.animations.attack assign
      if not anim or anim == "" then return end

      if eventType == "attackAlt" and currentWeapon:isMeleeWeapon() then anim = self.animations.attackAlt end

      if ( currentWeapon ) then
         if ( self:getState("reloading") and currentWeapon.magazine == 0 ) then
            return false
         elseif self:getState("reloading") then
            self:reloadEnd()
         end
         self:startHipFire( 0.01 )

         if ( self.itemsManager:isWeapon(currentWeapon.name) ) then
            self.attackAnimationTimeStart = getGameTime()
            if currentWeapon:isRangedWeapon() and currentWeapon.magazine == 0 then
               if getGameOption( "autoReload" ) then
                  self:onReloadGun()
                  return false
               else
                  if getGlobalParam("firstTimeReloading") then
                     setGlobalParam("firstTimeReloading", false)
                     gameplayUI:setupAnnoyingHint( string.format("Press '%s' to reload", getButtonCurrentKeyName("RELOAD") ), "reloading" )
                  end
                  runTimer(0.2, self, self.onAttackAnimationStop, false)
               end
            elseif currentWeapon:getWeaponType() == "energy" and currentWeapon.energyCost > self:getStatCount("energy") then
               runTimer(0.2, self, self.onAttackAnimationStop, false)
            else
               self.animationsManager:playAnimation       ( anim )
               self.animationsManager:subscribeAnimationEnd( anim, self, self.onAttackAnimationStop )
            end

            self:setState( "disableInteraction", true )
            self:setState( "disableAttack", true )
            self:setState( "blockItemUse", true )
            if self.safeDisableAttackTimer == nil then
               self.safeDisableAttackTimer = runTimer(5, nil, function()
                  self:setState( "disableAttack", false )
                  self:setState("disableMove", false)
                  self:setState( "blockItemUse", false )
                  self:setState( "disableInteraction", false )
               end, false)
            end
         end

         if currentWeapon:isMeleeWeapon() then
            self:setState( "disableJump", true )
            self:setState( "disableInteraction", true )
            if not string.find(anim, "__") then
               self:setState( "disableMove", true )
            end
            self.animationsManager:subscribeAnimationEventIn( anim, "attack", self, self.onAttackAnimationIn )
            self.animationsManager:subscribeAnimationEventOut( anim, "attack", self, self.onAttackAnimationOut )
         elseif currentWeapon:isRangedWeapon() then
            runTimer(0.05, nil, function()
               currentWeapon:OnActivate()
               self:spendStat( "stamina", "staminaRangeAttackCost", true )
            end, false)
         else
            currentWeapon:OnActivate()
         end
      end

   elseif ( eventType == "land" ) then
      if self.deltaLandingSpeed > 0 and not self.god_mode then
         self:setState( "landing", true )
         self:setDisableActionStates( true )
         local function landingEnd(self)
            self:setState( "landing", false )
            self:setDisableActionStates( false )
         end

         local fallDamage = scaleValue(self:getStatCount("healthMax"), self.deltaLandingSpeed, self.parameters.maxLandingSpeed)
         local anim
         local animationSet = self.itemsManager:getSlotAnimationSet( self.parameters.weaponSlotId )
         if fallDamage <= 50 then
            anim = self.animations.land.default[animationSet] or self.animations.land.default.default
         else
            anim = self.animations.land.hard[animationSet] or self.animations.land.hard.default
         end
         self.animationsManager:playAnimation( anim )
         self.animationsManager:subscribeAnimationEnd(anim, self, landingEnd)
      end
   elseif ( eventType == "jump" ) then
      self.animationsManager:stopAnimation( self.animations.jump )
      self:spendStat( "stamina", "staminaJumpCost", true )
      self.sounds.jump:play()
   elseif ( eventType == "hit" ) then
      self.animationsManager:playAnimation( self.animations.hit.default )
   elseif ( eventType == "die" ) then
      if ( self.hipFireTimer ) then
         self.hipFireTimer:stop()
         self.hipFireTimer = nil
      end

      -- self.animationsManager:loopAnimation( self.animations.idle.default[1] )
      self.animationsManager:playAnimationWithLock( self.animations.die.default )
   end

   return true
end

function CMainCharacter:onDeath(self)
   self.sounds.death:play()
   gameplayUI:closeUI()
   runTimer(3, nil, function()
      if gameplayUI:isGameplayRootWindow() and not isEditor() then
         setUserControl( false )
         gameplayUI:showCursor()
         confirmMessage( gameplayUI.wndGameplay, function()
            pauseGame()
            saveGameMenu()
         end, function()
            exitLocation()
         end, "load a game" )
      end
   end, false)
end

function CMainCharacter:onAttackAnimationIn()
   self.itemsManager:getSlotItem( self.parameters.weaponSlotId ):OnActivate()
   self:spendStat( "stamina", "staminaMeleeAttackCost", true )
end

function CMainCharacter:onAttackAnimationOut()
   local item = self.itemsManager:getSlotItem( self.parameters.weaponSlotId )
   if item then
      item:OnDeactivate()
   end
end

function CMainCharacter:onAttackAnimationStop()
   local attackAnimationTimeElapsed = math.min(getGameTime() - self.attackAnimationTimeStart, 2)
   local item = self.itemsManager:getSlotItem( self.parameters.weaponSlotId )
   if item then
      item:OnDeactivate()
   end

   self:setDisableActionStates( false )
   self:setState( "disableAttack", true )

   local coolDownTime = self.itemsManager:getSlotCoolDown(self.parameters.weaponSlotId)
   coolDownTime = math.max(0, coolDownTime - attackAnimationTimeElapsed)

   runTimer( coolDownTime, self, self.coolDown, false )
end

function CMainCharacter:onStartMessage()
   self.animationsManager:loopAnimation( randChoice(self.animations.talk.default) )
end

function CMainCharacter:onStopMessage()
   self.animationsManager:loopAnimation( randChoice(self.animations.idle.default) )
end

function CMainCharacter:startAnimatedGathering( obj, toolPrefab )
   if not gameplayUI:isBillboardVisible() then
      gameplayUI:setupBillboard("Gathering", "Press 'Activate' to stop")
   end
   self:holsterWeapon()
   self:setDisableActionStates( true )
   self:setState( "disableInteraction", false ) --so it could be cancelled by player
   self:setState( "gathering", true )
   self:setState( "waitGatherFinish", false )
   self.gatherObj = obj
   if toolPrefab and not self.toolEntity then
      self.toolEntity = getScene():createEntity( toolPrefab, "" )
      if self.toolEntity then
         self.toolEntity:getPose():setParent( self:getBonePose( "item_slot" .. self:getWeaponSlot() ))
         self.toolEntity:getPose():resetLocalPose()
      end
   end
end

function CMainCharacter:tryStopAnimatedGathering( forced )
   if self.gatherObj:getActivationsLeft() <= 0 or forced then
      self.animationsManager:clearCallbacks( self.gatherAnimation )
      self:setDisableActionStates( false )
      self:setState( "gathering", false )
      self:setState( "waitGatherFinish", false )
      self.toolEntity = hlp.safeDestroyEntity( self.toolEntity )
      self.gatherObj = nil
      gameplayUI:hideBillboard()
   else --For player to be able to cancel it again
      self:setState( "disableInteraction", false )
   end
end

function CMainCharacter:forceStopGathering( onHit )
   if not onHit then
      self.animationsManager:stopAnimations()
   end
   self:tryStopAnimatedGathering( true )
end

function CMainCharacter:startDigging( obj )
   self:startAnimatedGathering( obj, "shovel.sbg" )
   self.animationsManager:loopAnimation( self.animations.dig.default )

   local function onDustEventIn()
      self.fx.digging_dust:play()
      runTimer(2, nil, function() self.fx.digging_dust:stop() end, false)
   end

   local function onDigEventIn()
      self:setState( "waitGatherFinish", true )
      self:setState( "disableInteraction", true )
      self.gatherObj:onDigDone()
   end

   self.gatherAnimation = self.animations.dig.default
   self.animationsManager:subscribeAnimationEventIn( self.gatherAnimation, "dust", self, onDustEventIn )
   self.animationsManager:subscribeAnimationEventIn( self.gatherAnimation, "dig", self, onDigEventIn )
   self.animationsManager:subscribeAnimationEventIn( self.gatherAnimation, "end", self, self.tryStopAnimatedGathering )
end

function CMainCharacter:startMining( obj )
   local prefabName = obj:getPrefabName()
   if obj:getPose():getPos().y - self:getPose():getPos().y > 50
      or prefabName == "shard_4.sbg"
      or prefabName == "shard_5.sbg"
      or prefabName == "shard_6.sbg" then
      self.gatherAnimation = self.animations.mine.front
   else
      self.gatherAnimation = self.animations.mine.down
   end
   self:startAnimatedGathering( obj, "pickaxe.sbg" )
   self.animationsManager:loopAnimation( self.gatherAnimation )

   local function onMiningHit()
      self:setState( "waitGatherFinish", true )
      self:setState( "disableInteraction", true )
      local timesMined = getGlobalParam("timesMined") + 1
      setGlobalParam("timesMined", timesMined)
      local skillUp = 0
      if timesMined == 10 then
         skillUp = 2
      elseif timesMined == 20 then
         skillUp = 5
      elseif timesMined == 30 then
         skillUp = 10
      end
      self.skillsManager:inc( "mining", skillUp )

      self:playSound("mining_success_" .. math.random(1,3) .. ".wav")
      self:playSound("pickaxe_mining_" .. math.random(1,3) .. ".wav")

      if self.gatherAnimation == self.animations.mine.front then
         self.fx.antigrav_hit:getPose():setLocalPos({x=35,y=120,z=-135})
         self.fx.antigrav_hit:play()
      else
         self.fx.antigrav_hit:getPose():setLocalPos({x=20,y=0,z=-135})
         self.fx.antigrav_hit:play()
      end

      local skill = getPlayer().skillsManager:get( "mining" )
      local count = obj.fertility + math.random(-2,2) + (obj.fertility + 1) * math.floor(skill/15)
      count = math.max(count, obj.fertility)
      addItemsToPlayer("antigravium_shards.itm", count)

      if not obj.crystalMined and skill * ( 0.5 + obj.fertility/10 ) >= math.random(1, 100) then
         addItemsToPlayer("antigravium.itm", 1)
         obj.crystalMined = true
      end
      obj.resource = obj.resource - 1
      obj:onMiningHit()
   end

   self.animationsManager:subscribeAnimationEventIn( self.gatherAnimation, "hit", self, onMiningHit )
   self.animationsManager:subscribeAnimationEventIn( self.gatherAnimation, "end", self, self.tryStopAnimatedGathering )
end

function CMainCharacter:coolDown()
   if self.safeDisableAttackTimer then
      self.safeDisableAttackTimer:stop()
      self.safeDisableAttackTimer = nil
   end
   self:setState( "disableAttack", false )
end

function CMainCharacter:holsterWeapon()
   local weapon = self:getWeaponSlotItem()
   if weapon then
      local fastSlot = getKeyByValue(self.fastAccessSlots, weapon:getItemName())
      self.itemsManager:unequipSlot( self.parameters.weaponSlotId )
      if weapon:isWeapon() then
         if fastSlot then
            self.itemsManager:equipSlotWithItem( fastSlot, weapon.id )
         else
            --AUTOASSIGN TO EMPTY SLOTS
            if weapon:getAnimations() == "pistol" then
               fastSlot = 6
            elseif weapon:getAnimations() == "melee_low" then
               fastSlot = 5
            elseif weapon:getAnimations() == "shotgun" or weapon:getAnimations() == "carbine" then
               if self.fastAccessSlots[3] and not self.fastAccessSlots[4] then
                  fastSlot = 4
               else
                  fastSlot = 3
               end
            end
            if fastSlot and not self.itemsManager:getSlotItem( fastSlot ) then
               self.itemsManager:equipSlotWithItem( fastSlot, weapon.id )
               self.fastAccessSlots[fastSlot] = weapon:getItemName()
            end
         end
      end
   end
   gameplayUI:setStatisticsCombat( nil )
   self:stopHipFire( 0, true )
end

function CMainCharacter:OnHotbarItemClick( index )
   gameplayUI:updateImmersiveUITimeRef( "ammo" )
   local item = self.itemsManager:getItemById( gameplayUI:getHotbarItemIdInSlot( index ) )
   self:useItem( item )
   gameplayUI:updateAllHotbarItems()
end

function CMainCharacter:useItem( item )
   if self:getState( "blockItemUse" ) then return end

   if item and item ~= self:getWeaponSlotItem() then
      local itemName = item:getItemName()
      if item:isWeapon() then
         if self:getState("resting") then return end
         self:holsterWeapon()
         local fastSlot = getKeyByValue(self.fastAccessSlots, itemName)
         if fastSlot then
            self.itemsManager:unequipSlot( fastSlot, true )
         else
            --Automatically equip into preferred fastslot
            --Equip into preferred slot from the filtertable or into empty back slots, or into the left one.
            local autoFastSlot = getKeyByValue(gameplayUI.fastSlotsFilter, item:getAnimations())
            if not autoFastSlot and itemName ~= "hand_to_hand.wpn" then
               if self.fastAccessSlots[3] and not self.fastAccessSlots[4] then
                  autoFastSlot = 4
               else
                  autoFastSlot = 3
               end
            end
            if autoFastSlot then
               self.itemsManager:unequipSlot( autoFastSlot, true )
               gameplayUI:setItemToFastAccessSlot( autoFastSlot, item )
            end
         end

         self.itemsManager:equipSlotWithItem( self.parameters.weaponSlotId, item.id )
         self:startHipFire( 0.01 )

         self.lastWeapon = item
         gameplayUI:setStatisticsCombat( item )
      elseif item:isEquipable() then
         if ( item.name == "scanner.itm" and item.equipped ) or itemName == "scanner_broken.itm" then
            self:runScanWave()
         elseif not item.equipped then
            --For misc items that for some reason we have enabled equipping for
            local slotID = item:getAttireType() or 1
            if slotID == 1 then
               self:holsterWeapon()
            end
            self.itemsManager:equipSlotWithItem( slotID, item.id )
         end
      elseif item:isMap() or item:isMessage() or item:getInvCategory() == "drawing" then
         item:OnActivate()
      elseif item:isConsumable() then
         self:useConsumable( item )
      end
   end

   self.itemsManager:updateInventoryUI()
end

function CMainCharacter:useConsumable( item )
   if item:isFood() then
      self:eat_start( item )
   elseif item:isDrink() then
      self:drink_start( item )
   elseif item:isSmokable() then
      self:smoke_start( item )
   end

   local foodInfo = ItemsData.getItemFoodInfo( item.name )
   if foodInfo then
      local t = { changeStats = foodInfo, duration = 2, name = "food", label = item:getLabel(), refresh = true}
      self.statusEffectsManager:addStatusEffect( t )
   end

   local buffInfo = ItemsData.getItemPermaBuffInfo(item.name)
   if buffInfo then
      local t = { name = item:getItemName(), label = item:getLabel(),
                  saved = true, stackable = true,
                  statBonuses = buffInfo,
            }
      self.statusEffectsManager:addStatusEffect( t )
   end

   local useEffects = item:getUseEffects()
   if useEffects then
      for name,effect in pairs( useEffects ) do
         effect = tableDeepCopy( effect )
         effect.name = name
         effect.label = effect.label or item:getLabel() .. " - " .. miscLabels.getLabel( name )
         self.statusEffectsManager:addStatusEffect( effect )
      end
   end

   self.itemsManager:destroyItem( item.id )
end

function CMainCharacter:nextWeapon()
   CPlayer.nextWeapon(self)
end

function CMainCharacter:prevWeapon()
   CPlayer.prevWeapon(self)
end

function CMainCharacter:interactObject( intType, intObject, interruptCB )
   self.interactType        = intType
   self.interactTarget      = intObject
   self.interactInterruptCB = interruptCB

   --log( "Interact Type: " .. intType )

   self.interactTime = 0

   if ( intObject.getInteractTime ) then
      self.interactTime = intObject:getInteractTime( intType )
   end

   self:interactStart()
end

function CMainCharacter:preActivateObject()
   local interactor = gameplayUI:getFocusObj()

   if ( interactor ) then
      if ( interactor.getType and (interactor:getType() == "activator" or interactor:getType() == "turret") and interactor.isActivated and interactor:isActivated() ) then
         self:interactObject( "deactivate", interactor, nil )

      elseif ( interactor.getType and interactor:getType() == "talker" ) then
         self:interactObject( "talk", interactor, nil )

      elseif ( interactor.getType and interactor:getType() == "turret" ) then
         self:interactObject( "activate", interactor, function ( obj ) obj:interactObject( "activate", obj.interactTarget, nil ) end )

      elseif ( interactor.getType and interactor:getType() == "pickup" ) then
         self:interactObject( "pick", interactor, nil )

      elseif ( interactor.getType and interactor:getType() == "activator" ) then
         self:interactObject( "activate", interactor, nil )
      end

   elseif ( self:getWeaponSlotItem() and self:getWeaponSlotItem():hasAltActivation() ) then
      self:interactObject( "drop", self:getWeaponSlotItem(), nil )
   end
end

function CMainCharacter:activateObject()
   if ( self:activateInterrupt() ) then
      return true
   end

   if ( gameplayUI:isInventoryVisible() ) then
      self:OnInventoryClose()
      return true
   end

   return false
end

function CMainCharacter:activateInterrupt()
   if ( self:getState( "interacting" ) ) then
      local callback = self.interactInterruptCB
      local target   = self.interactTarget

      self:interactStop()

      if ( callback ) then
         self.interactTarget = target
         callback( self )
         self.interactTarget = nil
      end
      return true
   end

   return false
end

function CMainCharacter:startControlObject( object, entityName, entityClass, cameraParams )
   if ( self.bugPlayer ) then
      return
   end

   if getGlobalParam("firstTimeBug") then
      runTimer(0, gameplayUI, gameplayUI.startBugHint, false)
   end

   self.objectUnderControl = object

   self:resetButtons()
   gameplayUI:closeUI()

   self:setState( "remoteControl", true )

   self.bugPlayer = getScene():createEntity( entityName, entityClass )

   if ( cameraParams ) then
      self.bugPlayer:setCameraHeight( cameraParams.height, 0 )
      self.bugPlayer:setCameraDist  ( cameraParams.dist  , 0 )
      self.bugPlayer:setCameraOffset( cameraParams.offset, 0 )
      self.bugPlayer:setCameraFov   ( cameraParams.fov   , 0 )
   end

   self.headLooking = false
   setPlayer( self.bugPlayer )

   self.bugPlayer:getPose():setPos( self.objectUnderControl:getPose():getPos() )
   self.bugPlayer:getPose():setRot( self:getPose():getRot() )
   self.bugPlayer:getCamera():getPose():setRot( self:getPose():getRot() )

   self.objectUnderControl:getPose():setParent( self.bugPlayer:getPose() )
   self.objectUnderControl:getPose():resetLocalPose()

   self.objectUnderControl:setVisible( false )
   self.objectUnderControl:setActive ( false )

   self.bugPlayer.ownerPlayer = self
end

function CMainCharacter:stopControlObject()
   log( "CMainCharacter:stopControlObject" )

   if ( not self.bugPlayer or not self.objectUnderControl ) then
      return
   end

   gameplayUI:stopBugHint()

   self.headLooking = true
   setPlayer( self )

   self.objectUnderControl:setVisible( true )
   self.objectUnderControl:setActive ( true )
   self.objectUnderControl:OnFree    ( self.bugPlayer:getPose() )
   self.objectUnderControl = nil

   getScene():destroyEntity( self.bugPlayer )
   self.bugPlayer = nil

   self:setState( "remoteControl", false )
end

function CMainCharacter:hasItem( name )
   local items = self.itemsManager:getItemsByName( name )

   if ( not items ) then
      return false
   end

   return true
end

function CMainCharacter:obtainItem( name, value )
   local item = self.itemsManager:addItem( name )

   if ( item ) then
      item:changeCount( value - 1 )
      self:updateAmmoGui()
      return item
   end
   return nil
end

function CMainCharacter:OnStuckIn()
end

function CMainCharacter:OnStuckOut()
end


function CMainCharacter:tryCancelActions( onHit )
   if self:getState("resting") then
      self:forceStopResting()
   elseif self:getState("gathering") then
      self:forceStopGathering( onHit )
   elseif self:getState("picking") then
      self:onPickupAnimationEnd()
   end
   self:tryCancelReloading()
end

function CMainCharacter:tryCancelReloading()
   if self:getState("reloading") and self:getState("disableMove") then
      self:reloadEnd()
      self.animationsManager:stopAnimations()
   end
end

-- ---------------------------------------------------------------------------------------
-- Dialogs' rootine
-- ---------------------------------------------------------------------------------------
function CMainCharacter:startTalk( char )
   if not char then
      return false
   end

   local name = char:getName()
   log("talk start with " .. tostring(name))
   if ( char:startTalk(self) ) then
      self.dialogTarget = char
      self.itemsManager:showInventory( false )
      gameplayUI:showCharacterWindow( false )

      self:setFeelVisible( false )
      self:setState( "talk", true )
      self:moveAndOrientate( self:getPose():getPos(), vec3Normalize( vec3Sub( char:getPose():getPos(), self:getPose():getPos() ) ), 0.5 )
      self:holsterWeapon()
      self:updateCamera()

      return true
   end

   log("talk start refused with " .. name)
   return false
end

function CMainCharacter:stopTalk( char )
   if self.dialogTarget then
      self.dialogTarget:stopTalk()
      self.dialogTarget = nil
   end
   self:setFeelVisible( true )
   self:setState( "talk", false )
   return true
end

function CMainCharacter:onStopDialog()
   self:stopTalk()
   self.animationsManager:stopAnimations()
end

function CMainCharacter:updateCamera()
   local currentWeapon = self:getWeaponSlotItem()
   local rangedMode = currentWeapon and currentWeapon:isRangedWeapon()
   local aimMode = self:getState("aiming") and (rangedMode or not currentWeapon)

   local camHeight = getDefaultPlayerCameraHeight()
   local camDist   = getDefaultPlayerCameraDistance()
   local camFov    = getDefaultPlayerCameraFov()
   local speed     = 0.25

   if ( aimMode ) then
      camDist = 100
      camFov = 45
      if self.rightShoulderAim then
         self:setCameraOffset( 53, 0.25 )
      else
         self:setCameraOffset( -47, 0.25 )
      end
   else
      if self.prevCamOffset == 3 and not rangedMode then
         camHeight = camHeight + 25
      end

      if ( terminalUI:isCursorVisible() ) then
         camHeight = 200
         camDist   = 90
         camFov    = 60
         speed     = 0.5
      elseif getGlobalParam("inScene") == "start_scene" then
         camHeight = 200
         camDist   = 350
         speed     = 8
      end

      if rangedMode then
         camDist = 130
         if self.rightShoulderAim then
            self:setCameraOffset( 53, 0.25 )
         else
            self:setCameraOffset( -47, 0.25 )
         end
      else
         self:setCameraOffset( self.prevCamOffset, speed )
      end
   end

   self:setCameraHeight( camHeight, speed )
   self:setCameraDist  ( camDist  , speed )
   self:setCameraFov   ( camFov   , speed )
end

function CMainCharacter:startTrade( char )
   self.exchangeTarget = char
   self:setFeelVisible( false )
   self:setState( "talk", true )
   self:setState( "trading", true )
   self:setState( "disableUI", true )
   self:setDisableActionStates( true )
   gameplayUI:clearTrade()
   gameplayUI:setupTradeInventory( char )
   gameplayUI:setupTradeInventory( self )
end

function CMainCharacter:stopTrade( char )
   self.exchangeTarget = nil
   self:setFeelVisible( true )
   self:setState( "talk", false )
   self:setState( "trading", false )
   self:setState( "disableUI", false )
   self:setDisableActionStates( false )
end


function CMainCharacter:restAtCamp( campObj )
   getScene():tryAutoSave()
   self:setState( "resting", true )
   self:setDisableActionStates( true )
   runTimer(1, nil, function()
      self:setState( "blockItemUse", false )
      self:setState( "disableInteraction", false )
   end, false)

   local offset = vec3Add( vec3Mul( vec3Normalize( vec3Sub( self:getPose():getPos(), campObj:getPose():getPos() ) ), 120 ), campObj:getPose():getPos() )
   offset.y = offset.y + 10
   self:moveAndOrientate( offset, vec3Normalize( vec3Sub( campObj:getPose():getPos(), self:getPose():getPos() ) ), 0.5 )

   return true
end

function CMainCharacter:startSwim( swimTrigger )
   if swimTrigger then
      self.swimTrigger = swimTrigger
      self:setState( "disableAttack", true )
      self:setState( "blockItemUse", true )
      self:setState( "disableJump", true )
      self:setState( "swimming", true )
      self:holsterWeapon()
   end
end

function CMainCharacter:stopSwim( swimTrigger )
   self.swimTrigger = nil
   self:setState( "disableAttack", false )
   self:setState( "blockItemUse", false )
   self:setState( "disableJump", false )
   self:setState( "swimming", false )
end

function CMainCharacter:onReloadGun()
   local currentWeapon = self:getWeaponSlotItem()
   if not self:getState("reloading") and currentWeapon and currentWeapon.OnLoadGun then
      local anim = self.animations.currentReloadAnim
      if currentWeapon.activeAmmo and currentWeapon.magazine < currentWeapon.magazineMax then
         if getGlobalParam("firstTimeReloading") then
            setGlobalParam("firstTimeReloading", false)
         else
            gameplayUI:hideAnnoyingHint( "reloading" )
         end

         self:startHipFire( 0.01 )
         self:setState( "reloading", true )
         self:setState( "disableInteraction", true )
         self:setState( "blockItemUse", true )
         if currentWeapon:getReloadAnimations() == "shotgun1" or currentWeapon:getReloadAnimations() == "carbine" then
            self:setState( "disableMove", true )
            --self.animationsManager:stopAnimations() --DOES NOT HELP WITH LOOP ANIM STARTING FROM WRONG FRAMES
            self.animationsManager:playAnimation( anim[1] )
            self.animationsManager:subscribeAnimationEnd( anim[1], self, self.reloadLoop )
            self.animationsManager:loopAnimationDelay( anim[2], 0.38 ) --THIS IS WHAT KEEPS JACK FROM JUMPING TO IDLE_AIM
         else
            self.animationsManager:playAnimation( anim )
            self.animationsManager:subscribeAnimationEventIn( anim, "reload", self, self.reloadGun )
            self.animationsManager:subscribeAnimationEnd( anim, self, self.reloadEnd )
         end
      end
   end
end

function CMainCharacter:reloadGun()
   self:getWeaponSlotItem():OnLoadGun()

   local currentWeapon = self:getWeaponSlotItem()
   if currentWeapon:getReloadAnimations() == "shotgun1" or currentWeapon:getReloadAnimations() == "carbine" then
      if currentWeapon.activeAmmo and currentWeapon.magazine < currentWeapon.magazineMax then
         self:reloadLoop()
         return
      else
         self:reloadOut()
      end
   end
end

function CMainCharacter:reloadLoop()
   local anim = self.animations.currentReloadAnim
   self.animationsManager.animationCallbacks[anim[2]] = nil --For some reason event callbacks keep stacking with multiple reloads
   self.animationsManager:subscribeAnimationEventIn( anim[2], "reload", self, self.reloadGun )
end

function CMainCharacter:reloadOut()
   local anim = self.animations.currentReloadAnim
   self:setState( "waitReloadEnd", true )
   self.animationsManager:playAnimation( anim[3] )
   self.animationsManager:subscribeAnimationEnd( anim[3], self, self.reloadEnd )

   self.animationsManager:loopAnimation( self.aimAnimation )
end

function CMainCharacter:reloadEnd()
   local anim = self.animations.currentReloadAnim
   if type(anim) == "table" then
      self.animationsManager.animationCallbacks[anim[1]] = nil
      self.animationsManager.animationCallbacks[anim[2]] = nil --prevent stacking reload event subscriptions
      self.animationsManager.animationCallbacks[anim[3]] = nil
   else
      self.animationsManager.animationCallbacks[anim] = nil
   end
   self:setState( "blockItemUse", false )
   self:setState( "reloading", false )
   self:setState( "waitReloadEnd", false )
   self:setState( "disableMove", false )
   self:setState( "disableInteraction", false )
end

function CMainCharacter:climbLadder( ladderObj )
   if ladderObj then
      self:setDisableActionStates( true )
      self.ladderObj = ladderObj
      self:holsterWeapon()
      runTimer(0.1, self, function(self)
         self:setState( "climbing_ladder", true )
      end, false)

      local offset = localPointToWorld({x=0,y=0,z=-35}, ladderObj:getPose())
      local dir = vec3RotateQuat( {x=0,y=0,z=1}, self.ladderObj:getPose():getRotQuat() )

      self:moveAndOrientate( offset, dir, 0.1 )

      return true
   else
      return false
   end
end

function CMainCharacter:climbLadderDown( ladderObj )
   if ladderObj then
      self:setDisableActionStates( true )
      self.ladderObj = ladderObj
      self:holsterWeapon()
      runTimer(0.1, self, function(self)
         self:setState( "climbing_ladder_down", true )
      end, false)

      local myy = self:getPose():getPos().y - ladderObj:getPose():getPos().y
      local offset = localPointToWorld({x=0,y=myy,z=35}, ladderObj:getPose())
      local dir = vec3RotateQuat( {x=0,y=0,z=1}, self.ladderObj:getPose():getRotQuat() )
      self:moveAndOrientate( offset, dir, 0.1 )

      return true
   else
      return false
   end
end

function CMainCharacter:leaveCamp( campObj )
   if ( self:getState("cooking") or gameplayUI:isWaitingMode() ) then
      return false
   end

   self:setState( "resting", false )

   return true
end

function CMainCharacter:runScanWave()
   if ( self.scanWaveTimer or gameplayUI:isInventoryTurretVisible() or gameplayUI:isInventory2Visible() ) then
      return
   end

   if not hasPlayerItem("scanner.itm") and hasPlayerItem("scanner_broken.itm") then
      if ( not self.scanWaveSoundBroken ) then
         self.scanWaveSoundBroken = self:createAspect( "scan_broken.wav" )
         self.scanWaveSoundBroken:getPose():setParent( self:getPose() )
         self.scanWaveSoundBroken:getPose():resetLocalPose()
         self.scanWaveSoundBroken:getPose():setLocalPos( {x=0,y=100,z=0} )
         self.scanWaveSoundBroken:setLoop( false )
         self.scanWaveSoundBroken:setVolume( 0.15 )
         self.scanWaveSoundBroken:setDistance( 1000 )
      end

      self.scanWaveSoundBroken:play()
      return
   end

   if not self:spendStat( "energy", "energyScanCost", false ) then return end

   local breakQuestActive = getGlobalParam("scannerBreakQuestActive") and not isDebug("quest")
   local useTimes = getGlobalParam("scannerBreakQuestUseTimesLeft")
   if breakQuestActive and useTimes ~= nil then
      if useTimes > 0 then
         setGlobalParam("scannerBreakQuestUseTimesLeft", useTimes - 1)
      else
         setGlobalParam("scannerBreakQuestActive", false)
         if self.itemsManager:destroyItemByName("scanner.itm") then
            self.itemsManager:addItem("scanner_broken.itm")
            self.itemsManager:setToHotbarByName( 11, "scanner_broken.itm" )
            runTimer(0, nil, function()
               local esfx = self:createAspect("electro_shock.sps")
               esfx:getPose():setParent(self:getBonePose("LeftForeArmRoll"))
               esfx:getPose():resetLocalPos()
               esfx:disable()
               esfx:setLoop(false)
               esfx:play()
               local dmg = 5
               if self:getStatCount( "health" ) <= dmg then
                  dmg = 0
               end
               self:hit(dmg, nil)
            end, false)
            runTimer(1, nil, function () startQuest("broken_scanner") end, false)

            local scanWaveSoundBreaking = self:createAspect( "scan_breaks.wav" )
            scanWaveSoundBreaking:getPose():setParent( self:getPose() )
            scanWaveSoundBreaking:getPose():resetLocalPose()
            scanWaveSoundBreaking:getPose():setLocalPos( {x=0,y=100,z=0} )
            scanWaveSoundBreaking:setLoop( false )
            scanWaveSoundBreaking:setVolume( 0.15 )
            scanWaveSoundBreaking:setDistance( 1000 )
            scanWaveSoundBreaking:play()

            return
         end
      end
   end

   log( "---scan wave" )

   if ( not self.scanWaveSound ) then
      self.scanWaveSound = self:createAspect( "scan_wave.wav" )
      self.scanWaveSound:getPose():setParent( self:getPose() )
      self.scanWaveSound:getPose():resetLocalPose()
      self.scanWaveSound:getPose():setLocalPos( {x=0,y=100,z=0} )
      self.scanWaveSound:setLoop( false )
      self.scanWaveSound:setVolume( 0.15 )
      self.scanWaveSound:setDistance( 1000 )
   end

   self.scanWaveSound:play()

   if ( not self.scanWave ) then
      self.scanWave = self:createAspect( "scan_wave.sbg" )
      self.scanWave:setVisible( false )
   end

   local scanRadius = 2000
   local baseRadius = 200

   self:setHighlightsRadius( baseRadius )

   local pos = self:getPose():getPos()
   self.scanWave:getPose():setPos( {x=pos.x,y=pos.y+100,z=pos.z} )
   self.scanWave:getPose():setScale( {x=baseRadius,y=baseRadius,z=baseRadius} )
   self.scanWave:setVisible( true )

   self.scanWaveTimer = runTimerExt( 1/60, {obj=self, initRadius=baseRadius},
      function ( params )
         if ( params.obj.scanWaveTimer ) then
            local radius = params.initRadius + params.obj.scanWaveTimer:getTimeDuration() * (scanRadius-params.initRadius)

            params.obj.scanWave:getPose():setScale( {x=radius/100,y=radius/100,z=radius/100} )
            params.obj:setHighlightsRadius( radius )

            if ( params.obj.scanWaveTimer and params.obj.scanWaveTimer:getTimeLeft() == 0 ) then
               params.obj.scanWave:setVisible( false )
               params.obj:setHighlightsRadius( 0 )
               params.obj.scanWaveTimer = nil
            end
         end
      end, 1 )
end

function CMainCharacter:isDamageAllowed( charAttacker )
   if charAttacker and charAttacker:getScriptClass() == "CMainCharacterBug" then return false end
   return CCharacter.isDamageAllowed( self, charAttacker )
end

function CMainCharacter:hit( damage, charAttacker )
   if self:getState("dead") then return end

   CPlayer.hit( self, damage, charAttacker )

   self:tryCancelActions( true )
end

function CMainCharacter:die()
   self:OnInventoryClose()
   gameplayUI:showTrade( false )
   if self.dialogTarget then
      dialogSystem:stopDialog( nil )
   end
   CPlayer.die(self)
end

function CMainCharacter:OnTriggerEnter( trigger )
   if not isEditor() and not getGlobalParam("playedIntro") and trigger and trigger:getName() == "start_trigger" and not self:isTriggerVisited(trigger) then

   end
   oo.getsuper(CMainCharacter).OnTriggerEnter(self, trigger)
end

function CMainCharacter:addExp( value, silent )
   self.experience.current = self.experience.current + math.ceil(value * (getGlobalParam("expMultiplier") or 1))

   local lvls = 0
   while self.experience.current >= math.floor(self.experience.maxStarting * 1.5 ^ ( self.level + lvls - 1 )) do
      self.experience.current = self.experience.current - math.floor(self.experience.maxStarting * 1.5 ^ ( self.level + lvls - 1 ))
      lvls = lvls + 1
   end

   gameplayUI:updateStatisticsExperience()

   self:addLevels( lvls )

   if not silent and value > 0 then
      gameplayUI:showInfoTextEx( "Exp +" .. value, "minor", "" )
   end
end

function CMainCharacter:addLevels( value, silent )
   if value > 0 then
      if self.level == 1 and not self.loadedGame then
         gameplayUI:setupAnnoyingHint( string.format("You've got attribute points! Press '%s' to raise your stats.", getButtonCurrentKeyName("CHARACTER")), "AP" )
      end
      self.level = self.level + value
      self.experience.max = math.floor(self.experience.maxStarting * 1.5 ^ ( self.level - 1 ))

      self.attributePoints = self.attributePoints + value

      gameplayUI:updateStatisticsExperience()
      gameplayUI:updateStatisticsLevel()
      gameplayUI:setStatUpgradeButtonsDisabled( false )

      if not silent then
         gameplayUI:showInfoTextEx( "Reached level " .. self.level, "major", "game_lvlup.wav" )
      end
   end
end

function CMainCharacter:upgradeStat( statName )
   if self.attributePoints > 0 then
      self.attributePoints = self.attributePoints - 1
      self.assignedAttributes[statName] = self.assignedAttributes[statName] + 1
      local value = round( self.assignedAttributes[statName] * self.upgradeBonuses[statName] * hlp.CGParam("statsUpgradeBonusMul"):get() )
      if self.attributePoints <= 0 then
         gameplayUI:setStatUpgradeButtonsDisabled( true )
      end

      self:updateStat( statName )
      self:changeStatCount( statName:gsub("Max",""), value )
   end
end

function CMainCharacter:OnSaveState( state )
   state.dead = self:getState( "dead" )
   state.feelVisible = self:getFeelVisible()
   state.level = self.level
   state.experience = self.experience.current

   state.stats = {}
   for statName,v in pairs(self.stats) do
      if not v.base then
         state.stats[statName] = v.current
      end
   end

   local index = 1
   state.statusEffects = {}
   for _,effect in ipairs(self.statusEffectsManager.statusEffects) do
      if effect:isSaved() then
         state.statusEffects[index] = {}
         effect:OnSaveState( state.statusEffects[index] )
         index = index + 1
      end
   end

   state.inventory = self.itemsManager:serialize()
   state.attributePoints = self.attributePoints
   state.assignedAttributes = self.assignedAttributes
   state.fastAccessSlots = self.fastAccessSlots
   local hotbar = {}
   for i=1,#gameplayUI.hotbar.slots do
      local item = gameplayUI:getHotbarItemInSlot( i )
      if item then
         hotbar[i] = item.name
      end
   end
   state.hotbar = hotbar

   local wpn = self.itemsManager.slots[self.parameters.weaponSlotId]
   if wpn then
      state.weapon = wpn.name
   end
   state.initialStyle = self.initialStyle
   state.equippedAttire = {}
   for slotId,item in pairs(self.itemsManager.slots) do
      state.equippedAttire[slotId] = item.name
   end

   -- installations
   local inst = {}
   local any_inst = false
   for k,v in pairs(self.installations) do
      local class_name = nil
      if v.getScriptClass then
         class_name = v:getScriptClass()
      else
         for k2,v2 in pairs(InstallationData) do
            for k3,v3 in pairs(v2) do
               if k3 == v:getPrefabName() then
                  class_name = v3.type
               end
            end
         end
      end
      if class_name and v.OnSaveState then
         local save_state = {}
         v:OnSaveState(save_state)
         local data = {}
         data["type"] = v:getPrefabName()
         data["class"] = class_name
         data["state"] = save_state
         table.insert(inst, data)
         any_inst = true
      end
   end
   if any_inst then
      state.installations = inst
   end

   state.prevCamOffset = self.prevCamOffset
   state.rightShoulderAim = self.rightShoulderAim
end

function CMainCharacter:OnLoadState( state )
   self.loadedGame = true
   self.initialStyle = state.initialStyle
   self:setupAppearance(self.initialStyle)

   if state.statusEffects then
      for _,effectState in ipairs(state.statusEffects) do
         self.statusEffectsManager:addStatusEffect( effectState )
      end
   end

   if state.feelVisible ~= nil then
      self:setFeelVisible(state.feelVisible)
   end

   if state.level then
      self:addLevels( state.level - 1, true )
   end

   if state.experience then
      self:addExp( state.experience, true )
   end

   if state.attributePoints then
      for statName, timesUpgraded in pairs(state.assignedAttributes) do
         for i=1,timesUpgraded do
            self:upgradeStat( statName )
         end
      end
   end

   if state.stats then
      for statName,value in pairs(state.stats) do
         self:setStatCount( statName, value)
      end
   end

   if ( state.dead ) then
      self:die__()
      self:stopSounds()
   elseif state.inventory then
      self.itemsManager:deserialize(state.inventory)
      self:updateAmmoGui()
      if state.hotbar then
         for index,itemName in pairs(state.hotbar) do
            self.itemsManager:setToHotbarByName( index, itemName )
         end
      end

      if state.fastAccessSlots then
         self.fastAccessSlots = tableDeepCopy( state.fastAccessSlots )
      end

      if state.weapon then
         local wpn = self.itemsManager:getItemByName( state.weapon )
         if wpn then
            self:useItem(wpn)
         end
      end

      self:wearHair()
      if state.equippedAttire then
         for slotId, itemName in pairs(state.equippedAttire) do
            self.itemsManager:equipSlotWithItem( slotId, self.itemsManager:getItemByName(itemName).id, true )
         end
      end

      -- installations
      if state.installations then
         for _,v in pairs(state.installations) do
            if v.class then
               local obj = getScene():createEntity(v.type, v.class)
               if obj then
                  if obj.OnLoadState then
                     self:addInstallation(obj)
                     obj:setInstaller(self)
                     obj:OnLoadState(v.state)
                  else
                     getScene():destroyEntity(obj)
                  end
               end
            end
         end
      end
   end

   setDefaultPlayerCameraHeight( getGlobalParam( "camHeight" ) or self:getCameraHeight() )
   if state.prevCamOffset then self.prevCamOffset = state.prevCamOffset end
   if state.rightShoulderAim then self.rightShoulderAim = state.rightShoulderAim end
   self:updateCamera()
end

function CMainCharacter:getLabel()
   return "Jack"
end

function CMainCharacter:addInstallation(obj)
   local found = false
   for k,v in pairs(self.installations) do
      if v == obj then
         found = true
         break
      end
   end

   if not found then
      table.insert(self.installations, obj)
      if not self.loadedGame then
         questSystem:fireEvent("add_installation", obj:getScriptClass(), obj)
      end
   end
end

function CMainCharacter:removeInstallation(obj)
   local found = false
   local index = nil
   for k,v in pairs(self.installations) do
      if v == obj then
         found = true
         index = k
      end
   end

   if found and index then
      self.installations[index] = nil
      if not self.loadedGame then
         questSystem:fireEvent("remove_installation", obj:getScriptClass(), obj)
      end
   end
end

return {CMainCharacter=CMainCharacter}
