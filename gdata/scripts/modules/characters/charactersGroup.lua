local FRIEND  = 0
local ENEMY   = 1
local NEUTRAL = 2
local IGNOR   = 3

local ROLE_PLAYER     = 1
local ROLE_NPC_ENEMY  = 2
local ROLE_NPC_FRIEND = 3
local ROLE_INSECT     = 4
local ROLE_ANIMAL     = 5
local ROLE_PLANT      = 6
local ROLE_TURRET     = 7
local ROLE_SHARK      = 8
local ROLE_NPC_AGR    = 9

local Roles =
   {--                    ROLE_PLAYER  ROLE_NPC_ENEMY   ROLE_NPC_FRIEND   ROLE_INSECT   ROLE_ANIMAL   ROLE_PLANT   ROLE_TURRET   ROLE_SHARK
      --[[ROLE_PLAYER    ]] {FRIEND,      ENEMY ,          FRIEND,           ENEMY  ,      ENEMY  ,      ENEMY  ,     ENEMY  ,      ENEMY  , },
      --[[ROLE_NPC_ENEMY ]] {ENEMY ,      FRIEND,          ENEMY ,           ENEMY  ,      ENEMY  ,      ENEMY  ,     ENEMY  ,      ENEMY  , },
      --[[ROLE_NPC_FRIEND]] {FRIEND,      ENEMY ,          FRIEND,           IGNOR  ,      IGNOR  ,      ENEMY  ,     ENEMY  ,      ENEMY  , },
      --[[ROLE_INSECT    ]] {ENEMY ,      ENEMY ,          IGNOR ,           FRIEND ,      NEUTRAL,      IGNOR  ,     IGNOR  ,      IGNOR  , },
      --[[ROLE_ANIMAL    ]] {ENEMY ,      ENEMY ,          IGNOR ,           NEUTRAL,      FRIEND ,      ENEMY  ,     IGNOR  ,      NEUTRAL, },
      --[[ROLE_PLANT     ]] {ENEMY ,      ENEMY ,          ENEMY ,           IGNOR  ,      ENEMY  ,      FRIEND ,     IGNOR  ,      IGNOR  , },
      --[[ROLE_TURRET    ]] {ENEMY ,      ENEMY ,          FRIEND,           ENEMY  ,      ENEMY  ,      IGNOR  ,     FRIEND ,      IGNOR  , },
      --[[ROLE_SHARK     ]] {ENEMY ,      ENEMY ,          ENEMY ,           IGNOR  ,      ENEMY  ,      IGNOR  ,     IGNOR  ,      FRIEND , },
      --[[ROLE_NPC_AGR   ]] {ENEMY ,      FRIEND,          FRIEND,           IGNOR  ,      ENEMY  ,      ENEMY  ,     ENEMY  ,      ENEMY  , },
   }

local CPlayer =
   {
      id =						"player",
      player =					FRIEND,
      npc =						ENEMY,
      plant =						ENEMY,
      animal =					ENEMY,
      bug = 						ENEMY,
      neutral = 				    NEUTRAL,
      turret =                    IGNOR,
   }


local CNpc =
   {
      id =						"npc",
      player =					ENEMY,
      npc =						FRIEND,
      plant =						IGNOR,
      animal =					ENEMY,
      bug =						ENEMY,
      neutral = 				    NEUTRAL,
      turret =                    IGNOR,
   }


local CPlant =
   {
      id =						"plant",
      player =					ENEMY,
      npc =						ENEMY,
      plant =						FRIEND,
      animal =					ENEMY,
      bug =						IGNOR,
      neutral = 				    NEUTRAL,
      turret =                    IGNOR,
   }


local CAnimal =
   {
      id =						"animal",
      player =					ENEMY,
      npc =						ENEMY,
      plant =						IGNOR,
      animal =					FRIEND,
      bug =						ENEMY,
      neutral = 				    NEUTRAL,
      turret =                    IGNOR,
   }


local CBug =
   {
      id =						"bug",
      player =					ENEMY,
      npc =						ENEMY,
      plant =						IGNOR,
      animal =					ENEMY,
      bug =						FRIEND,
      neutral = 				    NEUTRAL,
      turret =                    IGNOR,
   }


local CNeutral =
   {
      id =						"neutral",
      player =					NEUTRAL,
      npc =						NEUTRAL,
      plant =						NEUTRAL,
      animal =					NEUTRAL,
      bug =						NEUTRAL,
      neutral = 				    NEUTRAL,
      turret =                    NEUTRAL,
   }


local CTurret =
   {
      id =						"turret",
      player =					ENEMY,
      npc =						ENEMY,
      plant =						ENEMY,
      animal =					ENEMY,
      bug =						ENEMY,
      neutral = 				    NEUTRAL,
   }

return {
   FRIEND=FRIEND,
   ENEMY=ENEMY,
   NEUTRAL=NEUTRAL,
   IGNOR=IGNOR,
   ROLE_PLAYER=ROLE_PLAYER,
   ROLE_NPC_ENEMY=ROLE_NPC_ENEMY,
   ROLE_NPC_FRIEND=ROLE_NPC_FRIEND,
   ROLE_INSECT=ROLE_INSECT,
   ROLE_ANIMAL=ROLE_ANIMAL,
   ROLE_PLANT=ROLE_PLANT,
   ROLE_TURRET=ROLE_TURRET,
   ROLE_SHARK=ROLE_SHARK,
   ROLE_NPC_AGR=ROLE_NPC_AGR,
   Roles=Roles,
   CPlayer=CPlayer,
   CNpc=CNpc,
   CPlant=CPlant,
   CAnimal=CAnimal,
   CBug=CBug,
   CNeutral=CNeutral,
   CTurret=CTurret,
}
