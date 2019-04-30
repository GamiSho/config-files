" Basic settings
let maplocalleader = "-"
let mapleader = ","
let g:mapleader = ","
let g:python3_host_prog='/usr/bin/python3'
set encoding=utf-8
set fenc=utf-8
set tabstop=2
set shiftwidth=2
set smartindent
set expandtab
set autoindent
set ambiwidth=double
set nobackup
set noswapfile
set noundofile
set autoread
set hidden
set showcmd
set display=lastline
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set number relativenumber
set title
set showmatch
set matchtime=1
set virtualedit=onemore
set laststatus=2
set wildmode=list:longest
set display=lastline
set pumheight=10
set t_Co=256
set lbr
set tw=500
set ai
set si
set wrap
colorscheme tender
highlight CursorLine ctermfg=Black ctermbg=White


" Key remappings -------------------- {{{
nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap H ^
nnoremap L $
nnoremap ^ H
nnoremap $ L
nnoremap - <nop>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap gs :<C-u>%s///g<Left><Left><Left>
nnoremap <F12> :set relativenumber!<CR>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
vnoremap gs :s///g<Left><Left><Left>
vnoremap H ^
vnoremap L $
vnoremap ^ H
vnoremap $ L
inoremap jk <Esc>
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
" }}}


" Abbreviations -------------------- {{{
iabbrev adn and
iabbrev waht what
iabbrev tehn then
iabbrev @@ sho_yasugami@cm.jip.co.jp
" }}}


" FileType-specific settings -------------------- {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup filetype_comment_out
  autocmd!
  autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
  autocmd FileType php nnoremap <buffer> <localleader>c I//<esc>
  autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
augroup END

augroup filetype_indent
  autocmd!
  autocmd BufNewFile, BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd BufNewFile, BufRead *.php setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd BufNewFile, BufRead *.go setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END
" }}}


" Search options -------------------- {{{
set ignorecase
set smartcase
set wrapscan
set hlsearch
set incsearch
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>
" }}}

noremap <RightMouse> :call nvim_input('*')

" Plugins -------------------- {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'jacoborus/tender.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

nnoremap <silent><C-e> :NERDTreeToggle<CR>
" }}}
