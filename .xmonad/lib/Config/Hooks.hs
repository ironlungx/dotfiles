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
import XMonad.Layout.ResizableTile

import XMonad.Layout.Spacing
import XMonad.Layout.Gaps

import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.DynamicLog

import qualified DBus as D
import qualified DBus.Client as D
import qualified Codec.Binary.UTF8.String as UTF8

import Config.Variables
import Config.Scratchpads

myStartupHook = do
    spawn "picom -b"
    spawn "polybar --reload"
    spawn "xclip"
    spawn "xsetroot -cursor_name left_ptr"
    -- spawnOnce "mpd ; mpd-mpris"
    spawnOnce "greenclip daemon"
    spawn "dunst"
    spawn $ "feh --bg-fill --no-fehbg " ++ myWallpaper
    spawn "setxkbmap -layout us -option caps:ctrl_modifier"

myLayoutHook = gaps [(U,5), (R,5), (L,5), (D, 39)] $ spacingWithEdge 5 
    (tiled ||| Mirror tiled ||| Full)
  where
    tiled   = ResizableTall nmaster delta ratio []
    nmaster = 1
    ratio   = 4/7
    delta   = 3/100


myManageHook = namedScratchpadManageHook scratchpads <>
             composeAll 
             [ ((className =? "XMonadRecomplie")  --> (doRectFloat $ W.RationalRect 0.25 0.25 0.5 0.5 ))

             , ((className =? "Steam")            --> doFloat     )
             , ((className =? "steam")            --> doFullFloat )
             , ((className =? "Steam")            --> doIgnore    )

             , ((className =? "fzf-run")          --> (doRectFloat $ W.RationalRect 0.35 0.25 0.3 0.5 ))

             , (isDialog                          --> (doRectFloat $ W.RationalRect 0.25 0.25 0.5 0.5 )) ] 


myLogHook :: D.Client -> PP
myLogHook dbus = def { ppOutput = dbusOutput dbus }

-- Emit a DBus signal on log updates
dbusOutput :: D.Client -> String -> IO ()
dbusOutput dbus str = do
    let signal = (D.signal objectPath interfaceName memberName) {
            D.signalBody = [D.toVariant $ UTF8.decodeString str]
        }
    D.emit dbus signal
  where
    objectPath = D.objectPath_ "/org/xmonad/Log"
    interfaceName = D.interfaceName_ "org.xmonad.Log"
    memberName = D.memberName_ "Update"
