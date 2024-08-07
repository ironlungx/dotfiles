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

    spawn "xclip"
    spawn "xsetroot -cursor_name Bibata-Modern-Ice"
    spawnOnce "greenclip daemon"

    spawn $ "dunst -conf ~/.config/dunst/" ++ themeName
    spawn $ "feh --bg-fill --no-fehbg " ++ myWallpaper

    spawn "setxkbmap -layout us -option caps:super"
    spawnOnce "/usr/lib/xfce-polkit/xfce-polkit"
    setWMName "XMonad"

myLayoutHook colorScheme = tall
            ||| mTall
            ||| monocle
            ||| tabs
  where 
    tall = renamed [Replace "tall"]
         $ spacingWithEdge 5
         $ avoidStruts $ gaps ([(U,5), (R,5), (L,5)])
         $ tiled

    mTall = renamed [Replace "mTall"] 
            $ spacingWithEdge 5
            $ avoidStruts $ gaps ([(U,5), (R,5), (L,5)])
            $ Mirror tiled
    monocle  = renamed [Replace "monocle"] 
             $ noBorders
             -- $ spacingWithEdge 2
             $ avoidStruts
             $ Full
    tabs = renamed [Replace "tabs"] 
         $ avoidStruts $ gaps ([(U,5), (R,5), (L,5)])
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
             [ ((className =? "XMonadRecomplie")  --> (doRectFloat $ W.RationalRect 0.25 0.25 0.5 0.5 ))
             , className =? "confirm"             --> doFloat
             , className =? "file_progress"       --> doFloat
             , className =? "dialog"              --> doFloat
             , className =? "download"            --> doFloat
             , className =? "error"               --> doFloat
             , className =? "steam"               --> doFloat

             , checkDock                          --> doLower
             , title     =? "polybar-infobar"     --> doRaise
             
             ] 

myLogHook h = def { 
    -- Pipe the output to cp
    ppOutput = hPutStrLn h
    
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
