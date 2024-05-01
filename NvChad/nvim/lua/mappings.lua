require "nvchad.mappings"

local map = vim.keymap.set
local options = { noremap = true }

map('n', 'j', 'gj', options)
map('n', 'k', 'gk', options)
map('n', 'L', '$', options)
map('n', 'H', '^', options)
map('i', 'jk', '<esc>', { noremap = true, silent = true })
map('i', '"', '""<ESC>i', options)
map('i', '\'', '\'\'<ESC>i', options)
map('i', '(', '()<ESC>i', options)
map('i', '[', '[]<ESC>i', options)
map('i', '{', '{}<ESC>i', options)
map('i', '{<CR>', '{<CR>}<ESC>O', options)
map('i', '<C-f>', '<right>', options)
map('i', '<C-b>', '<left>', options)
map('i', '<C-p>', '<Up>', options)
map('i', '<C-n>', '<Down>', options)
map('t', '<ESC>', '<C-\\><C-n>', options)
map("n", "<leader>ff", ":Telescope <cr>")

