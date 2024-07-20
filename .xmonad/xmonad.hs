--  .----------------.  .----------------.  .----------------.  .-----------------. .----------------.  .----------------. 
-- | .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
-- | |  ____  ____  | || | ____    ____ | || |     ____     | || | ____  _____  | || |      __      | || |  ________    | |
-- | | |_  _||_  _| | || ||_   \  /   _|| || |   .'    `.   | || ||_   \|_   _| | || |     /  \     | || | |_   ___ `.  | |
-- | |   \ \  / /   | || |  |   \/   |  | || |  /  .--.  \  | || |  |   \ | |   | || |    / /\ \    | || |   | |   `. \ | |
-- | |    > `' <    | || |  | |\  /| |  | || |  | |    | |  | || |  | |\ \| |   | || |   / ____ \   | || |   | |    | | | |
-- | |  _/ /'`\ \_  | || | _| |_\/_| |_ | || |  \  `--'  /  | || | _| |_\   |_  | || | _/ /    \ \_ | || |  _| |___.' / | |
-- | | |____||____| | || ||_____||_____|| || |   `.____.'   | || ||_____|\____| | || ||____|  |____|| || | |________.'  | |
-- | |              | || |              | || |              | || |              | || |              | || |              | |
-- | '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
--  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------' 

import XMonad
-- Hooks for Extended Window Manager Hints & Docks 
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
-- Keybinds
import XMonad.Util.EZConfig 
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog

import qualified XMonad.DBus as D

-- Custom Config modules
import Config.Scratchpads
import Config.Hooks
import Config.Binds
import Config.Variables
import Config.ColorSwitch

-- Color scheme (USE ONLY ONE)
-- import Colors.GruvboxDark
import Colors.CatppuccinFrappe

myConfig dbus = def
    { XMonad.terminal            = myTerminal
    , XMonad.modMask             = mod4Mask -- Super key
    , XMonad.focusFollowsMouse   = False 
    , XMonad.borderWidth         = 1
    , XMonad.normalBorderColor   = colorBack
    , XMonad.focusedBorderColor  = accent
    , XMonad.workspaces          = myWorkspaces
    , XMonad.layoutHook          = myLayoutHook
    , XMonad.startupHook         = myStartupHook colorScheme
    , XMonad.manageHook          = myManageHook
    , XMonad.logHook             = dynamicLogWithPP (myLogHook dbus)
    }
    `additionalKeysP` (myKeys colorScheme)


main :: IO ()
main = do 
  changeThemes colorScheme

  dbus <- D.connect
  D.requestAccess dbus

  xmonad 
    $ ewmhFullscreen 
    $ ewmh 
    $ docks 
    $ myConfig dbus

