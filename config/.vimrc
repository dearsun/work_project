"thisismysetting
""
syntax on
syntax enable
filetype off
set ruler
set number
set nocompatible
set autochdir
set cindent
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set completeopt=longest,menu
set cinoptions+=:0,g0
set guifont=courier_new:h15
set incsearch
set hlsearch
set cursorline
"setvbt_vb=
""

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,latin1
set termencoding=utf-8
set encoding=utf-8
set t_Co=256
colorscheme desert

"启用vim-plug
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'fholgado/minibufexpl.vim'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'Yggdroot/LeaderF'
Plug 'majutsushi/Tagbar'
Plug 'Shougo/echodoc.vim'
"Plug 'fatih/vim-go', {'for': 'go'}
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'vim-scripts/matchit.zip'
Plug 'rust-lang/rust.vim'
"Plug 'vim-airline/vim-airline'

call plug#end()

syntax on
filetype plugin indent on

" 常用的命令
" :PluginList       - 列出所有已配置的插件
" :PluginInstall       - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!`


"Nerdtree
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '>'

"go highlight
let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_variable_declarations = 1

"YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
"let g:ycm_language_server =
"            \ [
"            \   {
"            \     'name': 'gopls',
"            \     'cmdline': [ '~/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/go/src/golang.org/x/tools/cmd/gopls/gopls' , "-rpc.trace" ],
"            \     'filetypes': [ 'go' ],
"            \     "project_root_files": [ "go.mod" ]
"            \   }
"            \ ]

"tags
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+ialS --extra=+q .<CR>
function Do_tag()
    execute "!ctags -R --c++-kinds=+p --fields=+ialS --extras=+q ."
endf


"global seting
function Do_gtags()
    set cscopetag
    set cscopeprg=gtags-cscope
    set noautochdir
endf

function Do_cscope()
    set csprg=cscope
    set cscopequickfix=s-,c-,d-,i-,t-,e- "add result to quickfix window
    set csto=1                           "first find cscope, if no find then to find tags file
    set cst                              "can first tag file
    set nocsverb
    set csverb
endf

function Do_cs_file()
    if (has("cscope") && executable('cscope'))
        silent! execute "!find $PWD -name '*.c' -o -name '*.cpp' -o -name '*.h' -o -name '*.asm' -o -name '*.c++' -o -name '*.cc' > cscope.files"
    endif
endf

function Do_cs_tag()
    if (has("cscope") && executable('cscope'))
        silent! execute "!cscope-bkq"
    endif
endf

