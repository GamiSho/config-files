vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'rebelot/kanagawa.nvim'
  use 'wbthomason/packer.nvim'
  use 'ggandor/leap.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  --use { 'jacoborus/tender.vim', opt = true }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }
end)

