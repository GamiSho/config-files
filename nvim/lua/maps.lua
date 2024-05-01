local map = vim.keymap.set

map('n', '<space>', '', {})
vim.g.mapleader = ' '


local options = { noremap = true }
map('n', '<leader><esc>', ':nohlsearch<cr>', options)
map('n', '<leader>n', ':bnext<cr>', options)
map('n', '<leader>p', ':bprev<cr>', options)
map('n', '<leader>j', '<Plug>(leap-forward)', options)
map('n', '<leader>k', '<Plug>(leap-backward)', options)
map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', options)
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', options)
map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', options)

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
