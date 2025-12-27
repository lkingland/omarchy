-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- Line numbers
vim.opt.relativenumber = true
vim.opt.numberwidth = 2

-- Visual guides
vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 8
vim.opt.fillchars = { eob = " " } -- No ~ on empty lines

-- Indentation (4 spaces)
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Undo history
vim.opt.undolevels = 10000
vim.opt.undoreload = 100000

-- Comment continuation
vim.opt.formatoptions:append("r") -- Continue comments on Enter
vim.opt.formatoptions:append("o") -- Continue comments on o/O

-- Cursor (blinking block/line)
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
  .. ",a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
  .. ",sm:block-blinkwait175-blinkoff150-blinkon175"
