local oo = require "loop.simple"

local f = require "fun"
local partial = f.partial
local tablex = require "pl.tablex"

local GUIUtils = require "ui.utils"
local ItemsData = require "itemsData"
local ItemsDataRecipes = require "itemsDataRecipes"

local CBaseModule = require "ui.baseModule"

---@class CCraftUI : CBaseModule
local CCraftUI = oo.class({
   layoutName = "craft.layout",
   initAsInteractive = true,
   initPlayerControlled = true,
}, CBaseModule)

--Methods
function CCraftUI:init()
   CBaseModule.init(self)

   self.wasMoved = false
   GUIUtils.widgetSubscribeEventProtected(self.wnd, "Moved", function()
      self.wasMoved = true
   end, false)
   self.items = {}
   self.components = {}

   self.recipesPane = self.wnd:getChild("RecipesPane")

   for recipeName, recipeData in pairs(ItemsDataRecipes.getComposeList()) do
      local craftItem = self:addCraftItem(recipeName, recipeData)
      for itemName, neededCount in pairs(recipeData.recipe) do
         local component = self:addCraftComponent(itemName, neededCount, craftItem.slot:getID())
         table.insert(craftItem.components, component)
      end
   end
end

function CCraftUI:addCraftItem(recipeName, recipeData)
   local craftItem = {}
   local id = #self.items + 1
   local wndName = "Recipe" .. id
   local slot

   if id == 1 then
      slot = self.recipesPane:getChild("Recipe1")
   else
      slot = self.recipesPane:getChild("Recipe1"):clone(true)
      slot:setName(wndName)
      self.recipesPane:addChild(slot)
   end

   slot:setID(id)
   slot:getChild("Container/Image"):setProperty("Image", "gameplay/" .. ItemsData.getItemIcon(recipeData.item))
   slot:getChild("Container/Text"):setProperty("Text", ItemsData.getItemLabel(recipeData.item))
   slot:getChild("Container/Text"):setMargin(CEGUI.UBox(CEGUI.UDim(0, 0), CEGUI.UDim(0.02, 0), CEGUI.UDim(0, 0), CEGUI.UDim(0, 0)))

   GUIUtils.widgetSubscribeEventProtected(slot, "MouseClick", partial(self.onCraftClick, self))
   GUIUtils.widgetSubscribeEventProtected(slot:getChild("Container/Open"), "MouseClick", partial(self.onOpenRecipeClick, self))
   GUIUtils.widgetSubscribeEventProtected(slot, "MouseEntersArea", partial(self.onCraftOver, self))
   GUIUtils.widgetSubscribeEventProtected(slot, "MouseLeavesArea", partial(self.onCraftLeave, self))

   craftItem.slot = slot
   craftItem.counter = slot:getChild("Container/Image/Counter")
   craftItem.text = slot:getChild("Container/Text")
   craftItem.recipeName = recipeName
   craftItem.itemName = recipeData.item
   craftItem.count = 1
   craftItem.recipeTable = recipeData.recipe
   craftItem.components = {}
   craftItem.expanded = false

   table.insert(self.items, craftItem)
   return craftItem
end

function CCraftUI:addCraftComponent(itemName, count, recipeID)
   local craftItem = {}
   local id = #self.components + 1
   local wndName = "Component" .. id
   local slot

   if id == 1 then
      slot = self.recipesPane:getChild("Component1")
   else
      slot = self.recipesPane:getChild("Component1"):clone(true)
      slot:setName(wndName)
      self.recipesPane:addChild(slot)
   end

   slot:setID(id)
   slot:getChild("Container/Image"):setProperty("Image", "gameplay/" .. ItemsData.getItemIcon(itemName))
   slot:getChild("Container/Text"):setProperty("Text", ItemsData.getItemLabel(itemName))
   slot:getChild("Container/Text"):setMargin(CEGUI.UBox(CEGUI.UDim(0, 0), CEGUI.UDim(0.02, 0), CEGUI.UDim(0, 0), CEGUI.UDim(0, 0)))
   GUIUtils.widgetSubscribeEventProtected(slot, "MouseEntersArea", partial(self.onCraftOver, self))
   GUIUtils.widgetSubscribeEventProtected(slot, "MouseLeavesArea", partial(self.onCraftLeave, self))
   slot:setVisible(false)

   craftItem.slot = slot
   craftItem.counter = slot:getChild("Container/Image/Counter")
   craftItem.text = slot:getChild("Container/Text")
   craftItem.itemName = itemName
   craftItem.count = count
   craftItem.recipeID = recipeID

   table.insert(self.components, craftItem)
   return craftItem
end

function CCraftUI:onShow()
   CBaseModule.onShow(self)

   if not self.wasMoved then
      GUIUtils.positionWindowRelativeTo(self.wnd, gameplayUI.inventoryPlayer.wnd, "left", getScreenSize().y * 0.02)
      self.wnd:setYPosition(gameplayUI.inventoryPlayer.wnd:getYPosition())
      self.wasMoved = false --set pos triggers the Moved event so reset it
   end

   self:setup()
   self.onInventoryChangeCallback = getMC():getInventory():subscribeOnChange(partial(self.setup, self))
end

function CCraftUI:onHide()
   CBaseModule.onHide(self)

   gameplayUI.itemDelimiterUI:show(false)
   getMC():getInventory():unsubscribeOnChange(self.onInventoryChangeCallback)
end

