""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
scriptencoding utf-8
let g:python3_host_prog=''
let mapleader = ","
let g:mapleader = ","
set nobackup
set noswapfile
set autoread
set hidden
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set display=lastline
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set showmatch
set mat=2
set noerrorbells
set novisualbell
set t_vb=
set tm=500
syntax on
set expandtab
set number
set title
set noshowmode
set matchtime=1
set pumheight=10
set background=light
set wildmode=list:longest
set cursorline
set t_Co=256
set termguicolors
colorscheme tender


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set lbr
set tw=500
set ai
set si
set wrap


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <c-space> ?
map <silent> <leader><cr> :noh<cr>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <leader>bd :Bclose<cr>:tabclose<cr>gT
map <leader>ba :bufdo bd<cr>
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>sv :source ~/.config/nvim/init.vim<CR>
map <Leader>ev :e ~/.config/nvim/init.vim<CR>
map 0 ^
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Delete trailing white space on save
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.php,*.go,
                       \*.json,*.css,*.scss,*.sass
                       \ :call CleanExtraSpaces()
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>ss :setlocal spell!<cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key remapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap
nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap gs :<C-u>%s///g<Left><Left><Left>
nnoremap <silent><C-e> :NERDTreeToggle<CR>
noremap <RightMouse> :call nvim_input('*')

"inoremap
inoremap { {}<Left>
inoremap [ []<Left>
inoremap < <><Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
            \"inoremapinoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap ` ``<LEFT>

"vnoremap
vnoremap gs :s///g<Left><Left><Left>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase
set smartcase
set wrapscan
set hlsearch
set incsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" lightline
"let g:lightline = {
"    \ 'colorscheme': 'wombat'
"    \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Return true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! s:download(url) abort
    let content = ''
    if executable('curl')
        let content = system('curl', -sL '.shellescape(a:url)')
    endif
endfunction
