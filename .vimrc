" .vimrc
" configured by dainglis
" last updated 2022-01-12

" line numbers
set nu

" disables error bells, replaces all other 'bell' instances with a
" visual flash instead of sound
set visualbell
set noerrorbells

" default colorscheme 
colorscheme desert

" allows mouse usage in all modes
set mouse=a

" enables syntax highlighting
syntax enable

" use smart indenting
set autoindent
filetype plugin indent on

" tab character is worth 4 spaces
set tabstop=4

" indenting is worth 4 spaces
set shiftwidth=4

" tab key inserts 4 spaces
set expandtab

" shows a visual line on the cursor's current line
set cursorline

"
" Using Vim 8 built-in package manager
" packages in use:
"   tpope/vim-sensible
