-- Register comma as a which-key prefix for code actions
return {
  "folke/which-key.nvim",
  opts = {
    spec = {
      { ",", group = "Code", icon = "" },
    },
  },
  keys = {
    { ",", function() require("which-key").show({ keys = "," }) end, desc = "Code", mode = "n" },
  },
}
