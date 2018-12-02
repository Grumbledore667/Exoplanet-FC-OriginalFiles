local tips_raw = {
   "Assign items to hotbar by pressing 1-0 while hovering over the item in your inventory.",
   "Drag and drop an item from your inventory to the hotbar.",
   "X toggles the UI on and off.",
   "Hit ESCAPE ingame to show the pause menu and choose HELP to see all the tips.",
   "You can decompose some crafted items back to their crafting components. Cactus clubs to firewood, for instance. Right click on the club in the inventory -> decompose.",
   "Right click items in inventory to see what you can do with them.",
   "Watch your Endurance bar, the green one. You cannot run if it is depleted.",
   "Gather natural resources. They can be used as food, weapons or crafting materials.",
   "Food and pure water are precious. Try to cook meat and other ingredients at the campfire to improve their positive effects.",
   "You can skip time and cook while resting at the campfire. Make a campfire with firewood (right click on firewood -> install).",
   "You can remote control chipped living bugs in your inventory (right click on a chipped bitebug -> install).",
}

local tips_rest = {}
for i=1, #tips_raw do
   tips_rest["tip_" .. i] = tips_raw[i]
end

return {
   en = {
      loading_screen = {
         new_game = [[The story of my adventures on K'Tharsis starts with a contract picked up in a bar on the infamous space station Freeport 13. I was hired to transport a group of suspicious "geologists" and their cargo to the remote system of Tharsis-831 aboard my private spaceship "Crystal Betty". Shortly after entering the desert planet's orbit the ship was hijacked and I was thrown out of the airlock and left to die. Some time later I woke up in a desert, uncertain how I managed to stay alive, but determined to find "Beth" and tear the hijackers a new one.]],
         caching_textures = "caching textures",
         tips_keys = {
            scanner = "Use scanner implant (${hotbarq} key) to check your surroundings if you have trouble finding plants or containers.",
            needs = "Keep an eye on your hunger and thirst levels (${character} key). Your health and stamina regenerate faster when you aren't hungry, thirsty and are well-rested.",
            status_effects = "Food and drinks apply various effects on consumption. Hit ${character} key to see them.",
            journal = "Jack likes to make notes about his adventures. Open the journal with ${journal} key if you need clues about quest objectives and also want to see Jack's thoughts on other characters and the situation.",
         },
         tips_rest = tips_rest,
      },
   },
}
