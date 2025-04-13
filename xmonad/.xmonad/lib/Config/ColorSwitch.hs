module Config.ColorSwitch where 

import qualified Data.Map as Map
import Data.Maybe (fromMaybe)
import Data.Map (Map)
import System.Process (readProcess)

import XMonad
import XMonad.Util.Run
import System.IO 
import System.Directory

import Colors

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

loadLastTheme :: IO ColorScheme 
loadLastTheme = do
  homeDir <- getHomeDirectory
  let themeFileLocation = homeDir ++ "/.xmonad/theme"

  let fallbackTheme = gruvboxDark

  fileExists <- doesFileExist themeFileLocation
  if fileExists
    then do 
      fileContents <- readFile' themeFileLocation
      let maybeScheme = Map.lookup fileContents colorSchemes
      case maybeScheme of 
        Just scheme -> return scheme 
        Nothing -> return fallbackTheme

      else do 
        writeFile themeFileLocation (themeName fallbackTheme)
        return fallbackTheme

changeTheme :: ColorScheme -> IO ()
changeTheme c = do
    homeDir <- getHomeDirectory
    let themeFileLocation = homeDir ++ "/.xmonad/theme"

    let themeN = themeName c
    writeFile themeFileLocation themeN

promptForTheme :: X ()
promptForTheme = do
  x <- liftIO spawnRofi
  case Map.lookup x colorSchemes of
    Just details -> do
      liftIO $ changeTheme details
    Nothing -> return ()

runRofi :: IO (Maybe String)
runRofi = do
    selectedTheme <- readProcess "rofi" ["-dmenu", "-p", "Which Theme?"] (unlines (Map.keys colorSchemes))
    return $ if null selectedTheme then Nothing else Just (init selectedTheme)  -- `init` removes the trailing newline

spawnRofi = do
  mbSelected <- runRofi
  case mbSelected of
      Just theme -> return theme
      Nothing -> return ""  -- No theme selected or dmenu was canceled
