import XMonad
-- Hooks for Extended Window Manager Hints & Docks 
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
-- Keybinds
import XMonad.Util.EZConfig 

-- Custom Config modules
import Config.Scratchpads
import Config.Hooks
import Config.Binds
import Config.Variables

-- Color scheme (USE ONLY ONE)
import Colors.GruvboxDark
    
myConfig = def
    { XMonad.terminal = myTerminal
    , XMonad.modMask  = mod4Mask
    , XMonad.focusFollowsMouse = False

    , XMonad.borderWidth         = 1
    , XMonad.normalBorderColor   = colorBack
    , XMonad.focusedBorderColor  = color15
    , XMonad.workspaces          = myWorkspaces

    , XMonad.layoutHook   = myLayoutHook
    , XMonad.startupHook  = myStartupHook
    , XMonad.manageHook   = myManageHook
    }
    `additionalKeysP` myKeys

main :: IO ()
main = xmonad 
     . ewmhFullscreen 
     . ewmh 
     . docks
     $ myConfig