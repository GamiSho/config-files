if !exists('g:vscode') 

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
set showtabline=2
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
set wildmenu
set history=100
set display=lastline
set pumheight=10
set t_Co=256
set lbr
set tw=500
set ai
set si
set wrap
set omnifunc=syntaxcomplete#Complete
set clipboard+=unnamed
colorscheme tender
highlight CursorLine ctermfg=Black ctermbg=White
filetype plugin on
source $VIMRUNTIME/macros/matchit.vim

" netrw -------------------- {{{
let g:netrw_liststyle=1
let g:netrw_banner=0
let g:netrw_sizestyle="H"
let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"
let g:netrw_preview=1
" }}}


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
nnoremap <Leader>w :w<CR>
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprev<CR>
nnoremap <F12> :set relativenumber!<CR>
vnoremap gs :s///g<Left><Left><Left>
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
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
" }}}


" Plugins -------------------- {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'jacoborus/tender.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'elixir-editors/vim-elixir'
call plug#end()

" NERDTree
nnoremap <C-d> :NERDTreeToggle<CR>

" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" fzf
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>gf :GFiles<CR>
nnoremap <Leader>ag :Ag<CR>
command! FZFMru call fzf#run({
      \ 'source': v:oldfiles,
      \ 'sink': 'e',
      \ 'options': '-m -x +s',
      \ 'up': '40%'})
nnoremap <Leader>fzf :FZFMru<CR>
" }}}


" Functions -------------------- {{{
" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" Hide tmux status line while vim  is running."
if !has('gui_running') && $TMUX !=# ''
  augroup Tmux
    autocmd!
    autocmd VimEnter,VimLeave * silent !tmux set status
  augroup END
endif

" set showtabline=1
highlight! TabNumSel term=bold,reverse cterm=bold,reverse ctermfg=17 ctermbg=10 gui=bold
highlight! WinNumSel term=bold cterm=bold ctermfg=2
" }}}
"

else
  " ##### This is VS Code nvim setting #####"
endif
