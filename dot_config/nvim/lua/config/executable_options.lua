-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable autoformat
vim.g.autoformat = false

-- Disable comment continuation formatting
vim.opt.formatoptions:remove({ "c", "r", "o" })

vim.g.backupcopy = "yes"

vim.opt.relativenumber = true
