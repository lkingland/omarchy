-- Claude Code integration for AI-assisted coding
-- Use <leader>a prefix for all Claude commands
return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  opts = function()
    -- Read preamble from dotfiles to prime Claude with Neovim context
    local f = io.open(vim.fn.expand("~/dotfiles/claude-nvim-preamble.md"), "r")
    local preamble = f and f:read("*a") or ""
    if f then f:close() end

    -- Escape for double-quoted shell string: escape \ $ ` " and newlines
    local escaped = preamble:gsub('\\', '\\\\'):gsub('%$', '\\$'):gsub('`', '\\\\`'):gsub('"', '\\"')
    return {
      terminal = {
        split_side = "right",
        split_width_percentage = 0.30,
      },
      terminal_cmd = 'claude --ide --append-system-prompt "' .. escaped .. '"',
    }
  end,
  keys = {
    { "<leader>a", nil, desc = "AI/Claude Code" },
    { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
    { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
    { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
    { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
    { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
  },
  config = function(_, opts)
    require("claudecode").setup(opts)
    require("which-key").add({
      { "<leader>a", group = "+AI/Claude", icon = "󰚩" },
    })
  end,
}
