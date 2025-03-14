return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup {
      auto_session_suppress_dirs = { "~/", "~/repo", "/" },
      session_lens = {
        buftypes_to_ignore = {},
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
      },
    }

    vim.keymap.set("n", "<Leader>sl", require("auto-session.session-lens").search_session, {
      noremap = true,
    })
  end,
  keys = {
    { "<leader>sl", "<cmd> lua require(\"auto-session.session-lens\").search_session <cr>", desc = "Search AutoSessions" }
  }
}
