"==================================
"==== Vim Config Schall Anthony ===
"==================================

"============
"Vim Config =
"============

" No compatility

set nocompatible


" Automatic realoding of .vimrc

autocmd! bufwritepost .vimrc source %


" Better copy & paste
"" Press F2 before you paste (should see -- INSERT (paste) -- )

set pastetoggle=<F2>
set clipboard=unnamed


" Backspace

set bs=2 "make backspace work normaly


" <Leader> remapping

let mapleader=","


" Window mouvement binding

map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h


" Between tabs mouvement

map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Better indentation for code Blocks

vnoremap < <gv
vnoremap > >gv


" Show white spaces (placed before colorscheme command)

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Enable syntax highlight

filetype off
filetype plugin indent on
syntax on

" Showing line numbers and length

set number  	" Shows line numbers
set tw=79   	" width of document (used by gd)
set nowrap	" don't automatically wrap on load
set fo-=t	" don't automatically wrap when typing
set colorcolumn=110
highlight ColorColumn ctermbg=233

" History and undolevels

set history=700
set undolevels=700


" Disable backup files

set nobackup
set nowritebackup
set noswapfile


"===========================
" Vundle Plugin Management =
"===========================

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle auto-managemment

Plugin 'VundleVim/Vundle.vim'

" Plugin list

Plugin 'crusoexia/vim-monokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ikien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'

call vundle#end()


"================
" Plugin Config =
"================


" Color Scheme

set t_Co=256
colorscheme monokai


" Vim-Airline

set laststatus=2
let g:airline_theme='badwolf'

" CtrlP

let g:ctrlp_max_height=30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" NERDTree

map <C-n> :NERDTreeToggle<CR>
"" NERDTree close when last window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Ultisnips

let g:UltiSnipsExpandTrigger="<C-o>"


" Syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
