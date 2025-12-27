-- Obsidian.nvim for wiki/notes integration
-- Workspace at ~/wiki with smart link following
return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>wn", "<cmd>ObsidianNew<cr>", desc = "New note" },
    { "<leader>ws", "<cmd>ObsidianSearch<cr>", desc = "Search notes" },
    { "<leader>wf", "<cmd>ObsidianFollowLink<cr>", desc = "Follow link" },
    { "<leader>wl", "<cmd>ObsidianLink<cr>", desc = "Link selection", mode = "v" },
    { "<leader>wc", "<cmd>ObsidianLinkNew<cr>", desc = "Create and link", mode = "v" },
  },
  config = function()
    -- Smart gf to follow obsidian links
    vim.keymap.set("n", "gf", function()
      if require("obsidian").util.cursor_on_markdown_link() then
        return "<cmd>ObsidianFollowLink<CR>"
      else
        return "gf"
      end
    end, { noremap = false, expr = true })

    -- Set conceallevel for markdown files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        vim.wo.conceallevel = 2
      end,
    })

    require("obsidian").setup({
      workspaces = {
        {
          name = "wiki",
          path = "~/wiki",
        },
      },
      disable_frontmatter = true,
      follow_url_func = function(url)
        vim.fn.jobstart({ "xdg-open", url })
      end,
      note_id_func = function(title)
        return title
      end,
    })

    require("which-key").add({
      { "<leader>w", group = "+Wiki", icon = "" },
    })
  end,
}
