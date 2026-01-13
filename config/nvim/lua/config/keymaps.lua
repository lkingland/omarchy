-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

-- Quit shortcuts
map({ "n", "i", "v" }, "<C-q>", "<cmd>q<cr>", { desc = "Quit" })
map("n", "QQ", "<cmd>q!<cr>", { desc = "Force Quit" })

-- Buffer/window navigation
map({ "n", "i", "v" }, "<S-Tab>", "<C-^>", { desc = "Toggle Previous Buffer", silent = true })
map({ "n", "i", "v" }, "<A-Tab>", "<cmd>wincmd p<cr>", { desc = "Toggle Previous Window", silent = true })

-- Pane resizing (Alt+hjkl)
map("n", "<A-h>", "<cmd>vertical resize -2<cr>", { desc = "Shrink Window Width" })
map("n", "<A-l>", "<cmd>vertical resize +2<cr>", { desc = "Expand Window Width" })
map("n", "<A-k>", "<cmd>resize -2<cr>", { desc = "Shrink Window Height" })
map("n", "<A-j>", "<cmd>resize +2<cr>", { desc = "Expand Window Height" })

-- Visual line navigation (respect wrapped lines)
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Neo-tree: focus instead of toggle (opens if closed, focuses if open, never closes)
map("n", "<leader>e", "<cmd>Neotree focus<cr>", { desc = "Focus Explorer" })
