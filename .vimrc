set nocompatible
set encoding=utf-8
set noswf
set nowritebackup
set undofile
set undodir=/home/maelstrom/.vim/vimundo
set tabpagemax=64
set guitablabel=%-.>-t

" -- GUI Display modifications

set number
set scrolloff=10
set cursorline

" -- Search

set ignorecase
set smartcase
set incsearch
set hlsearch

" -- Typing behavior

set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab
"set autoindent
set nowrap

" -- File specific behavior

set autoread
filetype on

" -- Theme

set t_Co=256

syntax enable
"set background=dark
colorscheme monokai
let g:monokai_italic = 1

" -- Autocmd

"autocmd BufEnter * set noexpandtab
"autocmd BufEnter *.py set expandtab

autocmd BufEnter *.py,*.c,*.h,*.cpp,*.hpp,*.java set colorcolumn=80

" -- YCM

let g:ycm_global_ycm_extra_conf = '/home/maelstrom/.ycm_extra_conf.py'

" -- Key Mapping

map <F7> :tabp<CR>
map <F8> :tabn<CR>
