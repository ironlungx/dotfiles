return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      term_colors = true,
    })
    vim.cmd.colorscheme "catppuccin-frappe"

    local function diagnostics_status()
      local diagnostics = vim.diagnostic.get(0)
      local count = { errors = 0, warnings = 0, info = 0, hints = 0 }

      for _, diagnostic in ipairs(diagnostics) do
        if diagnostic.severity == vim.diagnostic.severity.ERROR then
          count.errors = count.errors + 1
        elseif diagnostic.severity == vim.diagnostic.severity.WARN then
          count.warnings = count.warnings + 1
        elseif diagnostic.severity == vim.diagnostic.severity.INFO then
          count.info = count.info + 1
        elseif diagnostic.severity == vim.diagnostic.severity.HINT then
          count.hints = count.hints + 1
        end
      end

      local result = {}
      if count.errors > 0 then
        table.insert(result, " " .. count.errors)
      end
      if count.warnings > 0 then
        table.insert(result, " " .. count.warnings)
      end
      if count.hints > 0 then
        table.insert(result, " " .. count.hints)
      end

      if #result > 0 then
        return table.concat(result, " ")
      else
        return "No issues"
      end
    end

    local colors = {
      rosewater = '#f2d5cf',
      flamingo = '#eebebe',
      pink = '#f4b8e4',
      mauve = '#ca9ee6',
      red = '#e78284',
      maroon = '#ea999c',
      peach = '#ef9f76',
      yellow = '#e5c890',
      green = '#a6d189',
      teal = '#81c8be',
      sky = '#99d1db',
      sapphire = '#85c1dc',
      blue = '#8caaee',
      lavender = '#babbf1',
      text = '#c6d0f5',
      subtext1 = '#b5bfe2',
      subtext0 = '#a5adce',
      overlay2 = '#949cbb',
      overlay1 = '#838ba7',
      overlay0 = '#737994',
      surface2 = '#626880',
      surface1 = '#51576d',
      surface0 = '#414559',
      base = '#303446',
      mantle = '#292c3c',
      crust = '#232634',
    }


    local bubbles_theme = {
      normal = {
        a = { fg = colors.mantle, bg = colors.blue },
        b = { fg = colors.text, bg = colors.base },
        c = { fg = colors.text },
      },

      insert = { a = { fg = colors.mantle, bg = colors.green } },
      visual = { a = { fg = colors.mantle, bg = colors.yellow } },
      replace = { a = { fg = colors.mantle, bg = colors.red } },
      command = { a = { fg = colors.mantle, bg = colors.peach } },

      inactive = {
        a = { fg = colors.text, bg = colors.crust },
        b = { fg = colors.text, bg = colors.crust },
        c = { fg = colors.text },
      },

    }

    require('lualine').setup {
      options = {
        theme = bubbles_theme,
        component_separators = '',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
        lualine_b = { 'filename', 'diff', {
          'diagnostics',
          sources = { 'nvim_diagnostic' },
          symbols = { error = ' ', warn = ' ', info = ' ' },
          diagnostics_color = {
            error = { fg = colors.red },
            warn = { fg = colors.yellow },
            info = { fg = colors.teal },
          },
        } },
        lualine_c = {}, -- Add Git branch
        lualine_x = {}, -- Add Git diff
        lualine_y = { 'progress' },
        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 },
        },
      },
      inactive_sections = {
        -- lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {},
      extensions = {},
    }
  end
}
