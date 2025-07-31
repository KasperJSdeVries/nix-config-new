vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", "Km '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "paste without modifying pastebuffer" })

vim.keymap.set({"n","v"}, "<leader>y", [["+y]], { desc = "yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "yank line to system clipboard" })

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = "delete without modifying pastebuffer" })

vim.keymap.set("n", "Q", "<nop>")
