require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <r>")
map({ "n" }, "<C-f>", "<C-f>zz")
map({ "n" }, "<C-b>", "<C-b>zz")
