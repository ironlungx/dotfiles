# Polybar

## Themes
These are my polybar configs for different themes:

- Catppuccin Frappe:
<img src='/screenshots/polybar/catppuccin-frappe.png'>

- Gruvbox Dark:
<img src='/screenshots/polybar/gruvbox-dark.png'>

## How to change the theme
To change the theme for polybar, in `xmonad.hs` change the color import line:
```haskell
-- Color scheme (USE ONLY ONE). Valid Themes:
--      - Catppuccin Frappe
--      - Gruvbox Dark

-- import Colors.THEMENAME 
import Colors.CatppuccinFrappe    -- This line
```
Then recompile & restart `xmonad` (`M-q` & `M-r` respectively)
