
--  _   _            _       _     _           
-- | | | |          (_)     | |   | |          
-- | | | | __ _ _ __ _  __ _| |__ | | ___  ___ 
-- | | | |/ _` | '__| |/ _` | '_ \| |/ _ \/ __|
-- \ \_/ / (_| | |  | | (_| | |_) | |  __/\__ \
--  \___/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/

module Config.Variables where 

myTerminal    = "kitty"
myBrowser     = "librewolf"
myEditor      = "kitty -- nvim"
myExplorer    = "thunar"
myScreenshot  = "maim -u -s | xclip -selection clipboard -t image/png"
myLock        = "i3lock-fancy -p -t \"\""

-- myRun        = "kitty --class=fzf-run -- ~/.scripts/fzf-run "
myRun        = "rofi -show drun"

myWallpaper   = "~/.wall/fall.png"
myPowermenu   = "killall xinit"
myWorkspaces  = ["1", "2", "3", "4", "5"]
greenclipRofi = "rofi -modi \"clipboard:greenclip print\" -show clipboard -run-command '{cmd}'"
