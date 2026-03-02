-- VCS-agnostic sign column (replaces gitsigns.nvim)
-- Supports jj natively; target_commit=1 fits jj new+squash workflow
-- Alternative: gauron99/jj-nvim-signs — lighter jj-only signs plugin (single file,
-- zero deps) but lacks hunk undo, inline diffs, and commit history stepping.
return {
  -- Disable LazyVim's built-in gitsigns
  { "lewis6991/gitsigns.nvim", enabled = false },

  -- vclib dependency
  { "algmyr/vclib.nvim", lazy = true },

  -- vcsigns
  {
    "algmyr/vcsigns.nvim",
    event = "LazyFile",
    config = function()
      require("vcsigns").setup({
        target_commit = 1,
      })

      local actions = require("vcsigns.actions")

      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
      end

      -- Hunk navigation (matches LazyVim gitsigns defaults)
      map("n", "]h", function() actions.hunk_next(0, vim.v.count1) end, "Next Hunk")
      map("n", "[h", function() actions.hunk_prev(0, vim.v.count1) end, "Prev Hunk")
      map("n", "]H", function() actions.hunk_next(0, 9999) end, "Last Hunk")
      map("n", "[H", function() actions.hunk_prev(0, 9999) end, "First Hunk")

      -- Hunk operations
      map({ "n", "v" }, "<leader>ghu", function() actions.hunk_undo(0) end, "Undo Hunk")
      map("n", "<leader>ghd", function() actions.toggle_hunk_diff(0) end, "Toggle Inline Diff")
      map("n", "<leader>ghf", function() require("vcsigns.fold").toggle(0) end, "Toggle Fold Around Diffs")

      -- Diff target navigation (step through commit history)
      map("n", "]r", function() actions.target_newer_commit(0, vim.v.count1) end, "Diff Target Newer")
      map("n", "[r", function() actions.target_older_commit(0, vim.v.count1) end, "Diff Target Older")

      -- Text object: inner hunk
      map({ "o", "x" }, "ih", function() require("vcsigns.textobj").select_hunk(0) end, "Inner Hunk")
    end,
  },
}
