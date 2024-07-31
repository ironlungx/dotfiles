module Colors where

-- Define a data type to represent the color scheme
data ColorScheme = ColorScheme {
    themeName :: String,
    color01   :: String, -- base
    color02   :: String, -- mantle
    color03   :: String, -- surface0
    color04   :: String, -- surface1
    color05   :: String, -- surface2
    color06   :: String, -- text
    color07   :: String, -- rosewater
    color08   :: String, -- lavender
    color09   :: String, -- red
    color10   :: String, -- peach
    color11   :: String, -- yellow
    color12   :: String, -- green
    color13   :: String, -- teal
    color14   :: String, -- blue
    color15   :: String, -- mauve
    color16   :: String, -- flamingo
    colorBack :: String, -- base
    colorFore :: String, -- flamingo
    accent    :: String  -- pointing to color08
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
