require('plugins')

local o = vim.o
local wo = vim.wo
local bo = vim.bo
local g = vim.g
local cmd = vim.cmd
local map = vim.api.nvim_set_keymap

o.termguicolors = true
o.mouse = 'a'
o.clipboard = [[unnamed,unnamedplus]]
o.inccommand = 'nosplit'
o.expandtab = true
o.showmode = false
o.completeopt = [[menuone,noselect]]
o.updatetime = 300
o.hidden = true
o.tabstop = 4
o.shiftwidth = 4
wo.signcolumn = 'yes'
wo.number = true
wo.relativenumber = true
bo.swapfile = true

g.mapleader = ' '
g.nvim_tree_side = 'left'
g.slime_target = 'tmux'
cmd("let g:slime_default_config = {'socket_name': 'default', 'target_pane': '{last}'}")

local options = {noremap=true, silent=true}
map('n', '<C-h>', '<C-W>h', options)
map('n', '<C-j>', '<C-W>j', options)
map('n', '<C-k>', '<C-W>k', options)
map('n', '<C-l>', '<C-W>l', options)
map('n', '<leader>h', ':hide<cr>', options)
map('n', '<leader>t', ':NvimTreeToggle<cr>', options)
map('n', '<leader>rn', ':set relativenumber<cr>', options)

require('nvim-autopairs').setup()
require('lualine').setup{options = {theme = 'powerline'}}
require'lspconfig'.pyright.setup{}

require('compe').setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;
  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
  };
}

cmd([[highlight link CompeDocumentation NormalFloat]])

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
}

