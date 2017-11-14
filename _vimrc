" General
set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
filetype plugin on
filetype indent on
let mapleader = ","
let g:mapleader = ","

" Display
set display=lastline
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set number
set title
set showmatch
set matchtime=1
set smartindent
set virtualedit=onemore
set laststatus=2
set wildmode=list:longest
set cursorline
set display=lastline
set pumheight=10
set t_Co=256
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


""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


au BufRead,BufNewFile *.scss set filetype=sass

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
vnoremap <silent> * :<C-u>
            \call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>
            \call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
vnoremap gs :s///g<Left><Left><Left>


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


""""""""""""""""""""""""""""""""""""""""""""""
" => Search
""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase
set smartcase
set wrapscan
set hlsearch
set incsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('md',     'green',   'none', '#33ff54', '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('js',     'yellow',  'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('java',   'Magenta', 'none', '#ff00e6', '#151515')
call NERDTreeHighlightFile('bat',    'Red',     'none', '#f64a32', '#151515')
