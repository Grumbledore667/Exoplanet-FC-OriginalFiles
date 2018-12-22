local Attitudes = {
   FRIEND  = "FRIEND",
   ENEMY   = "ENEMY",
   NEUTRAL = "NEUTRAL",
   IGNORE  = "IGNORE",
}

local FRIEND  = Attitudes.FRIEND
local ENEMY   = Attitudes.ENEMY
local NEUTRAL = Attitudes.NEUTRAL
local IGNORE  = Attitudes.IGNORE

local Guilds = {}

local function declareGuild(guildString)
   table.insert(Guilds, guildString)
   Guilds[guildString] = #Guilds
end

declareGuild "GLD_PLAYER"
declareGuild "GLD_NPC_ENEMY"
declareGuild "GLD_NPC_FRIEND"
declareGuild "GLD_INSECT"
declareGuild "GLD_ANIMAL"
declareGuild "GLD_TURRET"
declareGuild "GLD_SHARK"
declareGuild "GLD_NPC_AGR"
declareGuild "GLD_INVISIBLE"
declareGuild "GLD_CORPSE"

local GuildsMatrix =
{--                    GLD_PLAYER  GLD_NPC_ENEMY   GLD_NPC_FRIEND   GLD_INSECT   GLD_ANIMAL   GLD_TURRET   GLD_SHARK  GLD_NPC_AGR  GLD_INVISIBLE GLD_CORPSE
   --[[GLD_PLAYER    ]] {FRIEND,      ENEMY ,          FRIEND,         ENEMY  ,    ENEMY  ,     ENEMY  ,     ENEMY  ,   ENEMY  ,       IGNORE ,    IGNORE, },
   --[[GLD_NPC_ENEMY ]] {ENEMY ,      FRIEND,          ENEMY ,         ENEMY  ,    ENEMY  ,     ENEMY  ,     ENEMY  ,   FRIEND ,       IGNORE ,    IGNORE, },
   --[[GLD_NPC_FRIEND]] {FRIEND,      ENEMY ,          FRIEND,         IGNORE ,    IGNORE ,     ENEMY  ,     ENEMY  ,   FRIEND ,       IGNORE ,    IGNORE, },
   --[[GLD_INSECT    ]] {ENEMY ,      ENEMY ,          IGNORE,         FRIEND ,    NEUTRAL,     IGNORE ,     IGNORE ,   IGNORE ,       IGNORE ,    IGNORE, },
   --[[GLD_ANIMAL    ]] {ENEMY ,      ENEMY ,          IGNORE,         NEUTRAL,    FRIEND ,     IGNORE ,     NEUTRAL,   ENEMY  ,       IGNORE ,    IGNORE, },
   --[[GLD_TURRET    ]] {ENEMY ,      ENEMY ,          FRIEND,         ENEMY  ,    ENEMY  ,     FRIEND ,     IGNORE ,   ENEMY  ,       IGNORE ,    IGNORE, },
   --[[GLD_SHARK     ]] {ENEMY ,      ENEMY ,          ENEMY ,         IGNORE ,    ENEMY  ,     IGNORE ,     FRIEND ,   ENEMY  ,       IGNORE ,    IGNORE, },
   --[[GLD_NPC_AGR   ]] {ENEMY ,      FRIEND,          FRIEND,         IGNORE ,    ENEMY  ,     ENEMY  ,     ENEMY  ,   FRIEND ,       IGNORE ,    IGNORE, },
   --[[GLD_INVISIBLE ]] {IGNORE,      IGNORE,          IGNORE,         IGNORE ,    IGNORE ,     IGNORE ,     IGNORE ,   IGNORE ,       IGNORE ,    IGNORE, },
   --[[GLD_CORPSE    ]] {IGNORE,      IGNORE,          IGNORE,         IGNORE ,    IGNORE ,     IGNORE ,     IGNORE ,   IGNORE ,       IGNORE ,    IGNORE, },
}

local function getAttitude(guildStr1, guildStr2)
   local guild1 = Guilds[guildStr1]
   local guild2 = Guilds[guildStr2]
   local row, attitude
   if guild1 and guild2 then
      row = GuildsMatrix[guild1]
      attitude = row and row[guild2]
   end
   if not attitude then
      local errorTemplate = "Error: Can't find guild attitude for guilds '%s' and '%s', assuming NEUTRAL"
      log(string.format(errorTemplate, tostring(guildStr1), tostring(guildStr2)))
      attitude = NEUTRAL
   end
   return attitude
end

local function setAttitude(guildStr1, attitude, guildStr2)
   local guild1 = Guilds[guildStr1]
   local guild2 = Guilds[guildStr2]
   if not guild1 or not guild2 then
      return
   end
   local row = GuildsMatrix[guild1]
   if not row then
      row = {}
      GuildsMatrix[guild1] = row
   end
   row[guild2] = attitude
end

local function isValidGuild(guildStr)
   return Guilds[guildStr] ~= nil
end

return {
   Attitudes=Attitudes,
   isValidGuild=isValidGuild,
   getAttitude=getAttitude,
   setAttitude=setAttitude,
}