function CCraftUI:setup()
   --Pane layout setup
   local yPos = CEGUI.UDim(0, 0)
   local height = CEGUI.UDim(0, self:getRecipeImagePixelHeight())
   for craftItemID, craftItem in ipairs(self.items) do
      if ItemsDataRecipes.isRecipeLearned(craftItem.recipeName) then
         craftItem.slot:setHeight(height) --Adjusted container to the image
         craftItem.slot:setYPosition(yPos)

         yPos = yPos + height

         for componentID, component in ipairs(craftItem.components) do
            if craftItem.expanded then
               craftItem.slot:getChild("Container/Open"):setText("-")
               component.slot:setVisible(true)
               component.slot:setPosition(CEGUI.UVector2(CEGUI.UDim(0, self:getRecipeImagePixelHeight()), yPos))
               yPos = yPos + CEGUI.UDim(0, self:getComponentPixelHeight())
            else
               craftItem.slot:getChild("Container/Open"):setText("+")
               component.slot:setVisible(false)
               component.slot:setYPosition(CEGUI.UDim(0, 0))
            end
         end
      end
   end

   --Recipe and component availability setup
   for _, craftItem in ipairs(self.items) do
      if ItemsDataRecipes.isRecipeLearned(craftItem.recipeName) then
         craftItem.slot:setVisible(true)
         local canCraft = true
         --component is a simple table not an object
         for _, component in ipairs(craftItem.components) do
            local hasItem = getMC():getInventory():getItemByName(component.itemName)
            local color = gameplayUI.worseColor
            local hascount = 0
            if hasItem then
               hascount = hasItem:getCount(true)
               if hascount >= component.count then
                  color = gameplayUI.betterColor
               else
                  canCraft = false
               end
            else
               canCraft = false
            end
            component.counter:setText(hascount .. "/" .. component.count)
            component.counter:setProperty("NormalTextColour", color)
            component.text:setProperty("NormalTextColour", color)
         end
         if canCraft then
            craftItem.text:setProperty("NormalTextColour", gameplayUI.betterColor)
         else
            craftItem.text:setProperty("NormalTextColour", gameplayUI.worseColor)
         end
      else
         craftItem.slot:setVisible(false)
         craftItem.slot:setYPosition(CEGUI.UDim(0, 0))
      end
   end
end

function CCraftUI:craftItem(item, wantCount)
   --item is a simple table not an object
   local pInventory = getMC():getInventory()
   local canCount = pInventory:canStoreItems(item.name, wantCount)
   --Taking into account the bugs that will be converted and destroyed during crafting
   if ItemsData.isItemAlive(item.name) and wantCount > canCount then
      canCount = 0
      for i=1, wantCount do
         for itemName, needCount in pairs(self.clickedRecipe) do
            if ItemsData.isItemAlive(itemName) then
               canCount = math.min(pInventory:getItemLimit("alive"), canCount + needCount)
            end
         end
      end
   end

   for itemName, needCount in pairs(self.clickedRecipe) do
      local hasItem = pInventory:getItemByName(itemName)
      if hasItem then
         canCount = math.min(canCount, math.floor(hasItem:getCount(true) / needCount))
      else
         canCount = 0
         break
      end
   end

   if canCount > 0 then
      for i=1, canCount do
         for itemName, needCount in pairs(self.clickedRecipe) do
            pInventory:destroyItemByName(itemName, needCount, true, false, true)
         end
      end

      addItemToPlayer(item.name, canCount)
   else
      gameplayUI:showInventoryPickInfo("Too many bugs in inventory")
   end
end

function CCraftUI:getRecipeImagePixelHeight()
   return self.items[1].slot:getChild("Container/Image"):getPixelSize().height
end

function CCraftUI:getRecipePixelHeight()
   return self.items[1].slot:getPixelSize().height
end

function CCraftUI:getComponentPixelHeight()
   return self.components[1].slot:getPixelSize().height
end

--Callbacks
function CCraftUI:onCraftClick(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   local clickedID = click_args.window:getID()
   local clickedItem = self.items[clickedID]
   if click_args.button == CEGUI.LeftButton then
      local craftMaxCount = 10000
      for itemName, needCount in pairs(clickedItem.recipeTable) do
         local hasItem = getMC():getInventory():getItemByName(itemName)
         if hasItem then
            craftMaxCount = math.min(craftMaxCount, math.floor(hasItem:getCount(true) / needCount))
         else
            craftMaxCount = 0
            break
         end
      end
      if craftMaxCount > 0 then
         local item = tablex.deepcopy(ItemsData.ItemsInfo[clickedItem.itemName])
         item.name = clickedItem.itemName
         item.count = craftMaxCount
         gameplayUI.itemDelimiterUI:setup(item, "craft")
         gameplayUI.itemDelimiterUI:show(true)
         self.clickedRecipe = clickedItem.recipeTable
      else
         gameplayUI:showInfoTextEx("Not enough components", "minor", "")
      end
   end
end

function CCraftUI:onOpenRecipeClick(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button ~= CEGUI.LeftButton then return end

   local clickedID = click_args.window:getParent():getParent():getID()
   local clickedItem = self.items[clickedID]
   clickedItem.expanded = not clickedItem.expanded
   self:setup()
end

function CCraftUI:onCraftOver(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   click_args.window:setProperty("BackgroundEnabled", "true")
   click_args.window:setProperty("FrameEnabled", "true")
end

function CCraftUI:onCraftLeave(args)
   if CEGUI then
      local click_args = CEGUI.toMouseEventArgs(args)
      if click_args.window then
         click_args.window:setProperty("BackgroundEnabled", "false")
         click_args.window:setProperty("FrameEnabled", "false")
      end
   end
end

return CCraftUI
