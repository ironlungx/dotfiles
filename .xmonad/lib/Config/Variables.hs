
--  _   _            _       _     _           
-- | | | |          (_)     | |   | |          
-- | | | | __ _ _ __ _  __ _| |__ | | ___  ___ 
-- | | | |/ _` | '__| |/ _` | '_ \| |/ _ \/ __|
-- \ \_/ / (_| | |  | | (_| | |_) | |  __/\__ \
--  \___/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/

module Config.Variables where 

myTerminal    = "kitty"
myBrowser     = "firefox"
myEditor      = "kitty -- nvim"
myExplorer    = "pcmanfm-qt"
myScreenshot  = "maim -u -s | xclip -selection clipboard -t image/png"
myFlameshot   = "flameshot gui"
myLock        = "i3lock-fancy -t \"\""

myRun        = "rofi -show drun -config "

myWallpaper   = "~/.wall/bg_15.jpg"
myPowermenu   = "killall xinit"
myWorkspaces  = ["1", "2", "3", "4", "5"]
greenclipRofi = "rofi -modi \"clipboard:greenclip print\" -show clipboard -run-command '{cmd}'"
