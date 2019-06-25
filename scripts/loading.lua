local guiContext = CEGUI.System:getSingleton():getDefaultGUIContext()
local wndMgr     = CEGUI.WindowManager:getSingleton()

if not _G.log then
   _G.log = require "global.debug".log
end

local random = require "random"

local keys = require "global.keys"
keys.init()

local pData = require "global.persistentData"
local i18n = require "i18n"

local Template = require "pl.text".Template

---@type CEGUI.Window
local wndLoading

---@type CEGUI.ProgressBar
local wndLoadingBar

local function OnInit()
   CEGUI.SchemeManager:getSingleton():createFromFile("TaharezLook.scheme")
   guiContext:setDefaultFont("venus rising rg-10")
   guiContext:getMouseCursor():setDefaultImage("TaharezLook/MouseArrow")

   wndLoading    = wndMgr:loadLayoutFromFile("loading_menu.layout")
   wndLoadingBar = CEGUI.toProgressBar(wndLoading:getChild("VerticalLayoutContainer/Progress"))

   pData.init()

   local loadingStrings = require "strings.loading_screen"

   -- only load a subset of strings since loading screen runs in an isolated lua context
   i18n.load(loadingStrings)
   i18n.setLocale("en")

   local function buttonNameGetter(val)
      return keys.getButtonCurrentKeyName(string.upper(val))
   end

   local wndTip = wndLoading:getChild("VerticalLayoutContainer/Tip")
   --Randomize loading backround and tip text only if it's NOT a new game
   if pData.getPersistentTable().isLoadedGame then
      local backgrounds = {
         "loading_background/16x9",
         "loading_background2/16x9",
         "loading_background3/16x9",
         "loading_background4/16x9",
         "loading_background5/16x9",
      }
      local aspectModes = {
         "Expand",
         "Expand",
         "Shrink",
         "Shrink",
         "Shrink",
      }
      local index = random.random(1, #backgrounds)
      wndLoading:getChild("Back"):setProperty("Image", backgrounds[index])
      wndLoading:getChild("Back"):setProperty("AspectMode", aspectModes[index])

      local tips = {}
      for _, tip in pairs(i18n"loading_screen.tips_keys") do
         table.insert(tips, Template(tip):safe_substitute(buttonNameGetter))
      end

      local tipsRest = i18n"loading_screen.tips_rest"
      for _, tip in pairs(tipsRest) do
         table.insert(tips, tip)
      end

      wndTip:setText(random.choice(tips))
   else
      wndTip:setText(i18n"loading_screen.new_game")
   end

   guiContext:setRootWindow(wndLoading)
   CEGUI.System:getSingleton():injectTimePulse(0)
   guiContext:injectTimePulse(0)
end

-- called from the engine to update progress bar
function OnUpdateLoading(step, maxStep)
   local progress = step / maxStep;

   wndLoadingBar:setProgress(progress)

   if step == maxStep then
      local wndLabel = wndLoading:getChild("VerticalLayoutContainer/Label")
      wndLabel:setText(i18n"loading_screen.caching_textures")
   end

   renderFrame()
end

OnInit()
