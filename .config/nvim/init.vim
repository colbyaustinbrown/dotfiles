syntax on
filetype plugin indent on

" Turn on persistent undo for only tex files
let whitelist = ['tex']
set undofile
set undodir=$HOME/.vim/undo
autocmd BufWritePre * if index(whitelist, &ft) < 0 | set noundofile

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
" set relativenumber
set ruler

" Move by virtual lines when no motion is used
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

nnoremap <esc> :noh<return><esc>

" tab expansion
set tabstop=4
set expandtab

" Add some colors
set termguicolors
set background=dark
colorscheme pink-moon

" Shift + J/K moves selected lines down/up in zinual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Plugins
call plug#begin('~/.config/nvim/plugs')
Plug 'colbyaustinbrown/neomake'
Plug 'kshenoy/vim-signature'
Plug 'lervag/vimtex'
" Plug 'SirVer/ultisnips'
" Plug 'neoclide/coc.nvim'
call plug#end()

" Vimtex configuration
let g:tex_flavor = 'latex'
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_types = {
        \ 'envs' : {
        \   'enabled': 0
        \ }
        \}
let g:vimtex_view_method = 'zathura'
if empty(v:servername) && exists('*remote_startserver')
    call remote_startserver('VIM')
endif

" Latex configuration
" let g:tex_flavor = "latex"
" let g:neomake_tex_chktex_maker = {
"	\ 'exe': 'chktex',
"	\ 'args': ['-q', '-v0', '-g', '-l', expand('~/.config/chktexrc')],
"	\ 'errorformat': '%f:%l:%c:%n:%m'
"	\}

let g:neomake_tex_pdflatex_maker = {
	\ 'exe': 'pdflatex',
	\ 'args': ['-file-line-error', '-interaction', 'nonstopmode'],
    \ 'append_file': 0,
	\ 'errorformat': '%E%f:%l: %m'
	\}

function! PdfLatexExe(options) dict
	let maker = deepcopy(self)
	let event = get (a:options, 'event', 'manual')
	if !(event ==# 'manual')
		call add(maker.args, '-draftmode')
	endif
    if exists("b:vimtex['tex']")
        let maker.cwd = fnamemodify(b:vimtex['tex'], ':p:h')
        call insert(maker.args, b:vimtex['tex'], 0)
    else
        call insert(maker.args, '%t', 0)
    endif
	return maker
endfunction
call neomake#config#set('ft.tex.InitForJob', function('PdfLatexExe'))
call neomake#configure#automake('wn')

" let g:neomake_tex_enabled_makers = ['chktex', 'pdflatex']
let g:neomake_tex_enabled_makers = ['pdflatex']

" coc configuration
inoremap <expr> <c-space> pumvisible() ? "\<C-n>" : "\<Tab>"

