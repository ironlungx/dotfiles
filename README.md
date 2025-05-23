# Dotfiles

> [!CAUTION]
> I've stopped updating this repository because I moved over to nix-os. my latest dotfiles can be found [here](https://github.com/ironlungx/nix-config)

## Table of Contents
- [Info](#info)
- [Gallery](#gallery)
- [Keybinds](#keybd)
- [Install](#install)
    * [Arch Install](#inst-arch)
    * [General Install](#gen-inst)
    * [Dependencies](#gen-inst)
    * [Optional Deps.](#opt-deps)
    * [Theming](#theming)
    * [Stowing](#stow)

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
<img src='/screenshots/image.png'>
<img src='/screenshots/tiles.png'>
<img src='/screenshots/float.png'>

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

<a id="install"></a>

## Installation

```
$ git clone https://github.com/ironlungx/dotfiles
$ cd dotfiles
```


<a id="inst-arch"></a>

### Arch Linux installation
Before installing go read [Optional Deps](#opt-deps) ~~and then come back~~
I've made an install-dependencies script that will install all the dependencies with `pacman` and `paru/yay`. It won't copy over the actual configs for the system.
`./install.sh`
To install the configs [Stowing](#stow) 

<a id="gen-inst"></a>

### General installation
If you are on a non-arch based distro, install the following dependencies:
- `Git`
- `XMonad` & `XMonad Contrib` 
- Proper X11 setup
- `stow`
- `rofi` & `rofi-greenclip`
- `picom`
- `feh`
- `dunst` 
- `maim`
- `xclip`
- `polybar` 
- `eza`
- `kitty`
- JetBrains Mono Nerd Font
- `playerctl`
- [i3lock-fancy](https://github.com/meskarune/i3lock-fancy)
- `pulseaudio`

<a id="opt-deps"></a>
### Optional Dependencies

Following are dependencies that can be changed to alternative programs in [Variables.hs](.xmonad/lib/Config/Variables.hs)
| Program(s)                | Variable to change in `Variables.hs` | Recommended?       |
|---------------------------|--------------------------------------|--------------------|
| `fish`                    | *None*                               | :heavy_check_mark: |
| `kitty`                   | `myTerminal`                         | :heavy_check_mark: |
| `neovim`                  | `myEditor`                           |                    |
| `pcmanfm`                 | `myExplorer`                         |                    |
| `maim`                    | `myScreenshot`                       | :heavy_check_mark: |
| `i3lock-fancy`            | `myLock`                             |                    |
| `rofi` & `rofi-greenclip` | `myRun`                              | :heavy_check_mark: |
| `zoxide`*                 | *None*                               | :heavy_check_mark: |
| `bat`*                    | *None*                               | :heavy_check_mark: |
| `librewolf`               | `myBrowser`                          |                    |

A `*` represents a change in the config.fish, just remove the aliases and sources

Continue to [Stowing](#stow)

<a id="theming"></a>
### Changing the rice theme!

okay this part keeps changing all the time. so by the time you are reading this, the method might be different

To change the color-scheme of the setup, edit `xmonad.hs`:

```hs
-- ...Other imports
import Colors.THEME_NAME -- (GruvboxDark/CatppuccinFrappe)

```
And then recompile & restart XMonad (`Mod+q` + `Mod+r`)
You can read more about how it works [here](https://github.com/ironlungx/dotfiles/tree/main/.xmonad)

<a id="stow"></a>

### Stowing
If you want to make life easy and updating dots easy, I recommend using `stow`.
Before stowing the files, **please ensure that all of your config files are backed up.** Files in this repo are arranged as if they were in `~/` directory, so backup accordingly.
Once backed up execute the following:

```
$ cd ~/dotfiles/
$ stow .
```
