" Load up pathogen.vim for managing plugins
execute pathogen#infect()

syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype plugins for lang-specific scripts

colo codeschool   " Set the colorscheme

:set nocompatible " Disable vi compatability
:set expandtab    " Spaces to tabs
:set tabstop=2    " Number of  spaces per tab
:set shiftwidth=2 " Number of spaces for indentation
:set number       " Enable line numbers
:set ruler        " Show row and column at bottom right
:set incsearch    " Incremental searches
:set ignorecase   " Ignore cases in searches
:set smartcase    " Case sensitive only if pattern includes uppercase letter
:set autoindent   " Auto-indent new lines
:set smartindent  " Auto-indent at beginning of lines
:set smarttab     " Get backspaces to work with tab-spaces
:set mouse=a
:set backspace=indent,eol,start

autocmd BufWritePre * :%s/\s\+$//e " Strip trailing whitespace

highlight clear SignColumn " Remove background highlighting for gutter
highlight LineNr ctermfg=darkgrey ctermbg=NONE " Dark grey line numbers

" Start CtrlP with ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" :nt as a shortcut for opening NERDTree
map :nt <Esc>:NERDTree<CR>

" Close NERDTree if it is the last and only buffer
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Set the status line at the bottom
:set laststatus=2

" ctrl-l - next tab
" ctrl-h - previous tab
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>

" :t as an abbreviation for :tabnew
ca t tabnew

" :ack as an alias for :Ack
cnoreabbrev ack Ack

" Open symbol in a new tab with ctrl-\
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" :tb as a shortcut for :tab ball (Opens all buffers in tabs)
map :tb <Esc>:tab ball<CR>

" :bo as a shortcut cfor closing all buffers but this one
map :bo <Esc>:BufOnly<CR>

" Shift-Tab to de-indent current line
imap <S-Tab> <C-o><<
