local DT_MORNING   = 10
local DT_EVENING   = 20
local DT_AFTERNOON = 30
local DT_MIDNIGHT  = 40

local WT_DAY   = 1
local WT_NIGHT = 2

local WT_DRY   = 3
local WT_DUSTY = 4

local WT_CALM  = 5
local WT_WINDY = 6
--WT_STORM = 7

local Effects =
   {
      light =
      {
         --{ ambient = {r=0.31, g=0.31, b=0.31, }, diffuse = {r=1,g=1,b=1,},       atmosphereLow={r=243/255,g=225/255,b=150/255,a=1}, atmosphereHigh={r=112/255,g=93/255,b=72/255,a=1}, tags = {WT_DAY} },
         {
            ambient = {r=117/255,g=124/255,b=138/255, },
            ambientLow = {r=172/255,g=128/255,b=106/255, },
            -- ambientHigh = {r=68/255,g=132/255,b=238/255, },
            ambientHigh = {r=34/255,g=66/255,b=119/255, },
            diffuse = {r=255/255,g=235/255,b=160/255,},
            intensity = 2.0,
            atmosphereLow={r=125/255,g=150/255,b=165/255,a=1},
            atmosphereHigh={r=20/255,g=25/255,b=40/255,a=1},
            tags = {WT_DAY}
         },
         {
            ambient = {r=5/222,g=10/222,b=15/222,},
            ambientLow = {r=4/222,g=6/222,b=12/222,},
            ambientHigh = {r=2/222,g=3/222,b=6/222,},
            diffuse = {r=20/255,g=20/255,b=20/255,},
            intensity = 1.0,
            atmosphereLow={r=0/255,g=10/255,b=30/255,a=1},
            atmosphereHigh={r=0,g=0,b=0,a=0},
            tags = {WT_NIGHT}
         },
      },
      bloom =
      {
         { intensity = 0.2, tags = {WT_DAY} },
         { intensity = 0.1, tags = {WT_NIGHT} },
      },
      shafts =
      {
         --{ color = {r=0.9,g=0.8,b=0.6}, intensity = 2, attenuation = 2, length = 0.05,  tags = {WT_DAY} },
         { color = {r=1,g=1,b=1}, intensity = 2, attenuation = 2, length = 0.05,  tags = {WT_DAY} },
         { color = {r=204/255,g=190/255,b=162/255}, intensity = 1, attenuation = 2, length = 0.05, tags = {WT_NIGHT} },
      },
      clouds =
      {
         --{ name = ""          , rigid = nil, opacity = 0, tags = {WT_CALM} },
         { name = "clouds.sbg", rigid = nil, opacity = 0.5, tags = {WT_DAY, WT_CALM} },
         { name = "clouds.sbg", rigid = nil, opacity = 1, tags = {WT_NIGHT} },
         { name = "clouds.sbg", rigid = nil, opacity = 0.5, tags = {WT_DAY, WT_WINDY} },
      },
      fog =
      {
         { color = {r=100/255,g=120/255,b=150/255}, near =  5000,  far = 150000, density = 0.5, tags = {WT_DAY}  }, --test2
         --{ color = {r=57/255,g=47/255,b=40/255}, near =  -1000,  far = 10000, density = 0.9, tags = {WT_DAY, WT_DUSTY}  }, --test3

         --{ color = {r=1/255,g=1/255,b=1/2550}, near =  200, far =  120000, density = 0.6,  tags = {WT_NIGHT} }, -- night
         { color = {r=1/255,g=1/255,b=1/2550}, near =  200, far =  120000, density = 0.6,  tags = {WT_NIGHT} }, -- night

      },
      view =
      {
         { distance = 6000, tags = {WT_DAY} },
         { distance = 6000, tags = {WT_NIGHT} },
      },
   }

return {
   DT_MORNING=DT_MORNING,
   DT_EVENING=DT_EVENING,
   DT_AFTERNOON=DT_AFTERNOON,
   DT_MIDNIGHT=DT_MIDNIGHT,
   WT_DAY=WT_DAY,
   WT_NIGHT=WT_NIGHT,
   WT_DRY=WT_DRY,
   WT_DUSTY=WT_DUSTY,
   WT_CALM=WT_CALM,
   WT_WINDY=WT_WINDY,
   Effects=Effects,
}
