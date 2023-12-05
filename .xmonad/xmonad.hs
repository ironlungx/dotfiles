import XMonad

import Data.List 
import Graphics.X11.ExtraTypes.XF86
import System.Exit


import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.ManageHook

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Util.EZConfig (additionalKeysP, additionalMouseBindings)
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Util.NamedScratchpad
import XMonad.Util.Cursor

import XMonad.Layout.ResizableTile
import XMonad.Layout.Spacing
import XMonad.Layout.Gaps

import XMonad.StackSet as W

import Colors.GruvboxDark

myTerminal    = "kitty"
myBrowser     = "min"
myRun         = "~/.config/polybar/forest/scripts/launcher.sh"
myEditor      = "codium -n --profile Default"
myWallpaper   = "~/.wallpapers/groovy.jpg"
myLock        = "i3lock-fancy -t \"\""
myPowermenu   = "~/.config/polybar/forest/scripts/powermenu.sh"

myLayout = tiled ||| Mirror tiled ||| Full
    where
        tiled   = ResizableTall nmaster delta ratio []
        nmaster = 1
        ratio   = 1/2
        delta   = 3/100

myStartupHook :: X ()
myStartupHook = do
    spawn "picom -b"
    spawn "~/.config/polybar/launch.sh --forest"
    spawn "xclip"
    spawn "/usr/bin/emacs --daemon"
    spawn $ "feh --bg-fill --no-fehbg " ++ myWallpaper


myManageHook :: ManageHook
myManageHook = composeAll 
    [title =? "XMonadRecompile" --> doFloat]

scratchpads = [
    NS "spt" "LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify" (className =? "Spotify") center,
    NS "dc" "discord" (className =? "discord") center,
    NS "dotconf" "codium -n config.code-workspace --profile \"dotfile config\"" (title =? "dotconf") center
  ]
  where 
    center = customFloating $ W.RationalRect l t w h
                   where
                     h = 0.7
                     w = 0.7
                     t = 0.85 -h
                     l = 0.85 -w

    
myConfig = def
    { XMonad.terminal = myTerminal
    , XMonad.modMask  = mod4Mask

    , XMonad.borderWidth         = 1
    , XMonad.normalBorderColor   = colorBack
    , XMonad.focusedBorderColor  = color15
    , XMonad.workspaces          = ["1", "2", "3", "4", "5"]

    , XMonad.layoutHook   = gaps [(U,37), (R,5), (L,5)] $ spacingWithEdge 5 $ myLayout
    , XMonad.startupHook  = myStartupHook
    , XMonad.manageHook   = namedScratchpadManageHook scratchpads
    }
    `additionalKeysP`
    [ ("M-q",   spawn "kittxmonad --recompile" )
    , ("M-r",   spawn "xmonad --restart"   )
    , ("M-S-q", kill                       )
    , ("M-p",   spawn myRun                )
    , ("M-S-z", spawn myLock)

    , ("M-<Escape>",   spawn myPowermenu )
    , ("M-S-<Return>", spawn myTerminal  )
    , ("M-C-<Return>", spawn myBrowser   )

    , ("M-S-l", sendMessage MirrorShrink )
    , ("M-S-h", sendMessage MirrorExpand )

    , ("M-a s", namedScratchpadAction scratchpads "spt" )
    , ("M-a d", namedScratchpadAction scratchpads "dc"  )
    , ("M-a c", namedScratchpadAction scratchpads "dotconf")

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
    `additionalMouseBindings`
    [
    ]


main :: IO ()
main = xmonad 
     . ewmhFullscreen 
     . ewmh 
     . docks
     $ myConfig
