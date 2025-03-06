vim.cmd([[
source ~/.vimrc
]])

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")

vim.cmd.colorscheme "catppuccin"