-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

local function deleteMap(modes, lhs, opts)
  vim.keymap.del(modes, lhs, opts)
end

-- Center screen with <C-d>/<C-u>
map("n", "<C-d>", "<C-d>zz", { remap = true })
map("n", "<C-u>", "<C-u>zz", { remap = true })

-- Move marked lines up/down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in the center of the screen
-- when searching on a term
map("n", "n", "nzzzv")
map("n", "N", "nzzzv")

-- Yank to system clipboard
-- map("n", "<leader>y", '"+y')
-- map("v", "<leader>y", '"+y')
-- map("n", "<leader>Y", '"+Y')

-- -- LSP Format
-- map("n", "<leader>f", require("conform").format)
