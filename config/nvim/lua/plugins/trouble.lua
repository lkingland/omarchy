-- Configure Trouble to show symbols on the left
return {
  "folke/trouble.nvim",
  opts = {
    modes = {
      symbols = {
        win = { position = "left" },
      },
      lsp = {
        win = { position = "left" },
      },
    },
  },
}
