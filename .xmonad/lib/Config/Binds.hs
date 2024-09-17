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
                    
                   , ("M-a s",        namedScratchpadAction scratchpads "spt"     )
                   -- , ("M-a d",        namedScratchpadAction scratchpads "dc"      )
                   , ("M-a d",        namedScratchpadAction scratchpads "vc"      )
                   , ("M-a c",        namedScratchpadAction scratchpads "dotconf" )
                   , ("M-a <Return>", namedScratchpadAction scratchpads "term"    )
          
                   , ("M-s p", spawn "~/.scripts/picom-toggle" )
                   , ("M-s b", spawn "rofi-bluetooth"          )
                   , ("M-s e", spawn "rofi -show emoji"        )
                   
                   , ("M-z", spawn "playerctl play-pause" )
                   , ("M-y", promptForTheme)
                   
                   , ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ -10%" )
                   , ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ +10%" )
                   , ("<XF86AudioMute>",        spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle" )
                   , ("<XF86AudioPlay>",        spawn "playerctl play-pause"                      )
                   , ("<XF86AudioPrev>",        spawn "playerctl previous"                        )
                   , ("<XF86AudioNext>",        spawn "playerctl next"                            )
                   
                   , ("M-S-s", spawn myScreenshot )
                   , ("S-<Print>", spawn myFlameshot )
                   ]

