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
-- Custom Config modules
import Config.Scratchpads
import Config.Hooks
import Config.Binds
import Config.Variables
import Config.ColorSwitch

-- Color scheme (USE ONLY ONE)
-- import Colors.GruvboxDark
import Colors.CatppuccinFrappe

myConfig = def
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
    }
    `additionalKeysP` (myKeys colorScheme)


main :: IO ()
main = do 
  changeThemes colorScheme;
  xmonad 
    $ ewmhFullscreen 
    $ ewmh 
    $ docks 
    $ myConfig

