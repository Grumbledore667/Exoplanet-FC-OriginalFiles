local oo = require "loop.simple"

local f = require "fun"
local partial = f.partial

local GUIUtils = require "ui.utils"

local CInventoryTradeUI = require "ui.inventoryTradeUI"
local CBaseModule = require "ui.baseModule"

---@class CTradingUI : CBaseModule
local CTradingUI = oo.class({
   layoutName = "trade.layout",
   initAsInteractive = true,
   initPlayerControlled = true,
}, CBaseModule)

--Internal
local function whitelistItems(items)
   local whitelist = getMC().exchangeTarget.tradeWhitelist
   local whitelistedItems = {}
   local guns_all = inList(whitelist, "guns_all")
   local weapons_all = inList(whitelist, "weapons_all")
   local ammo_all = inList(whitelist, "ammo_all")
   local attire_all = inList(whitelist, "attire_all")
   for _,item in pairs(items) do
      if (inList(whitelist, item:getItemName())
         or (guns_all    and item:isRangedWeapon())
         or (weapons_all and item:isMeleeWeapon())
         or (attire_all and item:isAttire())
         or (ammo_all    and item:isAmmo()))
         and not item:isQuestItem() then
         table.insert(whitelistedItems, item)
      end
   end
   return whitelistedItems
end

