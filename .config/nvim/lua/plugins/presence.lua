return {
  "andweeb/presence.nvim",
  config = function ()
    require("presence").setup({
      -- -- -- General options
      -- auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
      -- neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
      -- main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
      -- buttons             = {
      --   {"dotfiles", "https://github.com/ironlungx/dotfiles"}
      -- },                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
      -- show_time           = true,                       -- Show the timer
    })
  end
}
