let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

set number
set relativenumber
set hlsearch
set ignorecase   " case insensitive search by default
set smartcase    " if you type uppercase, match exact case
set clipboard=unnamed       " sync vim yank with system clipboard (pbcopy)

syntax enable

colorscheme dracula
