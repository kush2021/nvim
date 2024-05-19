require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")
map("n", "ˆ", "<M-i>")
map("n", ";", ":", { noremap = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
