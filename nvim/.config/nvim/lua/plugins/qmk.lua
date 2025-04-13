
return {
  "codethread/qmk.nvim",
  config = function()
    local qmk = require("qmk")
    qmk.setup({
      name = "LAYOUT_split_3x6_3",
      layout = {
        "x x x x x x _ _ _ _ x x x x x x",
        "x x x x x x _ _ _ _ x x x x x x",
        "x x x x x x _ _ _ _ x x x x x x",
        "_ _ _ _ x x x _ _ x x x _ _ _ _",
      },
      comment_preview = {
        position = 'inside',
        keymap_overrides = {
          -- lua magic patterns must be escaped with `%`, sorry, I'll fix this one day
          -- watch out for emojis as they are double width
          ['HMR_A'] = 'win/a',
          ['HMR_S'] = 'alt/s',
          ['HMR_D'] = 'sft/d',
          ['HMR_F'] = 'ctl/f',

          ['HMR_J'] = 'ctl/j',
          ['HMR_K'] = 'sft/k',
          ['HMR_L'] = 'alt/l',
          ['HMR_;'] = 'win/;',
        },
      },
    })
  end,
}
