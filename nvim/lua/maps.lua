local map = vim.keymap.set

map('n', '<space>', '', {})
vim.g.mapleader = ' '


options = { noremap = true }
map('n', '<leader><esc>', ':nohlsearch<cr>', options)
map('n', '<leader>n', ':bnext<cr>', options)
map('n', '<leader>p', ':bprev<cr>', options)
map('n', '<leader>j', '<Plug>(leap-forward)', options)
map('n', '<leader>k', '<Plug>(leap-backward)', options)
map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', options)
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', options)
map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', options)

map('n', 'j', 'gj', optioins)
map('n', 'k', 'gk', optioins)
map('n', 'L', '$', optioins)
map('n', 'H', '^', optioins)
map('i', 'jk', '<esc>', { noremap = true, silent = true })
map('i', '"', '""<ESC>i', options)
map('i', '\'', '\'\'<ESC>i', options)
map('i', '(', '()<ESC>i', options)
map('i', '[', '[]<ESC>i', options)
map('i', '{', '{}<ESC>i', options)
map('i', '{<CR>', '{<CR>}<ESC>O', options)
map('t', '<ESC>', '<C-\\><C-n>', options)
