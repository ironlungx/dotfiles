return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  --  opts =
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          --visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            ".github",
            ".gitignore",
            "package-lock.json",
          },
          never_show = { ".git" },
        },
      },
      window = {
        position = "right"
      }
    })
  end,
  keys = {
    -- { "<leader>n", "<cmd> Neotree <cr>",        desc = "Focus Neotree" },
    -- { "<leader>e", "<cmd> Neotree toggle <cr>", desc = "Toggle NeoTree" },
  }
}
