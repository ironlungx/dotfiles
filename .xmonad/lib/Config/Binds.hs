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

import System.Exit

import Config.Scratchpads
import Config.Variables


myKeys themeName = [ ("M-q",   spawn $ (myTerminal ++ " --class=XMonadRecomplie -- sh -c \'/usr/bin/xmonad --recompile || read -p  \"Press Enter to exit...\" cap\'" ))
                   , ("M-r",   spawn "xmonad --restart"                                           )
                   , ("M-S-q", kill                                                               )
                   , ("M-p",   spawn $ (myRun ++ "~/.config/rofi/" ++ themeName ++ "/config.rasi"))
                   , ("M-S-z", spawn myLock                                                       )
                   , ("M-e",   spawn myExplorer                                                   )
                   , ("M-v",   spawn greenclipRofi                                                )
          
                   , ("M-b", sendMessage ToggleStruts)
          
                   , ("M-<L>", windows W.focusUp   )
                   , ("M-<R>", windows W.focusDown )
                   , ("M-<U>", windows W.focusUp   )
                   , ("M-<D>", windows W.focusDown )
                   
                   , ("M-<Escape>",   io (exitWith ExitSuccess))
                   , ("M-S-<Return>", spawn myTerminal         )
                   , ("M-C-<Return>", spawn myBrowser          )
          
                   , ("M-S-h", sendMessage MirrorExpand )
                   , ("M-S-l", sendMessage MirrorShrink )
                   
                   , ("M-a s",        namedScratchpadAction scratchpads "spt"     )
                   , ("M-a d",        namedScratchpadAction scratchpads "dc"      )
                   , ("M-a c",        namedScratchpadAction scratchpads "dotconf" )
                   , ("M-a <Return>", namedScratchpadAction scratchpads "term"    )
          
                   , ("M-s p", spawn "~/.scripts/picom-toggle")
                   
                   , ("M-z", spawn "playerctl play-pause" )
                   , ("M-c", spawn myEditor               )
                   
                   , ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ -10%" )
                   , ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ +10%" )
                   , ("<XF86AudioMute>",        spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle" )
                   , ("<XF86AudioPlay>",        spawn "playerctl play-pause"                      )
                   , ("<XF86AudioPrev>",        spawn "playerctl previous"                        )
                   , ("<XF86AudioNext>",        spawn "playerctl next"                            )
                   
                   , ("<Print>", spawn myScreenshot )
                   , ("S-<Print>", spawn myFlameshot )
                   ]
