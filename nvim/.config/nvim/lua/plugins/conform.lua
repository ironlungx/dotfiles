return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      cpp = { "clang-format" },
      nix = { "alejandra" },
      python = { "black" },
      lua = { "stylua" },
      json = { "fixjson" },
      jsonc = { "fixjson" },
    }
  },
}
