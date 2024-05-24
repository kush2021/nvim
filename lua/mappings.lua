require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")
map("n", "<C-f>", "<C-f>zz")
map("n", "<C-u>", "<C-u>zz")
