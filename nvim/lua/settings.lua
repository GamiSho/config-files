local opt = vim.opt

opt.mouse = 'a'
opt.title = true
opt.ambiwidth = 'double'
opt.swapfile = false
opt.backup = false
opt.hidden = true
opt.clipboard:append({unnamedplus = true})
opt.number = true
opt.list = true
opt.listchars = 'tab:>-', 'trail:*', 'nbsp:+'
opt.smartindent = true
opt.visualbell = true
opt.showmatch = true
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.ignorecase = true
opt.smartcase = true
opt.wrapscan = true
opt.whichwrap = 'b', 's', 'h', 'l', '<', '>', '[', ']'
opt.helplang = 'ja', 'en'
opt.updatetime = 300
opt.showtabline = 2
opt.rtp:append('/opt/homebrew/opt/fzf')

vim.cmd('colorscheme tender')
vim.cmd('language en_US')

vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.python3_host_prog = '/Users/genronnewimac/.anyenv/envs/pyenv/shims/python'
