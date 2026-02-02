-- Add popup hunk preview (LazyVim's ghp is inline only)
return {
  "lewis6991/gitsigns.nvim",
  keys = {
    { "<leader>ghP", ":Gitsigns preview_hunk<cr>", desc = "Preview Hunk (Popup)" },
  },
}
