-- Customize lualine colors for Onsen theme
return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local colors = {
      bg = "#000000",
      fg = "#E0E0E0",
      green_dark = "#2D5540",    -- Dark green (matches tmux active pill)
      green_darker = "#1E3A2D",  -- Darker green (matches tmux inactive pill)
      red_dark = "#552D2D",      -- Dark red
      orange_dark = "#554020",   -- Dark orange
      comment = "#606060",
    }

    local onsen_theme = {
      normal = {
        a = { fg = colors.fg, bg = colors.green_dark, gui = "bold" },
        b = { fg = colors.fg, bg = colors.green_darker },
        c = { fg = colors.fg, bg = colors.bg },
      },
      insert = {
        a = { fg = colors.fg, bg = colors.green_dark, gui = "bold" },
      },
      visual = {
        a = { fg = colors.fg, bg = colors.orange_dark, gui = "bold" },
      },
      replace = {
        a = { fg = colors.fg, bg = colors.red_dark, gui = "bold" },
      },
      command = {
        a = { fg = colors.fg, bg = colors.green_dark, gui = "bold" },
      },
      inactive = {
        a = { fg = colors.comment, bg = colors.bg },
        b = { fg = colors.comment, bg = colors.bg },
        c = { fg = colors.comment, bg = colors.bg },
      },
    }

    opts.options = opts.options or {}
    opts.options.theme = onsen_theme
  end,
}
