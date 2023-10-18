require('plugins')
require('maps')
require('settings')
require('lualine').setup()
require('leap').setup {
  highlight_ahead_of_time = true,
  highlight_unlabeled = false,
  case_sensitive = false,
}
require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "typescript", "vue", "json", "php" },
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
require('telescope').setup {
  pickers = {
    find_files = {
      theme = "dropdown",
    },
    live_grep = {
      theme = "dropdown",
    },
    buffers = {
      theme = "dropdown",
    },
  },
}

