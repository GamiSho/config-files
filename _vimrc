""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set fenc=utf-8
set ambiwidth=double
set nobackup
set noswapfile
set noundofile
set autoread
set hidden
set showcmd
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
let mapleader = ","
let g:mapleader = ","
let g:python3_host_prog='C:\Users\9700114\AppData\Local\Programs\Python\Python36-32\python.exe'

" Display
set display=lastline
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set number relativenumber
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

highlight CursorLine ctermfg=Black ctermbg=White


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
au BufRead,BufNewFile *.scss set filetype=sass


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key remapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap gs :<C-u>%s///g<Left><Left><Left>
nnoremap <F12> :set relativenumber!<CR>
vnoremap <silent> * :<C-u>
            \call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>
            \call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
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
" => Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:dein_dir = expand('C:\Users\9700114\.cache\vim\dein')
let s:dein_repo_dir = s:dein_dir . '\repos\github.com\Shougo\dein.vim'

execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/vimfiler.vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-surround')
  call dein#add('nathanaelkane/vim-indent-guides')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin: vim-indent-guides
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin: Unite
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:unite_source_history_ynak_enable = 1
let g:unite_source_file_mru_limit = 100
let g:unite_source_file_mru_filename_format = ''
nnoremap [unite] <Nop>
nmap <Space>u [unite]
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]k :<C-u>Unite bookmark<CR>
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin: vimfiler
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_file_icon = '>'
let g:vimfiler_marked_file_icon = '*'
let g:vimfiler_safe_mode_by_default = 0
nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin: deoplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin: lightline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'LightlineModified',
        \   'readonly': 'LightlineReadonly',
        \   'fugitive': 'LightlineFugitive',
        \   'filename': 'LightlineFilename',
        \   'fileformat': 'LightlineFileformat',
        \   'filetype': 'LightlineFiletype',
        \   'fileencoding': 'LightlineFileencoding',
        \   'mode': 'LightlineMode'
        \ }
        \ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction