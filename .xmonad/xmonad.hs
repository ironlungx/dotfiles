--                                       _ 
-- __  ___ __ ___   ___  _ __   __ _  __| |
-- \ \/ / '_ ` _ \ / _ \| '_ \ / _` |/ _` |
--  >  <| | | | | | (_) | | | | (_| | (_| |
-- /_/\_\_| |_| |_|\___/|_| |_|\__,_|\__,_|

import XMonad

-- Hooks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog

-- Utils  
import XMonad.Util.EZConfig 
import XMonad.Util.Run 
import XMonad.Util.NamedScratchpad
import XMonad.Util.WorkspaceCompare

-- Custom Config modules
import Config.Scratchpads
import Config.Hooks
import Config.Binds
import Config.Variables
import Config.ColorSwitch

-- Color scheme (USE ONLY ONE)
-- import Colors.GruvboxDark
import Colors.CatppuccinFrappe

-- Config Block
myConfig h = def
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
    , XMonad.logHook             = dynamicLogWithPP (myLogHook h)
    }
    `additionalKeysP` (myKeys colorScheme)


main :: IO ()
main = do 
  changeThemes colorScheme   -- Apply color settings for other programs

  -- Pipe the output of logHook to cp, which writes to /tmp/xmlog. Polybar reads the file and gets info
  h <- spawnPipe "/usr/bin/tee /tmp/xmlog"

  xmonad . addEwmhWorkspaceSort (pure (filterOutWs [scratchpadWorkspaceTag]))   -- Filter out the NSP workspace (The Named Scratchpad Workspace)
         . ewmhFullscreen 
         . ewmh                                                                 -- Extended Window Manager Hints 
         . docks 
         $ myConfig h                                                           -- This is where everything comes together
