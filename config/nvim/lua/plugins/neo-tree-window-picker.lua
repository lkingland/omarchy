-- Configure neo-tree to use window picker for opening files
return {
  -- Add window picker plugin
  {
    "s1n7ax/nvim-window-picker",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        hint = "floating-big-letter",
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          bo = {
            filetype = { "neo-tree", "neo-tree-popup", "notify" },
            buftype = { "terminal", "quickfix" },
          },
        },
      })
    end,
  },
  -- Configure neo-tree to use window picker
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      -- Override LazyVim defaults: <leader>e = focus, <leader>E = toggle
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ action = "focus", dir = LazyVim.root() })
        end,
        desc = "Focus Explorer (Root Dir)",
      },
      {
        "<leader>E",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
        end,
        desc = "Toggle Explorer (Root Dir)",
      },
    },
    opts = {
      open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
      window = {
        mappings = {
          ["<cr>"] = "open_with_window_picker",
          ["o"] = "open_with_window_picker",
          ["s"] = "split_with_window_picker",
          ["v"] = "vsplit_with_window_picker",
          ["/"] = "none", -- Disable filter, use Telescope (<leader>ff) instead
        },
      },
    },
  },
}
