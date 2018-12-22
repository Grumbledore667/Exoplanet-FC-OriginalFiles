Scene =
{
   CLevel01 = "scenes.level01.level01",
   COldFriendBug = "scenes.level01.level01",
}

Items =
{
   CItem          = "items.item",
   CGun           = "items.gun",
   CGunShock      = "items.gun",
   CGunFlare      = "items.gun",
   CWeapon        = "items.weapon",
   CHandToHand    = "items.weapon",
   CInstallation  = "items.installation",
   CBugItem       = "items.bugItem",
   CEnergyBoots   = "items.energyBoots",
   CEnergyShield  = "items.energyShield",
}

Rigids =
{
   CRigid       = "rigids.rigid",
   CEnergyFence = "rigids.energyFence",
   CTerminal    = "rigids.terminal",
   CBeacon      = "rigids.beacon",
   CDynamicFloor =
   {
      module = "rigids.dynamicFloor",
      description = "Dynamic Floor",
   },
   CElevator       =
   {
      module = "rigids.elevator",
      description = "Elevator",
      parameters =
      {
         { name = "obj", value = "", label = "Destination Object", tip = "Object to which position the user will be teleported.", },
      },
   },
   CDoor       =
   {
      module = "rigids.door",
      description = "Doors",
      parameters =
      {
         { name = "disableOnOpen", value = false, label = "Disable on open", tip = "The door can only be opened once.", },
      },
   },
   CWater       =
   {
      module = "rigids.water",
      description = "Water class, doesn't let through camera and spawns sounds on edges",
      parameters =
      {
         { name = "volume", value = 3, label = "Volume", tip = "", },
         { name = "distance", value = 1200, label = "Distance", tip = "", },
         { name = "sounds", value = "river_1.wav", label = "Sound list", tip = "Comma separated list of sounds, each edge spawns a random one from this list.", },
      },
   },

   CShroomBomb =
   {
      module      = "rigids.shroomBomb",
      description = "Dangerous bursting shroom class.",
   },

   CShroom =
   {
      module      = "rigids.shroom",
      description = "Growing and harvestable shroom class. For cages, cause it spawns the fruit and a broken version of the cage by itself.",
   },

   CHarvestable =
   {
      module      = "rigids.harvestable",
      description = "Generic class for plants that grow harvestable fruits",
      parameters =
      {
         { name = "item", value = "", label = "Item name", tip = "Item name that's gonna be added to player's inventory when harvested.", },
      },
   },

   CBloodRoot =
   {
      module      = "rigids.harvestable",
      parent      = "CHarvestable",
      description = "Generic class for plants that grow harvestable fruits",
      parameters =
      {
         { name = "item", value = "blood_root.itm", label = "Item name", tip = "Item name that's gonna be added to player's inventory when harvested.", },
      },
   },

   CKTharsianAloe =
   {
      module      = "rigids.harvestable",
      parent      = "CHarvestable",
      description = "Generic class for plants that grow harvestable fruits",
      parameters =
      {
         { name = "item", value = "ktharsian_aloe.itm", label = "Item name", tip = "Item name that's gonna be added to player's inventory when harvested.", },
      },
   },

   CStygmyanGoldenApple =
   {
      module      = "rigids.harvestable",
      parent      = "CHarvestable",
      description = "Generic class for plants that grow harvestable fruits",
      parameters =
      {
         { name = "item", value = "stygmyan_golden_apple.itm", label = "Item name", tip = "Item name that's gonna be added to player's inventory when harvested.", },
      },
   },
   CMelon =
   {
      module      = "rigids.harvestable",
      parent      = "CHarvestable",
      description = "Generic class for plants that grow harvestable fruits",
      parameters =
      {
         { name = "item", value = "melon.itm", label = "Item name", tip = "Item name that's gonna be added to player's inventory when harvested.", },
      },
   },
   CBluethorn =
   {
      module      = "rigids.harvestable",
      parent      = "CHarvestable",
      description = "Regrowable bluethorn leaves",
      parameters =
      {
         { name = "item", value = "bluethorn_leaf.itm", label = "Item name", tip = "Item name that's gonna be added to player's inventory when harvested.", },
      },
   },

   CFastTravel  =
   {
      module      = "rigids.fastTravel",
      description = "Fast travel marker",
      parameters =
      {
         { name = "prettyName", value = "", label = "Pretty name", tip = "Fast Travel zone that the player sees ingame.", },
         { name = "activateDistance", value = 500, label = "Activation distance", tip = "How close you must get to activate this fast travel point.", },
      },
   },
   CAntigraviumMine  =
   {
      module      = "rigids.antigraviumMine",
      description = "Antigravium Mine",
      parameters =
      {
         { name = "resource", value = 3, label = "Resource", tip = "How many times it can be mined (3 max)", },
         { name = "fertility", value = 2, label = "Fertility", tip = "How fertile this node is (1-3)", },
         { name = "baseObj", value = "", label = "Base object",  tip = "Base object of this node. Optional - for texture change upon depletion.", },
         { name = "meshRaycast", value = true, label = "Mesh-based raycast",  tip = "Mesh source will be used as a raycast", },
      },
   },

   CDigSite  =
   {
      module      = "rigids.digSite",
      description = "Digging Site",
      parameters =
      {
         { name = "label", value = "", label = "Custom Label", tip = "Override object name-based label lookup with a custom label id, if exists, else print literally.", },
         { name = "digsToOpen", value = 2, label = "Digs to Open", tip = "How many times you need to dig here to get the loot.", },
         { name = "containerModel", value = "", label = "Container Model", tip = "Enter container model to place dug up items in.", },
         { name = "lootItems", value = "", label = "Loot Items", tip = "Enter list of loot items.", },
         { name = "position", value = "", label = "Relative Position", tip = "Relative position of the item/container in whole numbers 'x,y,z'", },
         { name = "rotation", value = "", label = "Absolute Rotation", tip = "Absolute rotation of the item/container in whole numbers 'x,y,z'", },
         { name = "meshRaycast", value = true, label = "Mesh-based raycast",  tip = "Mesh source will be used as a raycast", },
      },
   },

   CCombinationLock  =
   {
      module      = "rigids.combinationLock",
      parent      = "CDoor",
      description = "Combination Lock",
      parameters =
      {
         { name = "code", value = "0000", label = "Code", tip = "Code.", },
         { name = "lockObjectName", value = "", label = "Lock Object", tip = "The name of the lock object that will show open/closed.", },
      },
   },

   CReadable =
   {
      module      = "rigids.readable",
      description = "Notice, warning, hanging document etc",
      parameters  =
      {
         { name = "visibleLabel",     value = "", label = "Visible Label", tip = "What player sees when he gets close. The 'object' of 'e read object'.", },
         { name = "interactLabel",     value = "", label = "Interact Label", tip = "What player sees when he gets close. The 'read' of 'e read object'.", },
         { name = "title",     value = "", label = "Title", tip = "", },
         { name = "contents",     value = "", label = "Contents", tip = "", },
         { name = "window",     value = false, label = "Show window", tip = "Show window (with close button) instead of a popup.", },
         { name = "enabled",     value = true, label = "Enabled", tip = "Enabled interaction on start.", },
         { name = "is_char",     value = false, label = "Character", tip = "Is the object a character(have skeleton).", },
         { name = "death_animation",     value = "death.caf", label = "Death animation", tip = "Death animation to play and lock.", },
      }
   },

   CKabarogHead =
   {
      module      = "rigids.kabarogHead",
      description = "Kabarog head.",
   },

   CHint =
   {
      module      = "rigids.hint",
      description = "Evidence, hint, etc. Discoverable by scanner.",
      parent      = "CReadable",
      parameters  =
      {
         { name = "radius", value = 200, label = "Interact radius", tip = "At what radius player will see hint/message.", },
         { name = "enabled", value = true, label = "Enabled on start", tip = "The hint object is enabled on start and will react to scan wave.", },
         { name = "keep_original_material", value = true, label = "Keep original material", tip = "Keeps the original material if checked.", },
         { name = "highlight_material", value = "hint", label = "Highlight material", tip = "Choose the name of additional material.", },
         { name = "proximity_activate", value = true, label = "Proximity activate", tip = "If checked, activates by pressing E. Else when you get close.", },
         { name = "interactLabel", value = "look at", label = "Interact label", tip = "Look at, check out, talk to, read, etc", },
         { name = "show_hint_right_away", value = true, label = "Show hint right away", tip = "If checked, will show hint without the need to hit it with scanner first.", },
         { name = "highlight_timer", value = 0, label = "Highlight Timer", tip = "Set more than 0 to turn off highlight after timeout.", },
      }
   },

   CLadder =
   {
      module      = "rigids.ladder",
      description = "Ladder",
   },

   COpenClose =
   {
      module      = "rigids.openclose",
      description = "Open/Close Object",
      parameters  =
      {
         { name = "visibleLabel",     value = "Togglable Object", label = "Visible Label", tip = "What player sees when he gets close", },
      }
   },

   CCargo =
   {
      module      = "rigids.cargo",
      description = "Generic class for shipping cargo containers with lockable doors",
      parameters  =
      {
         { name = "visibleLabel",     value = "Togglable Object", label = "Visible Label", tip = "What player sees when he gets close", },
      }
   },

   CTurretMedium =
   {
      module      = "rigids.turretMedium",
      description = "Turret Medium",
      parameters  =
      {
         { name = "hologramFlipped",     value = false, label = "Hologram Flipped", tip = "Vertical flip of the hologram screen", },
         { name = "objectsToActivate",   value = "",    label = "Activate Objects", tip = "Enter list of objects that should be activated on scan success", },
      }
   },

   CSpawn =
   {
      module      = "rigids.spawn",
      description = "Spawner",
      parameters  =
      {
         { name = "type"  ,        value = ""  , label = "*.cfg file",   tip = "Enter *.cfg name (ex: killerbug.cfg)", },
         { name = "class" ,        value = ""  , label = "Script class", tip = "Enter script class (ex: CBug)", },
         { name = "active",        value = true, label = "Active",       tip = "Is spawner active?", },
         { name = "spawnRate",     value = 1,    label = "Spawn Rate",   tip = "How often gen characters in seconds?", },
         { name = "spawnTimeMax",  value = 1,    label = "Spawn Time",   tip = "Time during what characters will be generated", },
         { name = "spawnCountMax", value = 1,    label = "Spawn Count",  tip = "How many characters we should generate", },
         { name = "aliveCountMax", value = 1,    label = "Alive Count",  tip = "How many characters can be alive at the same time", },
         { name = "spawnListName", value = "",   label = "SpawnList Name", tip = "Enter name of script spawn table", },
      }
   },

   CSmartSpawn =
   {
      module      = "rigids.smartSpawn",
      description = "A spawner that can have loot and weapons assigned to its chars and can spawn upon player's approach",
      parent      = "CSpawn",
      parameters  =
      {
         { name = "active",        value = false, label = "Active",         tip = "Is spawner active?", },
         { name = "spawnRate",     value = 0,     label = "Spawn Rate",     tip = "How often gen characters in seconds?", },
         { name = "spawnDist",     value = 10000, label = "Spawn Distance", tip = "How close to player mobs spawn", },
         { name = "lootItems",     value = "",    label = "Loot Items",     tip = "Enter list of loot items", },
         { name = "weapons",       value = "",    label = "Weapon Items",   tip = "Enter list of weapon items for bandits", },
         { name = "styles",        value = "",    label = "Styles",         tip = "Enter list of styles for bandits", },
      }
   },

   CSpawnBugs =
   {
      module      = "rigids.spawn",
      parent      = "CSpawn",
      description = "Spawner",
      parameters  =
      {
         { name = "type"  ,    value = "killerbug.cfg", label = "*.cfg file",   tip = "Enter *.cfg name (ex: killerbug.cfg)", },
         { name = "class" ,    value = "CBug",          label = "Script class", tip = "Enter script class (ex: CBug)", },
         { name = "viewRange", value = 1000,            label = "View range", tip = "", },
         { name = "walkRange", value = 1000,            label = "Walk range", tip = "", },
      }
   },

   CSpawnGreenBugs =
   {
      module      = "rigids.spawn",
      parent      = "CSpawnBugs",
      description = "Spawner",
      parameters  =
      {
         { name = "type"  ,      value = "greenbug.cfg", label = "*.cfg file",   tip = "Enter *.cfg name (ex: killerbug.cfg)", },
         { name = "class" ,      value = "CBugGreen",    label = "Script class", tip = "Enter script class (ex: CBug)", },
      }
   },

   CSpawnKabarogs =
   {
      module      = "rigids.spawn",
      parent      = "CSpawn",
      description = "Kabarogs Spawner",
      parameters  =
      {
         { name = "type"  ,    value = "kabarog.cfg",       label = "*.cfg file",   tip = "Enter *.cfg name (ex: killerbug.cfg)", },
         { name = "class" ,    value = "CKabarog",          label = "Script class", tip = "Enter script class (ex: CBug)", },
         { name = "lootItems", value = "meat.itm,horn.itm", label = "Loot Items",   tip = "Enter list of loot items", },
      }
   },

   CSpawnDustSharks =
   {
      module      = "rigids.spawn",
      parent      = "CSpawn",
      description = "Dust Sharks Spawner",
      parameters  =
      {
         { name = "type" ,     value = "dust_shark.cfg", label = "*.cfg file",   tip = "Enter *.cfg name (ex: killerbug.cfg)", },
         { name = "class",     value = "CShark",         label = "Script class", tip = "Enter script class (ex: CBug)", },
         { name = "viewRange", value = 1000,             label = "View range", tip = "", },
         { name = "walkRange", value = 1000,             label = "Walk range", tip = "", },
      }
   },

   CItemGenerator =
   {
      module      = "rigids.itemGenerator",
      description = "Creates interactive Item",
      parameters  =
      {
         { name = "itemName",       value = "",    label = "Item name",           tip = "Enter item name (ex: revolver.gun)", },
         { name = "hideSource",     value = true,  label = "Hide source",         tip = "Mesh source will be hidden", },
         { name = "meshRaycast",    value = false, label = "Mesh-based raycast",  tip = "Mesh source will be used as a raycast", },
         { name = "interactHeight", value = 0,     label = "Interact height",     tip = "Interaction height", },
         { name = "raycastRadius", value = 50,     label = "Raycast radius",      tip = "Raycast radius", },
         { name = "interactTime",   value = "",    label = "Interact time",       tip = "Interaction time", },
      }
   },

   CShells =
   {
      module      = "rigids.rigidShells",
      description = "Shells for different weapon and guns",
      parameters  =
      {
         { name = "itemName"   , value = "", label = "Weapon name" , tip = "Enter weapon or gun name (ex: revolver.gun)", },
         { name = "shellsCount", value = 0 , label = "Shells count", tip = "Enter shells count", },
      }
   },

   CSmallRigid =
   {
      module      = "rigids.smallRigid",
      description = "A small item that a bug can carry",
      parameters  =
      {
         { name = "itemName"        , value = "",    label = "Item name" , tip = "", },
      }
   },

   CEnergySphere =
   {
      module      = "rigids.energySphere",
      description = "Energy sphere",
   },

   CContainer =
   {
      module      = "rigids.container",
      description = "Contain items",
      parameters  =
      {
         { name = "items"         , value = "",  label = "Items list",      tip = "Enter list of items separated by comma", },
         { name = "raycastRadius",  value = "",  label = "Raycast Radius",  tip = "Bounding sphere radius", },
         { name = "labelId",        value = "",  label = "Label ID" ,       tip = "Lebel ID that should ref to objectsLabels.lua file record", },
      }
   },

   CContainerStash =
   {
      module      = "rigids.containerStash",
      description = "Contains player items",
      parameters  =
      {
         { name = "raycastRadius",  value = "",  label = "Raycast Radius",  tip = "Bounding sphere radius", },
         { name = "labelId",        value = "",  label = "Label ID" , tip = "Lebel ID that should ref to objectsLabels.lua file record", },
      }
   },

   CActivator =
   {
      module      = "rigids.activator",
      description = "Activates/Deactivates different objects set in parameters",
      parameters  =
      {
         { name = "labelId",       value = "", label = "Label ID" , tip = "Lebel ID that should ref to objectsLabels.lua file record", },
         { name = "interactTime",  value = 0,  label = "Interact time",   tip = "Interaction time", },

         { name = "objectsToShow", value = "", label = "Show Objects", tip = "Enter list of objects that should be showed", },
         { name = "objectsToHide", value = "", label = "Hide Objects", tip = "Enter list of objects that should be hidden", },

         { name = "soundsToPlay", value = "", label = "Play Sounds", tip = "Enter list of sounds to play", },
         { name = "soundsToStop", value = "", label = "Stop Sounds", tip = "Enter list of sounds to stop", },

         { name = "emittersToStart", value = "", label = "Start Emitters", tip = "Enter list of emitters to start", },
         { name = "emittersToStop" , value = "", label = "Stop Emitters" , tip = "Enter list of emitters to stop", },

         { name = "animationToPlay", value = "", label = "Play animation", tip = "Enter animation name", },
         { name = "animationCycled", value = true, label = "Cycled animation", tip = "Select animation mode Cycled or Single", },

         { name = "activatorEnabled", value = true , label = "Activator Enabled" , tip = "Is activator enabled by default", },
         { name = "activatorHide"   , value = false, label = "Hide Activator"    , tip = "Hide this activator", },
         { name = "activateByPlayer", value = true , label = "Activate by player", tip = "Can be activated by player", },
         { name = "activateMultiple", value = false, label = "Activate Multiple" , tip = "Can be activated several times", },
         { name = "raycastRadius"  , value = 50  , label = "Raycast Radius"   , tip = "Raycast radius", },

         { name = "objectsToActivate",   value = "", label = "Activate Objects",   tip = "Enter list of objects that should activated", },
         { name = "objectsToDeactivate", value = "", label = "Deactivate Objects", tip = "Enter list of objects that should deactivated", },

         { name = "objectsToEnable",     value = "", label = "Enable Objects" , tip = "Enter list of objects that should be Enabled", },
         { name = "objectsToDisable",    value = "", label = "Disable Objects", tip = "Enter list of objects that should be Disabled", },

         { name = "objectTypeToSpawn",     value = "", label = "Spawn Object Type" , tip = "Enter object type (fireplace.sbg, kabarog.cfg) that should be spawned upon activation", },
         { name = "objectClassToSpawn",     value = "", label = "Spawn Object Class" , tip = "Enter object class (CFireplace, CKabarog) that should be spawned upon activation", },

         { name = "removeItems", value = "", label = "Remove Items", tip = "Enter list of items that should be removed from Player", },
         { name = "addItems"   , value = "", label = "Add Items"   , tip = "Enter list of items that should be added to Player", },
      }
   },
   CBed =
   {
      module      = "rigids.bed",
      description = "Activates/Deactivates sleep mode",
      parameters  =
      {
         { name = "owner", value = "", label = "Owner" , tip = "Set an owner to this bed. Enter characterName or player or leave it empty", },
      }
   },
   CRestCamp =
   {
      module      = "rigids.restCamp",
      description = "Activates/Deactivates rest mode",
   },
   CFireplace =
   {
      module      = "rigids.fireplace",
      parent      = "CRestCamp",
      description = "Activates/Deactivates rest mode",
   },
}

