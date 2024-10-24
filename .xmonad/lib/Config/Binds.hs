--  __    __  ________  __      __  _______   ______  __    __  _______    ______  
-- /  |  /  |/        |/  \    /  |/       \ /      |/  \  /  |/       \  /      \ 
-- $$ | /$$/ $$$$$$$$/ $$  \  /$$/ $$$$$$$  |$$$$$$/ $$  \ $$ |$$$$$$$  |/$$$$$$  |
-- $$ |/$$/  $$ |__     $$  \/$$/  $$ |__$$ |  $$ |  $$$  \$$ |$$ |  $$ |$$ \__$$/ 
-- $$  $$<   $$    |     $$  $$/   $$    $$<   $$ |  $$$$  $$ |$$ |  $$ |$$      \ 
-- $$$$$  \  $$$$$/       $$$$/    $$$$$$$  |  $$ |  $$ $$ $$ |$$ |  $$ | $$$$$$  |
-- $$ |$$  \ $$ |_____     $$ |    $$ |__$$ | _$$ |_ $$ |$$$$ |$$ |__$$ |/  \__$$ |
-- $$ | $$  |$$       |    $$ |    $$    $$/ / $$   |$$ | $$$ |$$    $$/ $$    $$/ 
-- $$/   $$/ $$$$$$$$/     $$/     $$$$$$$/  $$$$$$/ $$/   $$/ $$$$$$$/   $$$$$$/  

module Config.Binds where 

import XMonad
import qualified XMonad.StackSet as W
import XMonad.Util.Run
import XMonad.Util.NamedScratchpad
import XMonad.Hooks.ManageDocks
import XMonad.Layout.ResizableTile
import XMonad.Actions.Navigation2D
import XMonad.Actions.CycleWS (moveTo, WSType(..))

import System.Exit

import Config.Scratchpads
import Config.Variables
import Config.ColorSwitch
import Config.Hooks


myKeys themeName = [ ("M-q",   spawn myRecompile)
                   , ("M-r",   spawn "xmonad --restart"                                           )

                   , ("M-S-q", kill                                                               )

                   , ("M-p",   spawn $ (myRun ++ "~/.config/rofi/" ++ themeName ++ "/config.rasi"))
                   , ("M-S-z", spawn myLock                                                       )
                   , ("M-e",   spawn myExplorer                                                   )
                   , ("M-v",   spawn greenclipRofi                                                )
          
                   , ("M-b", sendMessage ToggleStruts)
                   
                   , ("M-<Escape>",   io (exitWith ExitSuccess))

                   , ("M-S-<Return>", spawn myTerminal         )
                   , ("M-C-<Return>", spawn myBrowser          )

                   , (("M-u"), sendMessage NextLayout)
                   , (("M-S-u"), sendMessage $ JumpToLayout "tall")
 

---------------------------------------------------------------------------------------
-- Vim style navigation keys
---------------------------------------------------------------------------------------
                   , ("M-h", windowGo L False)
                   , ("M-j", windowGo D False)
                   , ("M-k", windowGo U False)
                   , ("M-l", windowGo R False)


---------------------------------------------------------------------------------------
-- Vim style resizing keys
---------------------------------------------------------------------------------------
                   , ("M-S-h", sendMessage Shrink)
                   , ("M-S-j", sendMessage MirrorShrink)
                   , ("M-S-k", sendMessage MirrorExpand)
                   , ("M-S-l", sendMessage Expand)

---------------------------------------------------------------------------------------
-- Vim style shifting keys
---------------------------------------------------------------------------------------
                   , ("M-C-h", windowSwap L False)
                   , ("M-C-j", windowSwap D False)
                   , ("M-C-k", windowSwap U False)
                   , ("M-C-l", windowSwap R False)
                    
---------------------------------------------------------------------------------------
-- Comfortable Workspace Switch keys
---------------------------------------------------------------------------------------
                   , ("M-a", windows $ W.greedyView "1")  -- Switch to workspace 1
                   , ("M-s", windows $ W.greedyView "2")  -- Switch to workspace 2
                   , ("M-d", windows $ W.greedyView "3")  -- Switch to workspace 3
                   , ("M-f", windows $ W.greedyView "4")  -- Switch to workspace 4
                   , ("M-g", windows $ W.greedyView "5")  -- Switch to workspace 5
                   
                   , ("M-S-a", windows $ W.shift "1")
                   , ("M-S-s", windows $ W.shift "2")
                   , ("M-S-d", windows $ W.shift "3")
                   , ("M-S-f", windows $ W.shift "4")
                   , ("M-S-g", windows $ W.shift "5")

---------------------------------------------------------------------------------------
-- Scratchpads
---------------------------------------------------------------------------------------

                   , ("M-w s",        namedScratchpadAction scratchpads "spt"     )
                   , ("M-w d",        namedScratchpadAction scratchpads "vc"      )
                   , ("M-w c",        namedScratchpadAction scratchpads "dotconf" )
                   , ("M-w <Return>", namedScratchpadAction scratchpads "term"    )
          
---------------------------------------------------------------------------------------
-- Scripts
---------------------------------------------------------------------------------------
                   , ("M-o b", spawn "rofi-bluetooth"            )
                   , ("M-o e", spawn "rofi -show emoji"          )
                   , ("M-o n", spawn "dunstctl set-paused toggle")
                   , ("M-o s", spawn myScreenshot )

                   , ("M-c", spawn "rofi -show calc -modi calc -no-show-match -no-sort")
                   
                   , ("M-z", spawn "playerctl play-pause" )
                   
---------------------------------------------------------------------------------------
-- Audio keys
---------------------------------------------------------------------------------------
                   , ("<XF86AudioLowerVolume>", spawn "~/.scripts/vol down" )
                   , ("<XF86AudioRaiseVolume>", spawn "~/.scripts/vol up" )
                   , ("<XF86AudioMute>",        spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle" )
                   , ("<XF86AudioPlay>",        spawn "playerctl play-pause"                      )
                   , ("<XF86AudioPrev>",        spawn "playerctl previous"                        )
                   , ("<XF86AudioNext>",        spawn "playerctl next"                            )
                   
                   , ("M-C-s", spawn myFlameshot )
                   ]

