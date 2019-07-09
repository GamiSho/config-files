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
set display=lastline
set pumheight=10
set t_Co=256
set lbr
set tw=500
set ai
set si
set wrap
set tabline=%!MyTabLine()
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
nnoremap <Leader>w :w<CR>
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
nnoremap <Leader>e :NERDTreeToggle<CR>

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

" tabline customize
function! MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return bufname(buflist[winnr - 1])
endfunction

function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999Xclose'
  endif

  return s
endfunction
