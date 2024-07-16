module Config.ColorSwitch where 

import System.IO 
import System.Directory

changeNVimTheme themeName = do 
  homeDir <- getHomeDirectory
  let configFile = homeDir ++ "/.config/nvim/lua/plugins/theme.lua"
  writeFile configFile $ ("return { require(\"plugins.themes." ++ themeName ++ "\") }")

changeKittyTheme themeName = do 
  homeDir <- getHomeDirectory
  let configFile = homeDir ++ "/.config/kitty/current-theme.conf"
  writeFile configFile $ ("include themes/" ++ themeName ++ ".conf")

changeThemes themeName = do 
  changeNVimTheme themeName
  changeKittyTheme themeName
