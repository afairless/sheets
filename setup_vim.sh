#!/bin/bash

# Andrew Fairless, June 2016
# This script configures Vim
# This script downloads and installs Vundle, which is a plugin manager for vimrc
# WARNING:  This script will overwrite any existing '.vimrc' file

# Some settings taken from Martin Brochhaus:
# https://github.com/mbrochh/vim-as-a-python-ide/blob/master/.vimrc


# downloads Vundle
if [ -d "~/.vim/bundle/vundle" ]; then
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

cat <<EOF > ~/.vimrc

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" plugins/bundles installed by Vundle
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Bundle 'davidhalter/jedi-vim'

filetype plugin indent on


" The rest of your config follows here

" Toggles among showing absolute line numbers, relative line numbers, and none
function! LineToggle()
  if(&relativenumber == 1)
    set norelativenumber | set number!
  elseif(&number == 1)
    set relativenumber
  else
    set number!
  endif
endfunc
nmap <F1> :call LineToggle()<cr>

" Removes PyLint messages on left margin of code
map <F2> :sign unplace *<cr> <cr>
" Alternative:  this command permanently disables PyLint messages on left margin of code:
" let g:pymode_lint_signs = 0

" Removes PyLint messages on left margin of code
map <F3> :only <cr>

" Lets the 'F5' key toggle NerdTree on and off
map <F5> :NERDTreeToggle<CR>

" Replaces tabs with spaces
set tabstop=4
"set softtabstop=4
set shiftwidth=4
"set shiftround
set expandtab

" Python-mode configuration below:
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 1

EOF

