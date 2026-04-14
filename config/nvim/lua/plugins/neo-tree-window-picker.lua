-- Configure neo-tree: window picker + jj source
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

  -- neo-tree-jj: jj status source for neo-tree
  -- PATCH REQUIRED: sources/jj/utils.lua — default `jj diff --summary` only shows
  -- changes in @. Add `--from "roots(ancestors(@, 2))"` to match vcsigns' target_commit=1
  -- behavior (diff from grandparent, persists across `jj new`).
  {
    "Cretezy/neo-tree-jj.nvim",
    dependencies = { "nvim-neo-tree/neo-tree.nvim" },
  },

  -- Configure neo-tree
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
      {
        "<leader>ej",
        "<cmd>Neotree jj<cr>",
        desc = "Explorer JJ Status",
      },
    },
    opts = function(_, opts)
      -- Register the jj source
      opts.sources = opts.sources or {}
      if not vim.tbl_contains(opts.sources, "jj") then
        table.insert(opts.sources, "jj")
      end

      -- Replace git_status tab with jj tab in source selector (if in a jj repo)
      local ok, jj_utils = pcall(require, "neo-tree.sources.jj.utils")
      if ok and jj_utils.get_repository_root() then
        if opts.source_selector and opts.source_selector.sources then
          for i, source in ipairs(opts.source_selector.sources) do
            if source.source == "git_status" then
              table.remove(opts.source_selector.sources, i)
              break
            end
          end
          table.insert(opts.source_selector.sources, {
            display_name = "  JJ",
            source = "jj",
          })
        end
      end

      -- Disable git status on filesystem source (broken with jj; vcsigns handles the gutter)
      opts.filesystem = opts.filesystem or {}
      opts.filesystem.enable_git_status = false

      -- Merge remaining opts
      opts.open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" }
      opts.window = vim.tbl_deep_extend("force", opts.window or {}, {
        mappings = {
          ["<cr>"] = "open_with_window_picker",
          ["o"] = "open_with_window_picker",
          ["s"] = "split_with_window_picker",
          ["v"] = "vsplit_with_window_picker",
          ["/"] = "none",
        },
      })
    end,
  },
}
