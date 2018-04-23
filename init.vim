""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
scriptencoding utf-8
let g:python_host_prog='C:\Python27\python.exe'
let g:python3_host_prog='C:\Users\9700114\AppData\Local\Programs\Python\Python36-32\python.exe'
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
colorscheme PaperColor
if has("gui_running")
    set lines=35 columns=100
endif


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
map <space> /
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
    autocmd BufWritePre *.txt,*.js,*.py,
                       \*.json,*.css,*.scss
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

"vnoremap
vnoremap gs :s///g<Left><Left><Left>
vnoremap L $
vnoremap H ^


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
let s:dein_dir = expand('C:\Users\9700114\.cache\nvim\dein')
let s:dein_repo_dir = s:dein_dir . '\repos\github.com\Shougo\dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone git@github.com:Shougo/dein.vim.git' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_dir)

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('scrooloose/nerdtree')
call dein#add('itchyny/lightline.vim')
call dein#add('NLKNguyen/papercolor-theme')

call dein#end()

if dein#check_install()
  call dein#install()
endif

syntax enable

"if dein#load_state(s:dein_dir)
"    call dein#begin(s:dein_dir)
"    let s:toml_dir = expand('C:\Users\9700114\.config\nvim')
"    call dein#load_toml(s:toml_dir . '\dein.toml', {'lazy': 0})
"    call dein#load_toml(s:toml_dir . '\dein_lazy.toml', {'lazy': 1})
"    call dein#end()
"    call dein#save_state()
"endif

" deoplete
let g:deoplete#enable_at_startup = 1

" NERDTree
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd bufenter * if (winnr("$") == 1 &&
            \exists ("b:NERDTreeType") &&
            \ b:NERDTreeType == "primary") | q | endif
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight '
        \ . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match '
        \ . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
" Flat UI Colors: #8e44ad #95a5a6 #27ae60 #d35400 #f39c12 #f1c40f #16a085
" Flat UI Colors: #1abc9c #2ecc71 #3498db #9b59b6 #ecf0f1 #7f8c8d
call NERDTreeHighlightFile('js', 'Red', 'none', '#e74c3c', 'none')
call NERDTreeHighlightFile('json', 'cyan', 'none', '#27ae60', 'none')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#2980b9', 'none')
call NERDTreeHighlightFile('scss', 'Red', 'none', '#ff72b9', 'none')

" lightline
let g:lightline = {
    \ 'colorscheme': 'wombat'
    \ }

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
