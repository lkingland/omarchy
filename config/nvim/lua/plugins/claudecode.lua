-- Claude Code integration for AI-assisted coding
-- Use <leader>a prefix for all Claude commands
return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  opts = {
    terminal = {
      split_side = "right",
      split_width_percentage = 0.30,
    },
    terminal_cmd = "claude --ide --append-system-prompt-file ~/dotfiles/claude-nvim-preamble.md",
  },
  keys = {
    { "<leader>a", nil, desc = "AI/Claude Code" },
    { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
    { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
    { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
    { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
    { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
    { "<leader>as", function()
        vim.cmd("ClaudeCodeSend")
        vim.schedule(function()
          vim.cmd("ClaudeCodeFocus")
          vim.cmd("startinsert")
        end)
      end, mode = "v", desc = "Send to Claude" },
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    { "<leader>aR", function()
        vim.cmd("checktime")          -- Reload any changed buffers
        vim.cmd("edit")               -- Force reload current buffer
        vim.cmd("LspRestart")         -- Restart LSP for fresh diagnostics
        -- Refresh todo-comments if available
        local ok, todo = pcall(require, "todo-comments")
        if ok and todo.refresh then
          todo.refresh()
        end
      end, desc = "Refresh buffers & LSP" },
  },
  config = function(_, opts)
    require("claudecode").setup(opts)
    require("which-key").add({
      { "<leader>a", group = "+AI/Claude", icon = "󰚩" },
    })
  end,
}
