local api = {}

local BonusLabels =
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

local MiscLabels =
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
   ["flareFire"] =
   {
      label =
      {
         eng = "Flare Fire",
      },
   },
   ["cactusPoison"] =
   {
      label =
      {
         eng = "Cactus Poison",
      },
   },
   ["scampShock"] =
   {
      label =
      {
         eng = "Electric Shock",
      },
   },
}

local ItemQualityLabels = {
   [1] = {eng = "Weathered"},
   [2] = {eng = "Good"},
   [3] = {eng = "Excellent"},
   [4] = {eng = "Mastercrafted"},
   [5] = {eng = "Unique"},
   [6] = {eng = "Legendary"},
}

local ItemTypeLabel = {
   boxing    = {eng = "Your Trusty Fists"},
   melee_low = {eng = "One-Handed Melee"},
   pistol    = {eng = "Pistol"},
   shotgun   = {eng = "Shotgun"},
   carbine   = {eng = "Lever Action Rifle"},
   ammo      = {eng = "Ammo"},
   attire    = {eng = "Attire"},
   gadget    = {eng = "Gadget"},
   accessory = {eng = "Accessory"},
   quest     = {eng = "Quest Item"},
   food      = {eng = "Food"},
   drink     = {eng = "Drink"},
   smokable  = {eng = "Drug"},
   meds      = {eng = "Meds"},
   tech      = {eng = "Scrap"},
   misc      = {eng = "Miscellaneous"},
   message   = {eng = "Message"},
   drawing   = {eng = "Drawing"},
   map       = {eng = "Area Map"},
}

function api.getItemTypeLabel(str)
   if not str then return end
   return ItemTypeLabel[str] and ItemTypeLabel[str].eng
end

function api.getItemQualityLabel(qualityInt)
   if not qualityInt then return end
   return ItemQualityLabels[qualityInt] and ItemQualityLabels[qualityInt].eng
end

function api.getBonusLabel(name)
   if not name then return end

   local info = BonusLabels[name]
   if info then
      return info.label.eng
   else
      local label = ""
      for word in string.gmatch(name,"(%u?%l?%l+%l)") do
         if word == "Max" then
            label = string.format("%s %s", BonusLabels[word].label.eng, label)
         elseif word == "Regen" then
            label = string.format("%s %s", label, BonusLabels[word].label.eng)
         elseif word == "Percentage" then
            label = string.format("%s %s", label, BonusLabels[word].label.eng)
         elseif word == "Flat" or word == "Mult" or word == "Ovrd" then
            label = string.format("%s %s", label, BonusLabels[word].label.eng)
         elseif BonusLabels[word] then
            label = label .. BonusLabels[word].label.eng or ""
         end
      end
      return label
   end
end

function api.getLabel(name)
   if not name then return end

   local info = MiscLabels[name]
   if info then
      return info.label.eng
   end
   return ""
end

return api
