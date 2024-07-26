# XMonad
XMonad is a dynamic window manager (tiling) for the X Window System, noted for being written in the functional programming language Haskell.
## Table of Contents
- [Config](#config)
- [Theme Switching](#theming)

<a id="config"> </a>
## Config
My xmonad config is divided into subsections. They live in the `lib/Config` directory.
- `Binds.hs`: Contains all of the keybinds for XMonad. Keybinds are defined in the `myKeys` variable.
- `Hooks.hs`: Contains the different `Hooks` for XMonad:
    * `myStartupHook`: Contains all the programs that will startup after XMonad
    * `myLayouHook`: Contains the layouts used by XMonad
    * `myManageHook`: Describes how to treat/tile certain windows
    * `myLogHook`: Prints certain icons depending on what the current layout is set to

- `Scratchpad.hs`: Contains rules for managing [scratchpads](https://www.youtube.com/watch?v=oInxVelAOdE)
- `Variables.hs`: Contains variables for programs, workspaces and wallpapers
- `Colorswitch.hs`: Primary file involved in changing colors/theme for different programs. More info [here](#theming)

<a id="theming"> </a>
## Theme switching
Inside the `xmonad.hs` file:
* I import a colorScheme from `Colors`: 
    * ```hs
        import Colors.CatppuccinFrappe
        ```
    * Each colorScheme file defines colors (base16 & accents)and the scheme's name.
* Programs that support specifying the config file's location launched as follows (polybar and rofi for example):
    ```hs
    launchPolybar = "~/.config/polybar/" ++ colorScheme ++ "/config.ini" -- (Each theme has a subfolder)
    launchRofi    = "~/.config/rofi/" ++ colorScheme ++ ".rasi"          -- (Each theme has it's own config file)
    ```
* Programs that don't support defining config file on the fly (eg. kitty & nvim):
    - Inside the main block of `xmonad.hs`, a function called `changeThemes` is called with argument `colorScheme` (specified in the color module)
    - `changeThemes` writes to the config file(s) of various programs.
        ```hs
        changeKittyTheme themeName = do 
          homeDir <- getHomeDirectory
          let configFile = homeDir ++ "/.config/kitty/current-theme.conf"
          writeFile configFile $ ("include themes/" ++ themeName ++ ".conf")

        changeThemes themeName = do 
          ... Other programs
          changeKittyTheme themeName
        ```
