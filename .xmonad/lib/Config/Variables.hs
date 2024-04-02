
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
myExplorer    = "thunar"
myScreenshot  = "maim -u -s | xclip -selection clipboard -t image/png"
myLock        = "i3lock-fancy -p -t \"\""

-- myRun         = "rofi -show drun run"
myRun         = "kitty --class=fzf-run -- /usr/bin/bash -c \"/usr/bin/dmenu_path | fzf -i | sh\""

myWallpaper   = "~/.wall/fall.png"
myPowermenu   = "killall xinit"
myWorkspaces  = ["1", "2", "3", "4", "5"]
greenclipRofi = "rofi -modi \"clipboard:greenclip print\" -show clipboard -run-command '{cmd}'"
