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

" Add some colors
set termguicolors
set background=dark
colorscheme pink-moon

" Plugins
call plug#begin('~/.config/nvim/plugs')
Plug 'neomake/neomake'
call plug#end()

" Latex configuration
let g:tex_flavor = "latex"
let g:neomake_tex_chktex_maker = {
	\ 'exe': 'chktex',
	\ 'args': ['-q', '-v0', '-g', '-l', expand('~/.config/chktexrc')],
	\ 'errorformat': '%f:%l:%c:%n:%m'
	\}

let g:neomake_tex_pdflatex_maker = {
	\ 'exe': 'pdflatex',
	\ 'args': ['-file-line-error', '-interaction', 'nonstopmode'],
	\ 'errorformat': '%E%f:%l: %m'
	\}

call neomake#configure#automake('wn')

let g:neomake_tex_enabled_makers = ['chktex', 'pdflatex']

