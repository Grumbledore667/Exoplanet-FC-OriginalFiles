local bonusLabels =
{
   ["Max"] =
   {
      label =
      {
         eng = "Max",
      },
   },
   ["Flat"] =
   {
      label =
      {
         eng = "",
      },
   },
   ["Mult"] =
   {
      label =
      {
         eng = "x",
      },
   },
   ["Ovrd"] =
   {
      label =
      {
         eng = "Override",
      },
   },
   ["Regen"] =
   {
      label =
      {
         eng = "Regeneration",
      },
   },
   ["Percentage"] =
   {
      label =
      {
         eng = "%",
      },
   },
   ["armor"] =
   {
      label =
      {
         eng = "Armor",
      },
   },
   ["health"] =
   {
      label =
      {
         eng = "Health",
      },
   },
   ["stamina"] =
   {
      label =
      {
         eng = "Stamina",
      },
   },
   ["energy"] =
   {
      label =
      {
         eng = "Energy",
      },
   },
   ["food"] =
   {
      label =
      {
         eng = "Satiety",
      },
   },
   ["water"] =
   {
      label =
      {
         eng = "Hydration",
      },
   },
   ["sleep"] =
   {
      label =
      {
         eng = "Sleep",
      },
   },
}

local miscLabels =
{
   ["foodBuff"] =
   {
      label =
      {
         eng = "Eating",
      },
   },
   ["badFoodDebuff"] =
   {
      label =
      {
         eng = "Bad Food",
      },
   },
   ["drinkBuff"] =
   {
      label =
      {
         eng = "Hydration",
      },
   },
   ["alcoholBuff"] =
   {
      label =
      {
         eng = "Intoxication",
      },
   },
   ["medicineBuff"] =
   {
      label =
      {
         eng = "Healing",
      },
   },
   ["medicineRegenBuff"] =
   {
      label =
      {
         eng = "Regeneration",
      },
   },
   ["smokeBuff"] =
   {
      label =
      {
         eng = "High",
      },
   },
   ["blockStaminaRegenDebuff"] =
   {
      label =
      {
         eng = "Blocked Stamina Regeneration",
      },
   },
}

local function getBonusLabel( name )
   if not name then return end

   local info = bonusLabels[name]
   if info then
      return info.label.eng
   else
      local label = ""
      for word in string.gmatch( name,"(%u?%l?%l+%l)" ) do
         if word == "Max" then
            label = string.format( "%s %s", bonusLabels[word].label.eng, label )
         elseif word == "Regen" then
            label = string.format( "%s %s", label, bonusLabels[word].label.eng )
         elseif word == "Percentage" then
            label = string.format( "%s %s", label, bonusLabels[word].label.eng )
         elseif word == "Flat" or word == "Mult" or word == "Ovrd" then
            label = string.format( "%s %s", label, bonusLabels[word].label.eng )
         elseif bonusLabels[word] then
            label = label .. bonusLabels[word].label.eng or ""
         end
      end
      return label
   end
end

local function getLabel( name )
   if not name then return end

   local info = miscLabels[name]
   if info then
      return info.label.eng
   end
   return ""
end

return {
   bonusLabels=bonusLabels,
   getBonusLabel=getBonusLabel,
   miscLabels=miscLabels,
   getLabel=getLabel,
}
