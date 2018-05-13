"------------------------------------------------------------------------------

" Vundle

"------------------------------------------------------------------------------

" set the runtime path to include Vundle and initialize
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'flazz/vim-colorschemes'

"""""""" vim scripts """"""""""""""""""
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/c.vim'
Plugin 'vim-scripts/minibufexpl.vim'
Plugin 'vim-scripts/comments.vim'
Plugin 'vim-scripts/winmanager'
Plugin 'vim-scripts/syntastic'
"""""""" git script """""""""""""""""""
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'scrooloose/syntastic'
Plugin 'Lokaltog/vim-powerline'

"""""""  go script """"""""""""
Plugin 'fatih/vim-go'
Plugin 'Shougo/neocomplete'
Plugin 'majutsushi/tagbar'
Plugin 'dgryski/vim-godef'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"------------------------------------------------------------------------------

" nerdtree settings

"------------------------------------------------------------------------------
"autocmd vimenter * NERDTree
map <F2> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <silent> <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"------------------------------------------------------------------------------

" ctags settings

"------------------------------------------------------------------------------
let Tlist_Ctags_Cmd ='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
set tags=./.tags;,.tags
"let g:molokai_original = 1
"let g:rehash256 = 1
"colorscheme molokai
"------------------------------------------------------------------------------

" neocomplete  setting

"------------------------------------------------------------------------------
let g:neocomplete#enable_at_startup = 1

let g:godef_split=0
let g:godef_same_file_in_same_window=1
"------------------------------------------------------------------------------

" syntastic setting

"------------------------------------------------------------------------------
let g:syntastic_check_on_open = 1
let g:syntastic_lua_checkers = ['lua', 'luac']
let g:syntastic_go_checkers = ['go', 'gofmt', 'golint'] 
"------------------------------------------------------------------------------

" Powerline setting

"------------------------------------------------------------------------------
set laststatus=2
let g:Powerline_symbols='unicode'

"set foldenable
"set foldnestmax=1
"set foldmethod=syntax

"------------------------------------------------------------------------------

" YouCompleteMe setting

"------------------------------------------------------------------------------

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

"let g:ycm_error_symbol = '>>'
"let g:ycm_warning_symbol = '>*'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>

set completeopt=longest,menu
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"force recomile with syntastic
inoremap <leader><leader> <C-x><C-o>
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0

"------------------------------------------------------------------------------

" syntastic setting

"------------------------------------------------------------------------------
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Ctags_Cmd="/usr/bin/ctags"

"------------------------------------------------------------------------------
" vim-go setting
"------------------------------------------------------------------------------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

"------------------------------------------------------------------------------

" TagBar Setting

"------------------------------------------------------------------------------
nmap <F8> :TagbarToggle<CR>


"------------------------------------------------------------------------------

" ack Setting

"------------------------------------------------------------------------------
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

nmap <F4> :Ack


"------------------------------------------------------------------------------

" WinManager Setting

"------------------------------------------------------------------------------
let g:winManagerWindowLayout='NERDTree|TagList'
let g:winManagerWidth=30
"let g:AutoOpenWinManager = 1
nmap wm :WMToggle<cr>

"------------------------------------------------------------------------------

" settings

"------------------------------------------------------------------------------
set nocompatible            " be iMproved, required
filetype off                " required

" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile *.md set filetype=markdown

" color scheme
colorscheme molokai


" Backspace deletes like most programs in insert mode
set backspace=2
" Show the cursor position all the time
set ruler
" Display incomplete commands
set showcmd
" Set fileencodings
set fileencodings=ucs-bom,utf-8,cp936,gb2312,gb18030,big5
set background=dark
set encoding=utf-8
set fenc=utf-8
set smartindent
set autoindent
set cul
set linespace=2
set showmatch
set lines=47 columns=90
"set transparency=8

" Numbers
set number
"set numberwidth=5

" font and size
"set guifont=Andale Mono:h14
"set guifont=Monaco:h11
set guifont=Menlo:h14

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set softtabstop=2
set expandtab
set smarttab

" Display extra whitespace
"set list listchars=tab:»·,trail:·
"set list listchars=tab:-·,trail:·

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Highlight current line
au WinLeave * set nocursorline
au WinEnter * set cursorline
set cursorline

if has("gui_running")
    set guioptions-=m
    set guioptions-=T
    set guioptions-=L
    set guioptions-=r
    set guioptions-=b
    set showtabline=0
endif

if has('mouse')
  set mouse=a
endif

if &t_Co > 2 || has("gui_running")
syntax on
endif