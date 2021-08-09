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
g.floaterm_width = 0.8
g.floaterm_height = 0.8
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

vim.o.background = 'dark' -- or 'light'
vim.cmd([[colorscheme gruvbox]])

require('nvim-autopairs').setup()
require('lualine').setup{options = {theme = 'powerline'}}
require'lspconfig'.pyright.setup{}
require('lspkind').init()
require'nvim-web-devicons'.setup()

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
  rainbow = {
    enable = true,
    extended_mode = true,  -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = 1000  -- Do not enable for files with more than 1000 lines, int
  },
}

vim.g.symbols_outline = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = true,
    position = 'right',
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    keymaps = { 
        close = {"<Esc>", "q"},
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        rename_symbol = "r",
        code_actions = "a",
    },
    lsp_blacklist = {},
}
