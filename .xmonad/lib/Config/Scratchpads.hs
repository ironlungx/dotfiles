--   ________  ______    _______        __  ___________  ______    __    __    _______     __       ________    ________  
--  /"       )/" _  "\  /"      \      /""\("     _   ")/" _  "\  /" |  | "\  |   __ "\   /""\     |"      "\  /"       ) 
-- (:   \___/(: ( \___)|:        |    /    \)__/  \\__/(: ( \___)(:  (__)  :) (. |__) :) /    \    (.  ___  :)(:   \___/  
--  \___  \   \/ \     |_____/   )   /' /\  \  \\_ /    \/ \      \/      \/  |:  ____/ /' /\  \   |: \   ) || \___  \    
--   __/  \\  //  \ _   //      /   //  __'  \ |.  |    //  \ _   //  __  \\  (|  /    //  __'  \  (| (___\ ||  __/  \\   
--  /" \   :)(:   _) \ |:  __   \  /   /  \\  \\:  |   (:   _) \ (:  (  )  :)/|__/ \  /   /  \\  \ |:       :) /" \   :)  
-- (_______/  \_______)|__|  \___)(___/    \___)\__|    \_______) \__|  |__/(_______)(___/    \___)(________/ (_______/   
--
module Config.Scratchpads where
import XMonad
import XMonad.StackSet as W
import XMonad.Util.NamedScratchpad



scratchpads = [
    NS "spt"     "LD_PRELOAD=/usr//lib/spotify-adblock.so spotify"      (className =? "Spotify") center,
    NS "dc"      "discord"                                              (className =? "discord") center,
    NS "term"    "kitty --class=scratchpadTerm"                         (className =? "scratchpadTerm") center,

    NS "dotconf" "kitty --class=dotconf -- sh -c \"cd ~/dotfiles/ ; nvim\""    (className =? "dotconf") centerBig
  ]
  where 
    center = customFloating $ W.RationalRect l t w h
                   where
                     h = 0.7
                     w = 0.7
                     t = 0.85 -h
                     l = 0.85 -w
    centerSmall =  customFloating $ W.RationalRect 0.25 0.25 0.5 0.5
    centerBig   =  customFloating $ W.RationalRect 0.1  0.1  0.8 0.8
