module Config.Scratchpads where
import XMonad
import XMonad.StackSet as W
import XMonad.Util.NamedScratchpad



scratchpads = [
    NS "spt"     "LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify" (className =? "Spotify") center,
    NS "dc"      "discord"                                              (className =? "discord") center,
    NS "term"    "kitty --class=scratchpadTerm"                         (className =? "scratchpadTerm") center,

    NS "dotconf" "codium -n config.code-workspace --profile \"dotfile config\"" (title =? "dotconf") center
  ]
  where 
    center = customFloating $ W.RationalRect l t w h
                   where
                     h = 0.7
                     w = 0.7
                     t = 0.85 -h
                     l = 0.85 -w