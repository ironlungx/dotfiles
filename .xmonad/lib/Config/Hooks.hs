--  ___  ___  ________  ________  ___  __    ________      
-- |\  \|\  \|\   __  \|\   __  \|\  \|\  \ |\   ____\     
-- \ \  \\\  \ \  \|\  \ \  \|\  \ \  \/  /|\ \  \___|_    
--  \ \   __  \ \  \\\  \ \  \\\  \ \   ___  \ \_____  \   
--   \ \  \ \  \ \  \\\  \ \  \\\  \ \  \\ \  \|____|\  \  
--    \ \__\ \__\ \_______\ \_______\ \__\\ \__\____\_\  \ 
--     \|__|\|__|\|_______|\|_______|\|__| \|__|\_________\
--                                             \|_________|


module Config.Hooks where
import XMonad
import XMonad.StackSet as W

import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Util.Run
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run 
import XMonad.Util.Cursor

import XMonad.Layout.ResizableTile
import XMonad.Layout.Spacing
import XMonad.Layout.Gaps
import XMonad.Layout.Renamed
import XMonad.Layout.NoBorders
import XMonad.Layout.ShowWName
import XMonad.Layout.Tabbed
import XMonad.Layout.Decoration
import XMonad.Layout.Tabbed

import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ShowWName

import XMonad.Hooks.DynamicLog

import Config.Variables
import Config.Scratchpads
import Colors

myStartupHook themeName = do
    spawn "picom -b"
    spawn $ ("killall polybar ; polybar main --reload -q -c ~/.config/polybar/" ++ themeName ++ "/config.ini")


    spawn "xsetroot -cursor_name left_ptr"
    spawn "xrdb -merge .Xresources"
    spawn "xclip"
    spawnOnce "greenclip daemon"


    spawn $ "dunst -conf ~/.config/dunst/" ++ themeName
    spawn "~/.fehbg"

    spawn "setxkbmap -layout us -option caps:super"
    spawnOnce "/usr/lib/xfce-polkit/xfce-polkit"

    spawnOnce "devmon --exec-on-drive 'notify-send \"New USB storage connected\" \"A new USB device %l was detected\nMount point: %d\"'"
    
    spawnOnce "~/.scripts/focus daemon"

    setWMName "XMonad"

myLayoutHook colorScheme = tall
            ||| mTall
            ||| monocle
            ||| tabs
  where 
    gap = [(U,3), (R,3), (L,3), (D, 6)]
    tall = renamed [Replace "tall"]
         $ spacingWithEdge 3
         $ avoidStruts $ gaps (gap)
         $ tiled

    mTall = renamed [Replace "mTall"] 
            $ spacingWithEdge 3
            $ avoidStruts $ gaps (gap)
            $ Mirror tiled
    monocle = noBorders
             $ renamed [Replace "monocle"] 
             -- $ gaps [(D,4)]
             $ avoidStruts
             $ Full
    tabs = renamed [Replace "tabs"] 
         $ avoidStruts $ gaps (gap)
         $ tabbed shrinkText tabbedTheme
  
    tabbedTheme = def { fontName = "xft:Ubuntu:regular:size=10:antialias=true:hinting=true" 
                      , activeColor = (color15 colorScheme)
                      , inactiveColor = (color04 colorScheme)
                      , activeBorderColor = (color15 colorScheme)
                      , inactiveBorderColor = (colorBack colorScheme)
                      , activeTextColor = (colorBack colorScheme)
                      , inactiveTextColor = (color14 colorScheme)
    }

    tiled   = ResizableTall nmaster delta ratio []
    nmaster = 1
    ratio   = 4/7
    delta   = 3/100



myManageHook = namedScratchpadManageHook scratchpads <> composeAll 
             [ ((className =? "XMonadRecompile")  --> (doRectFloat $ W.RationalRect 0.25 0.25 0.5 0.5 ))
             , className =? "confirm"             --> doFloat
             , className =? "file_progress"       --> doFloat
             , className =? "dialog"              --> doFloat
             , className =? "download"            --> doFloat
             , className =? "error"               --> doFloat
             , className =? "steam"               --> doFloat
             , className =? "Xfce-polkit"               --> doFloat
             , className =? "Zenity"              --> doFloat
             , stringProperty "WM_NAME" =? "vesktop"             --> doIgnore
             , stringProperty "_NET_WM_WINDOW_TYPE" =? "_NET_WM_WINDOW_TYPE_DIALOG" --> doFloat
             -- WM_WINDOW_ROLE(STRING) = "GtkFileChooserDialog"
             , resource  =? "desktop_window" --> doCenterFloat

             , checkDock --> doLower
             , title =? "polybar-infobar"         --> (doRaise <+> doShift "" <+> doF W.shiftMaster <+> doF W.swapUp) 
             ] 

myLogHook file = def { 
    -- Pipe the output to cp
    -- ppOutput = hPutStrLn h
    ppOutput = writeFile file
    
-- Print icons based on the layout
  , ppLayout = 
        \layout      -> case layout of
          "tall"     -> "\985629"
          "mTall"    -> "\986732"
          "monocle"  -> "\60405" 
          "tabs"     -> "\984297"
          _          -> layout

  -- Disable Everything apart from layout
  , ppTitle   = const ""
  , ppCurrent = const ""
  , ppVisible = const "" 
  , ppHidden  = const ""
}
