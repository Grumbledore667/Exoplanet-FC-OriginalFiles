local guiContext = CEGUI.System:getSingleton():getDefaultGUIContext()
local wndMgr     = CEGUI.WindowManager:getSingleton()

function OnInit()
   wndLoading    = wndMgr:loadLayoutFromFile( "loading_menu.layout" )
   wndLoadingBar = CEGUI.toProgressBar( wndLoading:getChild( "Progress" ) )

   local scrSize = getScreenSize()

   if ( scrSize.x/scrSize.y < 1.5 ) then
      wndLoading:getChild( "Back" ):setProperty( "Image", "loading_background/4x3" )
   else
      wndLoading:getChild( "Back" ):setProperty( "Image", "loading_background/16x9" )
   end

   guiContext:setRootWindow( wndLoading )
end

-- OnLoading calls 10 times while loading lvl
function OnLoading()
   if ( wndLoadingBar:getProgress() < 1.0 ) then
      wndLoadingBar:setProgress( wndLoadingBar:getProgress() + 0.1 )

      if ( wndLoadingBar:getProgress() > 0.95 ) then
         wndLoading:getChild( "Label" ):setText( "Caching textures" )
      elseif ( wndLoadingBar:getProgress() > 0.85 ) then
         wndLoading:getChild( "Label" ):setText( "Spacebar to Continue" )
      end

      renderFrame()
   end
end

OnInit()
