-- Customize lualine colors for Onsen theme
return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local colors = {
      bg = "#000000",
      fg = "#E0E0E0",
      blue = "#A8C4F7",
      green = "#8FD9A8",
      red = "#FF6B6B",
      orange = "#FF9E50",
      comment = "#606060",
    }

    local onsen_theme = {
      normal = {
        a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
        b = { fg = colors.fg, bg = colors.comment },
        c = { fg = colors.fg, bg = colors.bg },
      },
      insert = {
        a = { fg = colors.bg, bg = colors.green, gui = "bold" },
      },
      visual = {
        a = { fg = colors.bg, bg = colors.orange, gui = "bold" },
      },
      replace = {
        a = { fg = colors.bg, bg = colors.red, gui = "bold" },
      },
      command = {
        a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
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
