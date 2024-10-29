return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope-symbols.nvim' },
    config = function()
      -- local builtin = require("telescope.builtin")
      -- vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      -- vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      -- vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      -- vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
      --    vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})

      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
          grep_string = {
            additional_args = { "--hidden" },
          },
          live_grep = {
            additional_args = { "--hidden" },
          },
        },
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "-u",
            "--glob", "!**/.git/",
            "--glob", "!**/.pio/"
          },
        },
      })
    end,
    keys = {
      { "<leader>fb", '<cmd> lua require("telescope.builtin").buffers() <cr>',    desc = "Buffers" },
      { "<leader>ff", '<cmd> lua require("telescope.builtin").find_files() <cr>', desc = "Files" },
      { "<leader>fg", '<cmd> lua require("telescope.builtin").live_grep() <cr>',  desc = "Live Grep" },
      { "<leader>fo", '<cmd> lua require("telescope.builtin").oldfiles() <cr>',   desc = "Old Files" },

      { "<leader>lt", '<cmd> Telescope lsp_document_symbols <cr>',   desc = "Old Files" },
    }
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").load_extension("ui-select")
    end,
  },
}
