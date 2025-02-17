
return {
  "codethread/qmk.nvim",
  config = function()
    local qmk = require("qmk")
    qmk.setup({
      name = "LAYOUT_split_3x6_3", -- identify your layout name
      layout = { -- create a visual representation of your final layout
        "x x x x x x _ _ _ _ x x x x x x", -- including keys that span multple rows (with alignment left, center or right)
        "x x x x x x _ _ _ _ x x x x x x", -- including keys that span multple rows (with alignment left, center or right)
        "x x x x x x _ _ _ _ x x x x x x", -- including keys that span multple rows (with alignment left, center or right)
        "_ _ _ _ x x x _ _ x x x _ _ _ _",
      },
    })
  end,
}
