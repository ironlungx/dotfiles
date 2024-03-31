

# Dotfiles
## Table of Contents
- [Info](#info)
- [Gallery](#gallery)
- [Keybinds](#keybd)
- [Dependencies](#dep)

<a id="info"></a>

## Info
- XMonad
- Polybar
- Rofi
- Neovim

Hello! Thanks for dropping by.
If you want to *yoink* my config, go to [Install](#install)

<a id="gallery"></a>

## Gallery
<img src='/screenshots/home.png'>
<img src='/screenshots/tiles.png'>
<img src='/screenshots/nvim.png'>

<a id="keybd"></a>

## Keybinds
The following are basic keybinds used in `xmonad`. For a full list go through `.xmonad/lib/Config/Binds.hs`

|      Keybind       |                       Function                           |
| ------------------ | -------------------------------------------------------- |
| `M-S-Return`       | Launch terminal (kitty, can be changed in `Variables.hs` |
| `M-S-q`            | Close Active Window                                      |
| `M-p`              | Run command (mentioned in `Variables.hs`                 |
| `M-1..n`           | Go to n'th workspace                                     | 
| `M-a s/Return/d/m` | Scratchpads view `Scratchpads.hs`                        |
| `M-h`              | Expand (resize)                                          |
| `M-l`              | Shrink (resize)                                          |
| `M-S-h`            | Mirror Expand (resize)                                   |
| `M-S-l`            | Mirror Shrink (resize)                                   |

(**M** represents Meta/Windows Key & **S** represents the Shift Key)

<a id="dep"></a>

## Dependencies
Following are dependencies, make sure you have them installed.

- xmonad
- xmonad-contrib
- polybar
- rofi*
- kitty*
- dunst
- playerctl
- Jetbrains Mono Nerd Font
- feh (wallaper setter)
- i3lock-fancy*
- thunar*
- neovim (optional)
- xorg
- picom
- greenclip
- (more to come...)

Note: Programs with a `*` can be changed to alternatives in `.xmonad/lib/Config/Variables.hs`

## Installation


