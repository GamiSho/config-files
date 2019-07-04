" Basic settings
let maplocalleader = "-"
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"
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
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Key remappings -------------------- {{{
noremap <RightMouse> :call nvim_input('*')
nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap H ^
nnoremap L $
nnoremap ^ H
nnoremap $ L
nnoremap - <nop>
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprev<CR>
nnoremap <F12> :set relativenumber!<CR>
vnoremap gs :s///g<Left><Left><Left>
vnoremap H ^
vnoremap L $
vnoremap ^ H
vnoremap $ L
inoremap jk <Esc>
inoremap " ""<Left>
inoremap ' ''<Left>
tnoremap <C-j> <C-\><C-n>

" Pair Brackets
function! ConditionalPairMap(open, close)
  let line = getline('.')
  let col = col('.')
  if col < col('$') || stridx(line, a:close, col + 1 ) != -1
    return a:open
  else
    return a:open . a:close . repeat("\<left>", len(a:close))
  endif
endfunction
inoremap <expr> ( ConditionalPairMap('(', ')')
inoremap <expr> { ConditionalPairMap('{', '}')
inoremap <expr> [ ConditionalPairMap('[', ']')
" }}}


" Abbreviations -------------------- {{{
iabbrev adn and
iabbrev waht what
iabbrev tehn then
iabbrev teh the
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
  autocmd FileType ruby nnoremap <buffer> <localleader>c I#<esc>
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


" Plugins -------------------- {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'jacoborus/tender.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

" NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" fzf
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>gf :GFiles<CR>
nnoremap <Leader>ag :Ag<CR>
command! FZFMru call fzf#run({
      \ 'source': v:oldfiles,
      \ 'sink': 'e',
      \ 'options': '-m -x +s',
      \ 'down': '40%'})
nnoremap <Leader>fzf :FZFMru<CR>
" }}}
