vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

require('options')
require('plugins')
require('keymaps')
require('colorscheme')
require('lsp')
--Plugin Files
require('nvim-tree-config')