Characters =
{
   CMainCharacterBug = "characters.mainCharacterBug",

   CCloth = "characters.cloth",

   CLemfather =
   {
      module      = "characters.lemfather",
      parent      = "CTalker",
      description = "lemfather",
   },

   CMainCharacter =
   {
      module      = "characters.mainCharacter",
      description = "mc",
      parameters  =
      {
         { name = "items", value = "", label = "items" , tip = "add these items on start", },
         { name = "toHotbar", value = "", label = "to hotbar" , tip = "assign these items to hotbar on start", },
      }
   },

   Character =
   {
      module      = "character",
      description = "character virtual",
      parameters  =
      {
         { name = "headLooking",   value = true,   label = "Head Looking" , tip = "Head looking at target", },
         { name = "style",         value = "",     label = "Style" , tip = "Appearance style", },
      }
   },

   CTalker =
   {
      module      = "characters.talker",
      parent      = "Character",
      description = "talker",
      parameters  =
      {
         { name = "dialog",              value = "",              label = "Character's dialog" ,  tip = "Dialog's name is same to filename without .lua", },
         { name = "labelId",             value = "",              label = "Label ID" ,            tip = "Lebel ID that should ref to objectsLabels.lua file record", },
         { name = "dialogActors",        value = "",              label = "Dialog Actors",        tip = "List of dialog actors", },
         { name = "defaultAnimation",    value = "idle",          label = "Idle Animation"  ,     tip = "Default idle animation name without extension", },
         { name = "moveAnimation",       value = "move",          label = "Move Animation"  ,     tip = "Default move animation name without extension", },
         { name = "turnRightAnim",       value = "turn_right_90", label = "Turn Right Anim"  ,    tip = "", },
         { name = "turnLeftAnim",        value = "turn_left_90",  label = "Turn Left Anim"  ,     tip = "", },
         { name = "orientateToPlayer",   value = true,            label = "Orient to Player" ,    tip = "Orientate to Player", },
         { name = "orientateSpeed",      value = 120,             label = "Orient Speed" ,        tip = "Orientate Speed", },
         { name = "patrolSpeed",         value = 300,             label = "Patrol Speed" ,        tip = "Patrol Speed", },
         { name = "patrolPoints",        value = "",              label = "Patrol Points",        tip = "List of patrol waypoints", },
         { name = "patrolActive",        value = true,            label = "Patrol Mode Active",   tip = "Activate patrol mode", },
         { name = "patrolLoop",          value = true,            label = "Patrol Loop Active",   tip = "Activate patrol looping", },
         { name = "dialogInitiator",     value = false,           label = "Dialog Initiator",     tip = "NPC Starts dialog when player nearby", },
         { name = "dialogInitiatorDist", value = 300,             label = "Dialog Init Distance", tip = "Distance at which NPC Starts dialog", },
         { name = "tradeInventory",      value = "",              label = "Trade inventory",      tip = "Trade inventory that the NPC starts with", },
         { name = "tradeWhitelistName",  value = "",              label = "Trade whitelist name", tip = "An item list name of the goods that the NPC will agree to buy", },
      }
   },

   CNPC = {
      module = "characters.npc",
      parent = "Character",
      description = "base npc class",
      parameters = {
         {
            name  = "dialog",
            value = "",
            label = "Dialog",
            tip   = "filename without '.lua' extension",
         },
      },
   },

   CCorpse =
   {
      module      = "characters.corpse",
      parent      = "CTalker",
      description = "corpse",
      parameters  =
      {
         { name = "death_animation",     value = "", label = "Death pose" , tip = "Death pose", },
         { name = "dialog",              value = "", label = "Character's dialog" , tip = "Dialog's name is same to filename without .lua", },
         { name = "labelId",             value = "", label = "Label ID" , tip = "Lebel ID that should ref to objectsLabels.lua file record", },
         { name = "dialogActors",        value = "", label = "Dialog Actors",     tip = "List of dialog actors", },
         { name = "defaultAnimation",    value = "", label = "Idle Animation"  ,  tip = "Default idle animation name without extension", },
         { name = "moveAnimation",       value = "", label = "Move Animation"  ,  tip = "Default move animation name without extension", },
         { name = "orientateToPlayer",   value = false,   label = "Orient to Player" , tip = "Orientate to Player", },
         { name = "orientateSpeed",      value = 120,    label = "Orient Speed" ,     tip = "Orientate Speed", },
         { name = "patrolSpeed",         value = 300,    label = "Patrol Speed" ,     tip = "Patrol Speed", },
         { name = "patrolPoints",        value = "",     label = "Patrol Points",     tip = "List of patrol waypoints", },
         { name = "patrolActive",        value = false,   label = "Patrol Mode Active", tip = "Activate patrol mode", },
         { name = "patrolLoop",          value = false,   label = "Patrol Loop Active", tip = "Activate patrol looping", },
         { name = "headLooking",         value = false,   label = "Head Looking" , tip = "Head looking at target", },
      }
   },

   CArphantMolly =
   {
      module      = "characters.arphantMolly",
      parent      = "CTalker",
      description = "arphant Molly",
   },

   CBetterBirds =
   {
      module      = "characters.betterBirds",
      parent      = "CTalker",
      description = "better birds",
      parameters  =
      {
         { name = "dialog",  value = "", label = "Character's dialog" , tip = "Dialog's name is same to filename without .lua", },
         { name = "labelId", value = "", label = "Label ID" , tip = "Lebel ID that should ref to objectsLabels.lua file record", },
         { name = "defaultAnimation",    value = "idle", label = "Idle Animation"  ,  tip = "Default idle animation name without extension", },
         { name = "moveAnimation",       value = "move", label = "Move Animation"  ,  tip = "Default move animation name without extension", },
         { name = "orientateToPlayer",   value = true,   label = "Orient to Player" , tip = "Orientate to Player", },
         { name = "orientateSpeed",      value = 120,    label = "Orient Speed" ,     tip = "Orientate Speed", },
         { name = "patrolSpeed",         value = 300,    label = "Patrol Speed" ,     tip = "Patrol Speed", },
         { name = "patrolPoints",        value = "",     label = "Patrol Points",     tip = "List of patrol waypoints", },
         { name = "patrolActive",        value = true,   label = "Patrol Mode Active", tip = "Activate patrol mode", },
      }
   },

   COldOutcast =
   {
      module      = "characters.oldOutcast",
      parent      = "CTalker",
      description = "Old Outcast",
   },

   CSwiftStrider =
   {
      module      = "characters.swiftStrider",
      parent      = "CTalker",
      description = "Swift Strider",
   },

   CSlave =
   {
      module      = "characters.slave",
      parent      = "CTalker",
      description = "Slave",
   },

   CDrone =
   {
      module      = "characters.drone",
      parent      = "CTalker",
      description = "Drone",
      parameters  =
      {
         { name = "repairTarget",        value = "",     label = "Repair Target",     tip = "Repair Target", },
      }
   },
   CTrailerSmoker =
   {
      module      = "characters.trailer",
      parent      = "Character",
      description = "Static smoking npc",
      parameters  =
      {
         { name = "smokeAnim", value = "idle_smoking",     label = "Smoke anim",     tip = "Smoke animation", },
      }
   },
   CTrailerDrinker =
   {
      module      = "characters.trailer",
      parent      = "Character",
      description = "Static drinking npc",
   },
   CTrailerCook =
   {
      module      = "characters.trailer",
      parent      = "Character",
      description = "Static pot stirring abori",
   },
   CTrailerEater =
   {
      module      = "characters.trailer",
      parent      = "Character",
      description = "Static eating npc",
   },

   CBugGreen =
   {
      module      = "characters.bugGreen",
      parent      = "CBug",
      description = "bug green",
   },

   CBug =
   {
      module      = "characters.bug",
      description = "bug",
      parameters  =
      {
         { name = "viewRange", value = 1000, label = "View range", tip = "", },
         { name = "walkRange", value = 1000, label = "Walk range", tip = "", },
         { name = "blockChirping", value = false, label = "Block Chirping", tip = "Block this bug's chirping idle sounds or not.", },
      }
   },

   CKabarog =
   {
      module      = "characters.kabarog",
      description = "kabarog",
      parameters  =
      {
         { name = "viewRange", value = 1000, label = "View range", tip = "", },
         { name = "lootItems", value = "",   label = "Loot Items", tip = "Enter list of loot items", },
      }
   },

   CKabarogPain =
   {
      module      = "characters.kabarogPain",
      description = "kabarog",
      parameters  =
      {
         { name = "viewRange", value = 1000, label = "View range", tip = "", },
         { name = "lootItems", value = "",   label = "Loot Items", tip = "Enter list of loot items", },
      }
   },

   CKabarogWeak =
   {
      module      = "characters.kabarog",
      description = "kabarogWeak",
      parent      = "CKabarog",
   },

   CArphant =
   {
      module      = "characters.arphant",
      description = "arphant",
      parameters  =
      {
         { name = "viewRange", value = 0, label = "View range", tip = "Arphants are peaceful while having 0 view range, but gain 1000 after being attacked.", },
         { name = "lootItems", value = "",   label = "Loot Items", tip = "Enter list of loot items", },
      }
   },

   CBandit =
   {
      module      = "characters.bandit",
      description = "bandit",
      parameters  =
      {
         { name = "weapon", value = "",   label = "Weapon item", tip = "Enter a name of the item to attack with", },
         { name = "energyMax", value = 0,   label = "Shield Energy", tip = "Amount of shield energy.", },
         { name = "lootItems", value = "",   label = "Loot Items", tip = "Enter list of loot items", },
         { name = "style", value = "",   label = "Style", tip = "Appearance Style", },
         { name = "customLabel", value = "",   label = "Label", tip = "Custom label for this character.", },
         { name = "viewRange", value = 1000, label = "View range", tip = "", },
      }
   },
   CBanditTalker =
   {
      module      = "characters.banditTalker",
      description = "Not aggressive talking bandit",
      parameters  =
      {
         { name = "weapon", value = "",   label = "Weapon item", tip = "Enter a name of the item to attack with", },
         { name = "energyMax", value = 0,   label = "Shield Energy", tip = "Amount of shield energy.", },
         { name = "lootItems", value = "",   label = "Loot Items", tip = "Enter list of loot items", },
         { name = "style", value = "",   label = "Style", tip = "Appearance Style", },
         { name = "customLabel", value = "",   label = "Label", tip = "Custom label for this character.", },
         { name = "viewRange", value = 1000, label = "View range", tip = "", },
         { name = "dialog", value = "",   label = "Dialog", tip = "Enter a name of dialog file to be played non aggressive state", },
         { name = "dialogActors",        value = "",           label = "Dialog Actors",        tip = "List of dialog actors", },
         { name = "idleAnim", value = "",   label = "Idle animation", tip = "Enter a name of preferred idle animation withOUT .caf part", },
         { name = "dialogInitiator",     value = false,        label = "Dialog Initiator",     tip = "NPC Starts dialog when player nearby", },
         { name = "dialogInitiatorDist", value = 300,          label = "Dialog Init Distance", tip = "Distance at which NPC Starts dialog", },
      }
   },
   CCrat =
   {
      module      = "characters.crucas",
      description = "crat",
      parameters  =
      {
         { name = "viewRange", value = 1000, label = "View range", tip = "", },
         { name = "lootItems", value = "",   label = "Loot Items", tip = "Enter list of loot items", },
      }
   },
   CCratEating =
   {
      module      = "characters.crucas",
      description = "eating crat",
      parent      = "CCrat",
   },

   CCratWeak =
   {
      module      = "characters.crucas",
      description = "cratWeak",
      parent      = "CCrat",
   },

   CBirds =
   {
      module      = "characters.birds",
      description = "birds",
   },

   CShark =
   {
      module      = "characters.shark",
      description = "Shark",
      parameters  =
      {
         { name = "viewRange", value = 1000, label = "View range", tip = "", },
         { name = "walkRange", value = 1000, label = "Walk range", tip = "", },
      }
   },

   CTurret =
   {
      module      = "characters.turret",
      description = "Turret",
      parameters  =
      {
         { name = "viewRange", value = 1000, label = "View range" , tip = "", },
      }
   },
}


