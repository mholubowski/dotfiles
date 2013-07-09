" Load up pathogen.vim for managing plugins
execute pathogen#infect()

syntax on                  " Enable syntax highlighting
highlight clear SignColumn " Remove background highlighting for gutter
filetype plugin on         " Enable filetype plugins for lang-specific scripts

:set expandtab    " Spaces to tabs
:set tabstop=2    " Number of  spaces per tab
:set shiftwidth=2 " Number of spaces for indentation
:set number       " Enable line numbers
:set ruler        " Show row and column at bottom right
:set incsearch    " Incremental searches
:set ignorecase   " Ignore cases in searches
:set smartcase    " Case sensitive only if pattern includes uppercase letter
:set tw=72
:set backspace=indent,eol,start

highlight LineNr ctermfg=darkgrey ctermbg=NONE " Dark grey line numbers

" Start CtrlP with ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" autocmd VimEnter * NERDTree " Autostart NERDTree
" autocmd VimEnter * wincmd p " Focus on the file instead of NERDTree

" Close NERDTree if it is the last and only buffer
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Set the status line at the bottom
set statusline=%t                        " Tail of the filename
set statusline+=%{fugitive#statusline()} " git status

" ctrl-I - next tab
" ctrl-h - previous tab
" ctrl-n - new tab
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
" map  <C-n> :tabnew<CR>

" t as an abbreviation for tabnew
ca t tabnew