--Methods
function CTradingUI:init()
   CBaseModule.init(self)

   self.traderInventory = CInventoryTradeUI{ containerWnd = self.wnd:getChild("traderInventory"), minRowCount = 6, currentTab = "TabAll", targetInventoryName = "buyInventory" }
   self.traderInventory:init()

   self.playerInventory = CInventoryTradeUI{ containerWnd = self.wnd:getChild("playerInventory"), minRowCount = 6, currentTab = "TabAll", targetInventoryName = "sellInventory" }
   self.playerInventory:init()
   --Create additional rows beforehand so the player doesn't lag during the first trade use with lots of items
   self.playerInventory:addRows(30)
   self.playerInventory:showRows(30, false)

   self.buyInventory = CInventoryTradeUI{ containerWnd = self.wnd:getChild("buyInventory"), minRowCount = 5, rowWidth = 2, targetInventoryName = "traderInventory" }
   self.buyInventory:init()

   self.sellInventory = CInventoryTradeUI{ containerWnd = self.wnd:getChild("sellInventory"), minRowCount = 5,  rowWidth = 2, targetInventoryName = "playerInventory" }
   self.sellInventory:init()

   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("Balance"), "Clicked", partial(self.onTradeBalance, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("Accept"), "Clicked", partial(self.onTradeAccept, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("Clear"), "Clicked", partial(self.onClearTradeOffers, self))

   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("DebugDiscountInc"), "MouseClick", partial(self.onDebugChangeDiscount, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("DebugDiscountDec"), "MouseClick", partial(self.onDebugChangeDiscount, self))
end

function CTradingUI:setup()
   local char = getMC().exchangeTarget
   if not char then return end

   self.playerInventory:remapItemsList(whitelistItems(getMC():getInventory():getItems()))
   self.playerInventory:resetTabs()
   self.traderInventory:remapItemsList(char:getTradeInventory():getItems())
   self.traderInventory:resetTabs()
   self.buyInventory:setup()
   self.sellInventory:setup()

   self:setupDiscounts()
   self:updateCountLabels()

   self.wnd:getChild("DebugDiscountInc"):setVisible(isDebug())
   self.wnd:getChild("DebugDiscountDec"):setVisible(isDebug())
end

function CTradingUI:setupDiscounts()
   local char = getMC().exchangeTarget
   local buyMul = getGlobalParam(char:getName() .. "_buyFromVendorMul") or 1
   buyMul = (buyMul - 1) * 100
   local sellMul = getGlobalParam(char:getName() .. "_sellToVendorMul") or 1
   sellMul = (sellMul - 1) * 100
   local buyColor = gameplayUI.whiteTag
   local sellColor = gameplayUI.whiteTag

   if buyMul > 0 then
      buyMul = "+" .. buyMul
      buyColor = gameplayUI.worseColorTag
   elseif buyMul < 0 then
      buyColor = gameplayUI.betterColorTag
   end
   if sellMul > 0 then
      sellMul = "+" .. sellMul
      sellColor = gameplayUI.betterColorTag
   elseif sellMul < 0 then
      sellColor = gameplayUI.worseColorTag
   end

   self.wnd:getChild("BuyMul"):setText("buying price " .. buyColor .. buyMul .. "%")
   self.wnd:getChild("SellMul"):setText("selling price " .. sellColor .. sellMul .. "%")
end

function CTradingUI:onShow()
   CBaseModule.onShow(self)

   self:setup()
end

function CTradingUI:onHide()
   CBaseModule.onHide(self)

   getMC():stopTrade()
   gameplayUI.itemDelimiterUI:show(false)

   if self.debugBackupMuls then
      setGlobalParam(self.debugBackupMuls.buy.str, self.debugBackupMuls.buy.mul)
      setGlobalParam(self.debugBackupMuls.sell.str, self.debugBackupMuls.sell.mul)
      self.debugBackupMuls = nil
   end

   self.buyInventory.items = {}
   self.sellInventory.items = {}
end

function CTradingUI:updateCountLabels()
   self.traderInventory.wnd:getChild("ShardsCount"):setText(self.traderInventory:getItemCount("antigravium_shards.itm"))
   self.playerInventory.wnd:getChild("ShardsCount"):setText(self.playerInventory:getItemCount("antigravium_shards.itm"))
   local pInventory = getMC():getInventory()
   self.playerInventory.wnd:getChild("BugAliveCount"):setText(pInventory:getItemCountByLimitCategory("alive") .. "/" .. pInventory:getItemLimit("alive"))
end


--Callbacks
function CTradingUI:onClearTradeOffers()
   self.buyInventory.items = {}
   self.sellInventory.items = {}
   self.buyInventory:setup()
   self.sellInventory:setup()
   local player = getMC()
   local trader = getMC().exchangeTarget
   self.playerInventory:remapItemsList(whitelistItems(player:getInventory().items))
   self.traderInventory:remapItemsList(trader:getTradeInventory().items)
end

function CTradingUI:onTradeBalance()
   --Move back money for easier accounting
   local moneyName = "antigravium_shards.itm"
   local moneyItem1 = self.buyInventory:getItem(moneyName)
   local moneyItem2 = self.sellInventory:getItem(moneyName)
   self.buyInventory:moveItem(moneyItem1, self.buyInventory:getItemCount(moneyName), "traderInventory")
   self.sellInventory:moveItem(moneyItem2, self.sellInventory:getItemCount(moneyName), "playerInventory")

   local buySum = tonumber(self.buyInventory.wnd:getChild("Sum"):getText())
   local sellSum = tonumber(self.sellInventory.wnd:getChild("Sum"):getText())
   local diff = buySum - sellSum

   local traderMoney = self.traderInventory:getItemCount(moneyName)
   local playerMoney = self.playerInventory:getItemCount(moneyName)

   if diff < 0 and traderMoney >= math.abs(diff) then
      --Trader has enough money to balance the trade
      local traderMoneyItem = self.traderInventory:getItem(moneyName)
      self.traderInventory:moveItem(traderMoneyItem, math.abs(diff), "buyInventory")
   elseif diff > 0 and playerMoney >= diff then
      --Player has enough money to balance the trade
      local playerMoneyItem = self.playerInventory:getItem(moneyName)
      self.playerInventory:moveItem(playerMoneyItem, math.abs(diff), "sellInventory")
   elseif diff == 0 and buySum ~= 0 then
      --Perfect balance
   elseif diff > 0 and playerMoney < diff then
      gameplayUI:showInfoTextEx("You don't have enough money", "minor", "")
   elseif diff < 0 and traderMoney < math.abs(diff) then
      gameplayUI:showInfoTextEx("Trader doesn't have enough money", "minor", "")
   end
end

function CTradingUI:onTradeAccept()
   local player = getMC()
   local trader = getMC().exchangeTarget
   local buySum = tonumber(self.buyInventory.wnd:getChild("Sum"):getText())
   local sellSum = tonumber(self.sellInventory.wnd:getChild("Sum"):getText())
   if buySum == sellSum and buySum ~= 0 then
      for _,itemTable in ipairs(self.buyInventory.items) do
         local item = itemTable.item
         trader:getTradeInventory():giveItemTo(item, player:getInventory(), itemTable.count)
         questSystem:fireEvent("buyItemFrom", trader:getName(), item)
      end
      for _,itemTable in ipairs(self.sellInventory.items) do
         local item = itemTable.item
         player:getInventory():giveItemTo(item, player.exchangeTarget:getTradeInventory(), itemTable.count, true)
         questSystem:fireEvent("sellItemTo", trader:getName(), item)
      end
      self:onClearTradeOffers()
      self.playerInventory:remapItemsList(whitelistItems(player:getInventory():getItems()))
      self.traderInventory:remapItemsList(trader:getTradeInventory():getItems())
   end
   self:updateCountLabels()
end

function CTradingUI:onDebugChangeDiscount(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button ~= CEGUI.LeftButton then return end
   local name = click_args.window:getName()
   local char = getMC().exchangeTarget
   local buyStr = char:getName() .. "_buyFromVendorMul"
   local sellStr = char:getName() .. "_sellToVendorMul"

   if not self.debugBackupMuls then
      self.debugBackupMuls = {
         buy = {str = buyStr, mul = getGlobalParam(buyStr)},
         sell = {str = sellStr, mul = getGlobalParam(sellStr)}
      }
   end

   if name == "DebugDiscountInc" then
      setGlobalParam(buyStr, (getGlobalParam(buyStr) or 1) - 0.05)
      setGlobalParam(sellStr, (getGlobalParam(sellStr) or 1) + 0.05)
   elseif name == "DebugDiscountDec" then
      setGlobalParam(buyStr, (getGlobalParam(buyStr) or 1) + 0.05)
      setGlobalParam(sellStr, (getGlobalParam(sellStr) or 1) - 0.05)
   end
   self:setupDiscounts()
   self.buyInventory:updateItemSum()
   self.sellInventory:updateItemSum()
end


return CTradingUI