Triggers =
{
   CTrigger =
   {
      module      = "trigger",
      description = "Default trigger",
      parameters  =
      {
         { name = "byPlayer", value = false, label = "Activate by Player", tip = "", },
         { name = "enabled" , value = true , label = "Enabled"           , tip = "", },
      }
   },

   CTriggerBillboard =
   {
      module      = "triggers.triggerBillboard",
      parent      = "CTrigger",
      description = "",
      parameters  =
      {
         { name = "title"    , value = "",    label = "Title"      , tip = "", },
         { name = "contents" , value = "",    label = "Contents"   , tip = "", },
         { name = "onetime"  , value = false, label = "Onetime"    , tip = "disable after activation", },
         { name = "hideAfter", value = 10,    label = "Hide After" , tip = "Hide after x seconds. Disable timer of 0.", },
      }
   },

   CTriggerSwim =
   {
      module      = "triggers.triggerSwim",
      description = "",
   },

   CTriggerMetalSteps =
   {
      module      = "triggers.triggerMetalSteps",
      description = "",
   },

   CDamageZone =
   {
      module      = "triggers.damageZone",
      parent      = "CTrigger",
      description = "",
      parameters  =
      {
         { name = "damage"        , value = 10, label = "Damage"         , tip = "", },
         { name = "pushForce"     , value = 0,  label = "Push force"     , tip = "", },
         { name = "damageInterval", value = 1,  label = "Damage interval", tip = "", },
      }
   },

   CTriggerActivator =
   {
      module      = "triggers.triggerActivator",
      parent      = "CTrigger",
      description = "activates/enables deactivates/disables different objects",
      parameters  =
      {
         { name = "invertAction", value = false, label = "Invert Action", tip = "", },

         { name = "objectsToActivate",   value = "", label = "Activate Objects",   tip = "Enter list of objects that should activated", },
         { name = "objectsToDeactivate", value = "", label = "Deactivate Objects", tip = "Enter list of objects that should deactivated", },

         { name = "objectsToEnable",     value = "", label = "Enable Objects" , tip = "Enter list of objects that should be Enabled", },
         { name = "objectsToDisable",    value = "", label = "Disable Objects", tip = "Enter list of objects that should be Disabled", },
      }
   },
   CTriggerQuestEvent =
   {
      module      = "triggers.triggerQuestEvent",
      parent      = "CTrigger",
      description = "activates/enables deactivates/disables different objects",
      parameters  =
      {
         { name = "oneTime", value = false, label = "One time", tip = "", },
         { name = "eventType", value = "activate", label = "Event type", tip = "", },
      }
   },
}


Cameras =
{
   CCameraTrig =
   {
      module      = "cameras.cameraTrig",
      description = "������, �������������� ���������",
      parameters  =
      {
         { name      = "animName"          , value = ""   , label = "Animation name", tip = "", },
         { muteMusic = "targetTriggersList", value = false, label = "Mute music"    , tip = "", },
         { name      = "smoothIn"          , value = false, label = "Smooth in"     , tip = "", },
         { name      = "smoothOut"         , value = false, label = "Smooth out"    , tip = "", },
      }
   },
}
