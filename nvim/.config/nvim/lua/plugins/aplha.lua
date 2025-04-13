return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- dashboard.section.header.val = {
    --   [[                                                ]],
    --   [[                                          _.oo. ]],
    --   [[                  _.u[[/;:,.         .odMMMMMM' ]],
    --   [[               .o888UU[[[/;:-.  .o@P^    MMM^   ]],
    --   [[              oN88888UU[[[/;::-.        dP^     ]],
    --   [[             dNMMNN888UU[[[/;:--.   .o@P^       ]],
    --   [[            ,MMMMMMN888UU[[/;::-. o@^           ]],
    --   [[            NNMMMNN888UU[[[/~.o@P^              ]],
    --   [[            888888888UU[[[/o@^-..               ]],
    --   [[           oI8888UU[[[/o@P^:--..                ]],
    --   [[        .@^  YUU[[[/o@^;::---..                 ]],
    --   [[      oMP     ^/o@P^;:::---..                   ]],
    --   [[   .dMMM    .o@^ ^;::---...                     ]],
    --   [[  dMMMMMMM@^`       `^^^^                       ]],
    --   [[ YMMMUP^                                        ]],
    --   [[  ^^                                            ]],
    --   [[                                                ]],
    -- }

    -- Set header
    dashboard.section.header.val = {
      [[ ┌─────────────────────────────────────────────────────────────────┐ ]],
      [[ │                     ,                                           │ ]],
      [[ │                     \`-._           __                          │ ]],
      [[ │                      \\  \-..____,.'  `.                        │ ]],
      [[ │                       :  )       :      :\                      │ ]],
      [[ │                        ;'        '   ;  | :                     │ ]],
      [[ │                        )..      .. .:.`.; :                     │ ]],
      [[ │                       /::...  .:::...   ` ;                     │ ]],
      [[ │                       `:o>   /\o_>        : `.                  │ ]],
      [[ │                      `-`.__ ;   __..--- /:.   \                 │ ]],
      [[ │                     ==== \_/   ;=====_.':.     ;                │ ]],
      [[ │                       ,/'`--'...`--....        ;                │ ]],
      [[ │                            ;                    ;               │ ]],
      [[ │                        . '                       ;              │ ]],
      [[ │                      .'     ..     ,      .       ;             │ ]],
      [[ │                     :       ::..  /      ;::.     |             │ ]],
      [[ │                    /      `.;::.  |       ;:..    ;             │ ]],
      [[ │                   :         |:.   :       ;:.    ;              │ ]],
      [[ │                   :         ::     ;:..   |.    ;               │ ]],
      [[ │                    :       :;      :::....|     |               │ ]],
      [[ │                    /\     ,/ \      ;:::::;     ;               │ ]],
      [[ │                  .:. \:..|    :     ; '.--|     ;               │ ]],
      [[ │                 ::.  :''  `-.,,;     ;'   ;     ;               │ ]],
      [[ │              .-'. _.'\      / `;      \,__:      \              │ ]],
      [[ │              `---'    `----'   ;      /    \,.,,,/              │ ]],
      [[ │                                 `----`                          │ ]],
      [[ └─────────────────────────────────────────────────────────────────┘ ]],
      [[                              Neovim                                 ]],

    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "   New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "󰈞   Find file", ":Telescope find_files <CR>"),
      dashboard.button("r", "   Recent", ":Telescope oldfiles<CR>"),
      dashboard.button("q", "󰩈   Quit NVIM", ":qa<CR>"),
    }

    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
  end,
}
