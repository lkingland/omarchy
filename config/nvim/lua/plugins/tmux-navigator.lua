-- Seamless navigation between tmux panes and vim windows
return {
  "christoomey/vim-tmux-navigator",
  event = "VeryLazy",
  init = function()
    vim.g.tmux_navigator_no_wrap = 1
  end,
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", mode = { "n", "t" }, desc = "Navigate Left" },
    { "<C-j>", "<cmd>TmuxNavigateDown<cr>", mode = { "n", "t" }, desc = "Navigate Down" },
    { "<C-k>", "<cmd>TmuxNavigateUp<cr>", mode = { "n", "t" }, desc = "Navigate Up" },
    { "<C-l>", "<cmd>TmuxNavigateRight<cr>", mode = { "n", "t" }, desc = "Navigate Right" },
    { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", mode = { "n", "t" }, desc = "Navigate Previous" },
  },
}
