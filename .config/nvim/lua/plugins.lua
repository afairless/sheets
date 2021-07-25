return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'jpalardy/vim-slime'
  use 'christoomey/vim-tmux-navigator'
  use 'kyazdani42/nvim-tree.lua'
  use 'windwp/nvim-autopairs'
  use 'glepnir/indent-guides.nvim'
  use 'hoob3rt/lualine.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'nvim-treesitter/nvim-treesitter'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
end)
