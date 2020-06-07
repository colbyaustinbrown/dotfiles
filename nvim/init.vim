syntax on
filetype plugin indent on

" Obliterate arrow keys!
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

set incsearch
set scrolloff=2

" Set hybrid absolute / relative line numbering
set number
set relativenumber
set ruler

" Move by virtual lines when no motion is used
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent <expr> k (v:count == 0 ? 'gk' : 'k')

nnoremap <esc> :noh<return><esc>

