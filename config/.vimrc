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
"set t_Co=256
"right color setting
set term=screen-256color
colorscheme desert

"启用vim-plug
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'https://gitee.com/mirrors/youcompleteme.git'
Plug 'preservim/nerdtree'
Plug 'fholgado/minibufexpl.vim'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'Yggdroot/LeaderF'
Plug 'Yggdroot/indentLine'
Plug 'majutsushi/Tagbar'
Plug 'Shougo/echodoc.vim'
"Plug 'fatih/vim-go', {'for': 'go'}
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'vim-scripts/matchit.zip'
Plug 'rust-lang/rust.vim'
Plug 'bmeneg/coc-perl', {'do': 'yarn install && yarn build'}
"Plug 'vim-airline/vim-airline'

call plug#end()

syntax on
filetype plugin indent on

" 常用的命令
" :PluginList       - 列出所有已配置的插件
" :PluginInstall       - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!`

"leaderf
"Leaderf gtags --update / --remove   #生存或者删除 GTAGS 等文件，存放目录在默认在 ~/.LfCache/gtags/_you_path_dir 下面
let g:Lf_PreviewInPopup = 1

noremap <leader>s :LeaderfSelf<cr>
noremap <leader>ff :LeaderfFunction<cr>

noremap <leader>gg :<C-U><C-R>=printf("Leaderf gtags -g %s", expand("<cword>"))<CR><CR>
noremap <leader>gr :<C-U><C-R>=printf("Leaderf gtags -r %s", expand("<cword>"))<CR><CR>
noremap <leader>gd :<C-U><C-R>=printf("Leaderf gtags -d %s", expand("<cword>"))<CR><CR>
noremap <leader>gc :<C-U><C-R>=printf("Leaderf gtags --by-context")<CR><CR>
noremap <leader>go :<C-U><C-R>=printf("Leaderf gtags --recall %s", "")<CR><CR>
noremap <leader>gn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>gp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
noremap <leader>gs :<C-U><C-R>=printf("Leaderf gtags --result ctags-mod")<CR><CR>

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
"let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/youcompleteme/third_party/ycmd/examples/.ycm_extra_conf.py'
"let g:ycm_language_server =
"            \ [
"            \   {
"            \     'name': 'gopls',
"            \     'cmdline': [ '~/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/go/src/golang.org/x/tools/cmd/gopls/gopls' , "-rpc.trace" ],
"            \     'filetypes': [ 'go' ],
"            \     "project_root_files": [ "go.mod" ]
"            \   }
"            \ ]
"let g:ycm_clangd_binary_path = '/home/pems/self/clang/bin'
"let g:ycm_server_keep_logfiles                = 1
"let g:ycm_server_log_level                    = 'debug'
"let g:ycm_cache_omnifunc                      = 1
"let g:ycm_collect_identifiers_from_tags_files = 1    " 开启 YCM 标签补全引擎
"let g:ycm_min_num_of_chars_for_completion     = 1    " 从第一个键入字符就开始罗列匹配项
"let g:ycm_seed_identifiers_with_syntax        = 1    " 语法关键字补全
"let g:ycm_goto_buffer_command                 = 'horizontal-split' " 跳转打开上下分屏
"let g:ycm_key_invoke_completion               = '<C-\>'
"let g:ycm_semantic_triggers                   = {
"                           \'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
"                           \'cs,lua,javascript,html,css': ['re!\w{2}']
"                           \}
"let g:syntastic_java_checkers = []
"map <F2> :YcmCompleter GoToDefinition<CR>
"map <F3> :YcmCompleter GoToDeclaration<CR>
"map <F4> :YcmCompleter GoToDefinitionElseDeclaration<CR>

"leaderf
"noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
"noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
"noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
"noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
"noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

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


"coc config
set shortmess+=c
set updatetime=300
set signcolumn=yes

" Tab，Shift+Tab切换自动补全生效
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"""inoremap <silent><expr> <TAB>
"""      \ pumvisible() ? "\<C-n>" :
"""      \ <SID>check_back_space() ? "\<TAB>" :
"""      \ coc#refresh()
"""inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"""function! s:check_back_space() abort
"""  let col = col('.') - 1
"""  return !col || getline('.')[col - 1]  =~# '\s'
"""endfunction

" 使用回车确认补全，而不是换行。
" 可以做到只打两个字符，按回车补全功能。
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 下一个报错，上一个报错
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" 查看函数定义，调用
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> ge <Plug>(coc-declaration)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"定义快捷键调用 Call Hierarchy
nmap <leader>ci :call CocAction('showIncomingCalls')<CR>
"nmap <leader>co :call CocAction('showOutgoingCalls')<CR>

" coc scroll control
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


" 显示文档
" Use Leader+h to show documentation in preview window.
" nnoremap <silent> <LEADER>h :call <SID>show_documentation()<CR>
" 
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction



" Use K to show documentation in preview window.
nnoremap <silent> <leader>h :call ShowDocumentation()<CR>

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('<leader>h', 'in')
    endif
endfunction

"coc perl
let g:coc_global_extensions = ['coc-perl']
let g:coc_perl_enable = 1
let g:coc_perl_filetypes = ['perl']
