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

import XMonad.Config.Desktop

-- Custom Config modules
import Config.Scratchpads
import Config.Hooks
import Config.Binds
import Config.Variables
import Config.ColorSwitch

import System.IO

import Colors

import Data.Map (Map)
import qualified Data.Map as Map
-- Config Block
myConfig f colorScheme = def
    { XMonad.terminal            = myTerminal
    , XMonad.modMask             = mod4Mask -- Super key
    , XMonad.focusFollowsMouse   = False 
    , XMonad.borderWidth         = 1
    , XMonad.normalBorderColor   = (colorBack colorScheme)
    , XMonad.focusedBorderColor  = (accent colorScheme)
    , XMonad.workspaces          = myWorkspaces
    , XMonad.layoutHook          = myLayoutHook colorScheme
    , XMonad.startupHook         = myStartupHook (themeName colorScheme)
    , XMonad.manageHook          = myManageHook
    , XMonad.logHook             = dynamicLogWithPP (myLogHook f)
    }
    `additionalKeysP` (myKeys (themeName colorScheme))


main :: IO ()
main = do 

  let scheme = catppuccinFrappe
  changeThemes (themeName scheme)   -- Apply color settings for other programs

  -- Pipe the output of logHook to cp, which writes to /tmp/xmlog. Polybar reads the file and gets info
  -- h <- spawnPipe "/cusr/bin/tee /tmp/xmlog"
  let logFile = "/tmp/xmlog"

  xmonad . addEwmhWorkspaceSort (pure (filterOutWs [scratchpadWorkspaceTag]))   -- Filter out the NSP workspace (The Named Scratchpad Workspace)
         . ewmhFullscreen 
         . ewmh                                                                 -- Extended Window Manager Hints 
         . docks 
         $ myConfig logFile scheme                                                          -- This is where everything comes together
