local oo = require "loop.simple"

local CSkillsManager = oo.class({})
local string = string

function CSkillsManager:init()
   self.mining = hlp.CGParam("skillMining")
end

function CSkillsManager:inc( strSkill, value )
   if not self[strSkill] or not value then return end

   local prev = self[strSkill]:get()
   local new = self[strSkill]:get() + value
   new = math.min(100, new)

   if prev ~= new then
      self[strSkill]:set( new )
      gameplayUI:showInfoTextEx( string.gsub( strSkill, "^%l", string.upper) .. " improved by " .. (new - prev) .. " (now " .. new .. ")", "minor", "" )
   end
end

function CSkillsManager:set( strSkill, value )
   if not self[strSkill] or not value then return end

   local prev = self[strSkill]:get()
   local new = value
   new = math.min(100, new)

   if prev ~= new then
      if prev < new then
         gameplayUI:showInfoTextEx( string.gsub( strSkill, "^%l", string.upper) .. " improved by " .. (new - prev) .. " (now " .. new .. ")", "minor", "" )
      else
         gameplayUI:showInfoTextEx( string.gsub( strSkill, "^%l", string.upper) .. " decreased by " .. (new - prev) .. " (now " .. new .. ")", "minor", "" )
      end
      self[strSkill]:set( new )
   end
end

function CSkillsManager:get( strSkill )
   if not self[strSkill] then return end
   return self[strSkill]:get()
end

function CSkillsManager:check( strSkill )
   if not self[strSkill] then return end
   gameplayUI:showInfoTextEx( string.gsub( strSkill, "^%l", string.upper) .. " is " .. self[strSkill]:get(), "minor", "" )
end

return CSkillsManager