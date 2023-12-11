module Config.Binds where 

import XMonad
import XMonad.Util.Run
import XMonad.Util.NamedScratchpad

import XMonad.Layout.ResizableTile

import Config.Scratchpads
import Config.Variables


myKeys = [ ("M-q",   spawn "kitty --class=XMonadRecomplie -- sh -c \'/usr/bin/xmonad --recompile ; read -p  \"Press Enter to exit...\" cap\'" )
         , ("M-r",   spawn "xmonad --restart"   )
         , ("M-S-q", kill                       )
         , ("M-p",   spawn myRun                )
         , ("M-S-z", spawn myLock)
         
         , ("M-<Escape>",   spawn myPowermenu )
         , ("M-S-<Return>", spawn myTerminal  )
         , ("M-C-<Return>", spawn myBrowser   )
         
         , ("M-S-l", sendMessage MirrorShrink )
         , ("M-S-h", sendMessage MirrorExpand )
         
         , ("M-a s",        namedScratchpadAction scratchpads "spt" )
         , ("M-a d",        namedScratchpadAction scratchpads "dc"  )
         , ("M-a c",        namedScratchpadAction scratchpads "dotconf")
         , ("M-a <Return>", namedScratchpadAction scratchpads "term")
         
         , ("M-s p", spawn "~/.scripts/picom-toggle")
         
         , ("M-z", spawn "playerctl play-pause" )
         , ("M-c", spawn myEditor               )
         
         , ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ -10%" )
         , ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ +10%" )
         , ("<XF86AudioMute>",        spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle" )
         , ("<XF86AudioPlay>",        spawn "playerctl play-pause"                      )
         , ("<XF86AudioPrev>",        spawn "playerctl previous"                        )
         , ("<XF86AudioNext>",        spawn "playerctl next"                            )
         
         , ("<Print>", spawn "scrot -e 'xclip -selection clipboard -t image/png -i $f'" )
         ]