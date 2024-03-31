
--  _   _            _       _     _           
-- | | | |          (_)     | |   | |          
-- | | | | __ _ _ __ _  __ _| |__ | | ___  ___ 
-- | | | |/ _` | '__| |/ _` | '_ \| |/ _ \/ __|
-- \ \_/ / (_| | |  | | (_| | |_) | |  __/\__ \
--  \___/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/

module Config.Variables where 

myTerminal    = "kitty"
myBrowser     = "firefox"
myRun         = "rofi -show drun run"
myEditor      = "kitty -- nvim"
myWallpaper   = "~/.wall/fall.png"
myLock        = "i3lock-fancy -p -t \"\""
myPowermenu   = "killall xinit"
myWorkspaces  = ["1", "2", "3", "4", "5"]
myExplorer    = "thunar"
greenclipRofi = "rofi -modi \"clipboard:greenclip print\" -show clipboard -run-command '{cmd}'"
myScreenshot  = "maim -u -s | xclip -selection clipboard -t image/png"
