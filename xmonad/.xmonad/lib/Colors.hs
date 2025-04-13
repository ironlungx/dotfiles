module Colors where

import qualified Data.Map as Map
import Data.Map (Map)

-- Define a data type to represent the color scheme
data ColorScheme = ColorScheme {
    themeName :: String,
    color01   :: String, 
    color02   :: String, 
    color03   :: String, 
    color04   :: String, 
    color05   :: String, 
    color06   :: String, 
    color07   :: String, 
    color08   :: String, 
    color09   :: String, 
    color10   :: String, 
    color11   :: String, 
    color12   :: String, 
    color13   :: String, 
    color14   :: String, 
    color15   :: String, 
    color16   :: String, 
    colorBack :: String, 
    colorFore :: String, 
    accent    :: String  
} deriving (Show)

-- Create an instance of ColorScheme
catppuccinFrappe :: ColorScheme
catppuccinFrappe = ColorScheme {
    themeName = "catppuccin-frappe",
    color01   = "#303446", -- base
    color02   = "#292c3c", -- mantle
    color03   = "#414559", -- surface0
    color04   = "#51576d", -- surface1
    color05   = "#626880", -- surface2
    color06   = "#c6d0f5", -- text
    color07   = "#f2d5cf", -- rosewater
    color08   = "#babbf1", -- lavender
    color09   = "#e78284", -- red
    color10   = "#ef9f76", -- peach
    color11   = "#e5c890", -- yellow
    color12   = "#a6d189", -- green
    color13   = "#81c8be", -- teal
    color14   = "#8caaee", -- blue
    color15   = "#ca9ee6", -- mauve
    color16   = "#eebebe", -- flamingo
    colorBack = "#303446", -- base
    colorFore = "#eebebe", -- flamingo
    accent    = "#babbf1"  -- lavender
}

gruvboxDark = ColorScheme {
    themeName = "gruvbox-dark",
    color01   = "#282828", -- base
    color02   = "#cc241d", -- red
    color03   = "#98971a", -- green
    color04   = "#d79921", -- yellow
    color05   = "#458588", -- blue
    color06   = "#b16286", -- purple
    color07   = "#689d6a", -- aqua
    color08   = "#a89984", -- neutral
    color09   = "#928374", -- gray
    color10   = "#fb4934", -- bright red
    color11   = "#b8bb26", -- bright green
    color12   = "#fabd2f", -- bright yellow
    color13   = "#83a598", -- bright blue
    color14   = "#d3869b", -- bright purple
    color15   = "#8ec07c", -- bright aqua
    color16   = "#ebdbb2", -- bright neutral
    colorBack = "#282828", -- base
    colorFore = "#ebdbb2", -- bright neutral
    accent    = "#689d6a"  -- aqua
}

nord :: ColorScheme
nord = ColorScheme {
    themeName = "nord",
    color01   = "#2e3440", -- base00
    color02   = "#3b4252", -- base01
    color03   = "#434c5e", -- base02
    color04   = "#4c566a", -- base03
    color05   = "#d8dee9", -- base04
    color06   = "#e5e9f0", -- base05
    color07   = "#eceff4", -- base06
    color08   = "#8fbcbb", -- base07
    color09   = "#bf616a", -- base08
    color10   = "#d08770", -- base09
    color11   = "#ebcb8b", -- base0A
    color12   = "#a3be8c", -- base0B
    color13   = "#88c0d0", -- base0C
    color14   = "#81a1c1", -- base0D
    color15   = "#b48ead", -- base0E
    color16   = "#5e81ac", -- base0F
    colorBack = "#2e3440", -- base00
    colorFore = "#5e81ac", -- base0F
    accent    = "#8fbcbb"  -- color08
}

colorSchemes :: Map String ColorScheme
colorSchemes = Map.fromList [ ("catppuccin-frappe", catppuccinFrappe)
                            , ("gruvbox-dark", gruvboxDark)
                            , ("nord", nord )
                            ]
