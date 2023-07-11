vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>pv", vim.cmd.Ex)

keymap.set("i", "jj", "<ESC>")
keymap.set("n", "<leader>q", "<cmd>q<cr>")
keymap.set("n", "<leader>w", "<cmd>w<cr>")

keymap.set("v", "<up>", ":m '<-2<CR>gv=gv")
keymap.set("v", "<down>", ":m '>+1<CR>gv=gv")
keymap.set("n", "<up>", ":m .-2<CR>==")
keymap.set("n", "<down>", ":m .+1<CR>==")

keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("x", "<leader>p", [["_dP]])

keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

keymap.set({ "n", "v" }, "<leader>d", [["_d]])

keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "<leader>c", [[:!cp % %:p:h/]])
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
