vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.splitright = true
opt.splitbelow = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.scrolloff = 8
opt.confirm = true
opt.showmode = false
opt.cmdheight = 0
opt.laststatus = 2
opt.hlsearch = true

vim.cmd("syntax enable")
