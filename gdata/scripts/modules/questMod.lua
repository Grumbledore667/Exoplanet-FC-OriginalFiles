function initMod(count)
   log("questModSystem:initMod()")
   local quests_names = getFolderElements("\\gdata\\scripts\\quests\\mods\\*.lua", false, true)
   
   
      
   for i=1,#quests_names do
      if string.find(quests_names[i], "schematic") == nil then
         if not isQuestStarted( string.gsub(quests_names[i], ".lua", "") ) then
		 initModQuest(string.gsub(quests_names[i], ".lua", ""), count)
		 end
      end
   end
   for _, q in pairs(quests) do
      if q.onCreate then
         q:onCreate()
      end
   end
end


function initModQuest( name, count )
   local f, err = loadfile( kPathGlobalQuests .. "mods\\" .. name .. ".lua" )
   if err then
      log(string.format("ERROR: Can't load quest %s:", name))
      log(err)
      return
   end
   local quest = f()

   if ( not quests ) then
      quests = {}
   end

   quests[name] = quest
   quest.name = name
   quest.id = count + 1 -- < have to figure this one
   quest.tracked = false
   count = count + 1 
   questSystem:loadQuestScripts( quest )
end