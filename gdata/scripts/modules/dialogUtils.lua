local ItemsData = (require "itemsData")
local dialogUtils = {}

function dialogUtils.makeBlankMessage(root, data)
   local msg = {
      actor = 1,
      time = 2,
      text = "",
      script = "",
      dialog = root,
      messages = {}
   }
   if data then
      for k, v in pairs(data) do
         msg[k] = v
      end
   end
   return msg
end

function dialogUtils.paginateNestedMessages(nested, root, bidirectional, msgIncludedInEachPage)
   local function makePrev() return dialogUtils.makeBlankMessage(root, {text="Prev"}) end
   local function makeNext() return dialogUtils.makeBlankMessage(root, {text="Next"}) end
   local result
   local prev = makePrev()
   local cur = makePrev()
   local nxt = makeNext()
   for i=1,#nested do
      nxt = makeNext()
      if i == 1 then
         table_concat(cur.messages, nested[1])
         table.insert(cur.messages, nxt)
         table.insert(cur.messages, msgIncludedInEachPage)
         result = cur.messages
      elseif i < #nested then
         local tmp = prev.messages
         prev = makePrev()
         prev.messages = tmp

         if bidirectional then
            table.insert(cur.messages, prev)
         end
         table_concat(cur.messages, nested[i])
         table.insert(cur.messages, nxt)
         table.insert(cur.messages, msgIncludedInEachPage)
      else
         local tmp = prev.messages
         prev = makePrev()
         prev.messages = tmp

         if bidirectional then
            table.insert(cur.messages, prev)
         end
         table_concat(cur.messages, nested[i])
         table.insert(cur.messages, msgIncludedInEachPage)
      end
      prev = cur
      cur = nxt
   end

   return result
end

function dialogUtils.paginateMessages(messages, root, maxPerPage, bidirectional, msgIncludedInEachPage)
   local maxFirstPage = maxPerPage
   if bidirectional then
      maxPerPage = maxPerPage - 1
   end
   if msgIncludedInEachPage then
      maxPerPage = maxPerPage - 1
      maxFirstPage = maxFirstPage - 1
   end
   if #messages <= maxFirstPage then
      local result = {}
      table_concat(result, messages)
      if msgIncludedInEachPage then
         table.insert(result, msgIncludedInEachPage)
      end
      return result
   else
      local nested = nestTable(messages, maxPerPage - 1, maxFirstPage - 1)
      return dialogUtils.paginateNestedMessages(nested, root, bidirectional, msgIncludedInEachPage)
   end
end

function dialogUtils.generateSellDialog(root, whitelist)
   local p = getPlayer()
   local info = ItemsData.ItemsInfo
   local messages = {}

   local function onStart(name, value, count)
      count = count or 1
      return function()
         addItemsToPlayer("antigravium_shards.itm", value * count)
         removeItemFromPlayer(name, count)
      end
   end

   for k, v in pairs(p.itemsManager.items) do
      local i = info[v.name]
      if i and i.value and (whitelist == nil or getKeyByValue(whitelist, v.name) ~= nil) then
         local name = v.name
         local value = math.max(math.floor(i.value / 5), 1)
         local count = v.count

         local sell = dialogUtils.makeBlankMessage(root)
         sell.text = string.format("\\[SELL] Item: %s       Price: %d         Total in inventory: %d", ItemsData.getItemLabel(name), value, count)
         sell.actor = 1

         for _, amount in pairs{1,5,10,100,"all"} do
            if amount == "all" and not inList({1,5,10,100}, count) then amount = count end
            if amount ~= "all" and hasPlayerItemCount(name, amount) then
               local sellMulti = dialogUtils.makeBlankMessage(root)
               sellMulti.text = string.format("\\[SELL] %d items for %d shards   \\[%s]", amount, value * amount, ItemsData.getItemLabel(v.name))
               sellMulti.actor = 1
               sellMulti.onStart = onStart(name, value, amount)

               table.insert(sell.messages, sellMulti)
            end
         end
         table.insert(sell.messages, dialogUtils.makeBlankMessage(root, {text="\\[CANCEL]"}))


         table.insert(messages, sell)
      end
   end

   local paginated
   if #messages then
      local endMsg = dialogUtils.makeBlankMessage(root, {text="\\[END]"})
      paginated = dialogUtils.paginateMessages(messages, root, 6, false, endMsg)
   end
   return paginated
end

function dialogUtils.generateBuyDialog(root, whitelist)
   local info = ItemsData.ItemsInfo
   local messages = {}
   local function isVisible(value)
      return function()
         return hasPlayerItemCount("antigravium_shards.itm", value)
      end
   end
   local function onStart(name, count, value)
      return function()
         if count == 1 then
            addItemToPlayer(name)
         else
            addItemsToPlayer(name, count)
         end
         removeItemFromPlayer("antigravium_shards.itm", value)
      end
   end

   for k, v in pairs(info) do
      if v.value and (whitelist == nil or getKeyByValue(whitelist, k) ~= nil) then
         local buy = dialogUtils.makeBlankMessage(root)
         buy.text = string.format("\\[BUY]         %d         %s", v.value, ItemsData.getItemLabel(k))
         buy.actor = 1

         for kk, vv in pairs({1,5,10,50,100}) do
            local num = dialogUtils.makeBlankMessage(root)
            num.text = string.format("\\[BUY]   %d   for    %d", vv, vv * v.value)
            num.actor = 1

            local canBuy = dialogUtils.makeBlankMessage(root)
            canBuy.actor = 2
            canBuy.isVisible = isVisible(v.value * vv)
            canBuy.onStart = onStart(k, vv, v.value * vv)
            canBuy.messages = {dialogUtils.makeBlankMessage(root)}

            local cantBuy = dialogUtils.makeBlankMessage(root)
            cantBuy.text = "You don't have enough shards"
            cantBuy.time = 2
            cantBuy.actor = 2

            num.messages = {canBuy, cantBuy }
            table.insert(buy.messages, num)
         end

         local endMsg = dialogUtils.makeBlankMessage(root)
         endMsg.actor = 1
         endMsg.text = "\\[CANCEL]"
         table.insert(buy.messages, endMsg)

         table.insert(messages, buy)
      end
   end

   local paginated
   if #messages then
      local endMsg = dialogUtils.makeBlankMessage(root, {text="\\[END]"})
      paginated = dialogUtils.paginateMessages(messages, root, 6, false, endMsg)
   end
   return paginated
end

return dialogUtils