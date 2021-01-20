"options
syntax on
filetype plugin on
set number
set incsearch
set smartindent
set spell
set termguicolors



"plugins
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'gruvbox-community/gruvbox'
Plug 'scrooloose/nerdtree'

call plug#end()


"nerdtree shortcuts
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


"default theme
colorscheme gruvbox
