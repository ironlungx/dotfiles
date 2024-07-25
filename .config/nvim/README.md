# Neovim
Neovim is a text editor based on `vim` and has lua support

## Table of Contents
- [General Options](#general)
- [Plugin](#plugins)
- [Theming](#theming)

<a id='general'></a>
## General options
These options can be changed in `lua/vim-options.lua`

<a id='plugins'></a>
## Plugins
I use [lazy](https://github.com/folke/lazy.nvim) as my package manager
All the plugins are located in `lua/plugins/*`. Each plugin has a seperate file for itself.
For example, to add [this](https://github.com/numToStr/Comment.nvim) plugin:

```lua
-- FILE: ~/.config/nvim/lua/plugins/comment.lua
return {
  'numToStr/Comment.nvim',
  opts = {
    -- add any options here
  },
  lazy = false,
}
```

<a id='theming'></a>
## Theming
For XMonad to change the theme for nvim it changes the file `lua/plugin/theme.lua`. It picks the themes from the directory `lua/plugins/themes/*`
For example if I choose `GruvboxDark` [here](https://github.com/ironlungx/dotfiles/#theming), what happens is that XMonad changes the file `theme.lua` to something like this:

```lua
return { require("plugins.themes.catppuccin-frappe") }
```
you can read more about it [here](https://github.com/ironlungx/dotfiles/tree/main/.xmonad)
