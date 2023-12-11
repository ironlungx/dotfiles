module Config.Hooks where
import XMonad
import XMonad.StackSet as W

import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Util.Run

import XMonad.Util.NamedScratchpad
import XMonad.Layout.ResizableTile

import XMonad.Layout.Spacing
import XMonad.Layout.Gaps

import XMonad.Hooks.ManageHelpers

import Config.Variables
import Config.Scratchpads

myStartupHook = do
    spawn "picom -b"
    spawn "~/.config/polybar/launch.sh --forest"
    spawn "xclip"
    spawn "xsetroot -cursor_name left_ptr"
    spawnOnce "mpd ; mpd-mpris"
    spawn $ "feh --bg-fill --no-fehbg " ++ myWallpaper

myLayoutHook = gaps [(U,37), (R,5), (L,5)] $ spacingWithEdge 5 $ 
               tiled ||| Mirror tiled ||| Full
    where
        tiled   = ResizableTall nmaster delta ratio []
        nmaster = 1
        ratio   = 1/2
        delta   = 3/100

myManageHook = namedScratchpadManageHook scratchpads <>
             composeAll 
             [ ((className =? "XMonadRecompile")                   --> doFloat)
             , ((className =? "Firefox" <&&> resource =? "Dialog") --> doCenterFloat)
             ]
             where 
                center = customFloating $ W.RationalRect l t w h
                   where
                     h = 0.7
                     w = 0.7
                     t = 0.85 -h
                     l = 0.85 -w
