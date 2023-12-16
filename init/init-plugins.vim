if !exists('g:plugin_group')
    let g:plugin_group = ['basic', 'textobj', 'filetypes']
    let g:plugin_group += ['airline', 'nerdtree', 'ale', 'tags', 'echodoc', 'copilot']
endif

let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

function! s:path(path)
    let path = expand(s:home . '/' . a:path )
    return substitute(path, '\\', '/', 'g')
endfunc

" Plugins installed to ~/.config/nvim/plugged
call plug#begin("~/.config/nvim/plugged")


if index(g:plugin_group, 'basic') >= 0
    " Plug 'vim-scripts/AutoComplPop'
    Plug 'flazz/vim-colorschemes'
    Plug 'mileszs/ack.vim'
endif

if index(g:plugin_group, 'copilot') >= 0
    Plug 'github/copilot.vim'

    let g:copilot_filetypes = {
                \ '*': v:false,
                \ 'c': v:true,
                \ 'cpp': v:true,
                \ 'c++': v:true,
                \ 'python': v:true,
                \ 'go': v:true,
                \ 'verilog': v:true,
                \ 'vhdl': v:true,
                \ }

    let g:copilot_no_tab_map = v:true
endif

if index(g:plugin_group, 'textobj') >= 0

    Plug 'kana/vim-textobj-user'

    Plug 'kana/vim-textobj-indent'

    Plug 'kana/vim-textobj-syntax'

    Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }

    Plug 'sgur/vim-textobj-parameter'

    Plug 'bps/vim-textobj-python', {'for': 'python'}

    Plug 'jceb/vim-textobj-uri'
endif

if index(g:plugin_group, 'filetypes') >= 0

    Plug 'pprovost/vim-ps1', { 'for': 'ps1' }

    Plug 'tbastos/vim-lua', { 'for': 'lua' }

    Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }

    Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'bison', 'flex', 'cpp'] }

    Plug 'vim-python/python-syntax', { 'for': ['python'] }

    Plug 'rust-lang/rust.vim', { 'for': 'rust' }

    Plug 'jceb/vim-orgmode', { 'for': 'org' }
endif

"----------------------------------------------------------------------
" echodoc
"----------------------------------------------------------------------
if index(g:plugin_group, 'echodoc') >= 0
    Plug 'Shougo/echodoc.vim'
    set noshowmode
    let g:echodoc#enable_at_startup = 1
endif

"----------------------------------------------------------------------
" tags
" https://zhuanlan.zhihu.com/p/36279445
"----------------------------------------------------------------------
if index(g:plugin_group, 'tags') >= 0

    Plug 'ludovicchabant/vim-gutentags'

    " 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
    " 支持光标移动到符号名上：
    " <leader>cg 查看定义
    " <leader>cs 查看引用
    " <leader>cc 查看哪些函数调用
    " <leader>cf 查看光标下的文件
    " <leader>ci 查看include本文件的文件
    " Plug 'skywind3000/gutentags_plus'

    " let $GTAGSLABEL = 'native-pygments'
    " let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
    " project root files
    let g:gutentags_project_root = ['.root', '.project', '.svn', '.git', '.hg']
    let g:gutentags_ctags_tagfile = '.tags'

    " tag cached in ~/.cache/tags
    let s:vim_tags = expand('~/.cache/tags')
    let g:gutentags_cache_dir = s:vim_tags

    if !isdirectory(s:vim_tags)
        silent! call mkdir(s:vim_tags, 'p')
    endif

    let g:gutentags_modules = []

    if executable('ctags')
        let g:gutentags_modules += ['ctags']
    endif

    " if executable('gtags') && executable('gtags-cscope')
    "     let g:gutentags_modules += ['gtags_cscope']
    " endif

    " ctags settings
    let g:gutentags_ctags_extra_args = []
    let g:gutentags_ctags_extra_args += ['--fields=+niazS', '--extra=+q']
    let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
    let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

    let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

    let g:gutentags_auto_add_gtags_cscope = 0

    " DEBUG
    let g:gutentags_define_advanced_commands = 1
endif

"----------------------------------------------------------
" Airline
"----------------------------------------------------------
if index(g:plugin_group, 'airline') >= 0
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_powerline_fonts = 0
    let g:airline_exclude_preview = 1
    let g:airline_section_b = '%n'
    let g:airline_theme='solarized_flood'
    let g:airline#extensions#branch#enabled = 0
    let g:airline#extensions#syntastic#enabled = 0
    let g:airline#extensions#fugitiveline#enabled = 0
    let g:airline#extensions#csv#enabled = 0
    let g:airline#extensions#vimagit#enabled = 0
    let g:ariline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline#extensions#tabline#formatter = 'default'
endif

"----------------------------------------------------------
" NERDTree
"----------------------------------------------------------
if index(g:plugin_group, 'nerdtree') >= 0
    Plug 'scrooloose/nerdtree', {'on': ['NERDTree', 'NERDTreeFocus', 'NERDTreeToggle', 'NERDTreeCWD', 'NERDTreeFind'] }
    " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    let g:NERDTreeMinimalUI = 1
    let g:NERDTreeDirArrows = 1
    let g:NERDTreeHijackNetrw = 0
    noremap <space>nn :NERDTree<cr>
    noremap <space>no :NERDTreeFocus<cr>
    noremap <space>nm :NERDTreeMirror<cr>
    " noremap <c-f> :NERDTreeToggle<cr>
    noremap <c-f> :NERDTreeFind<cr>
endif


"----------------------------------------------------------
" ALE
"----------------------------------------------------------
if index(g:plugin_group, 'ale') >= 0
    Plug 'dense-analysis/ale'

    let g:ale_completion_delay = 500
    let g:ale_echo_delay = 20
    let g:ale_lint_delay = 500
    let g:ale_echo_msg_format = '[%linter%] %code: %%s'

    let g:ale_lint_on_text_changed = 'normal'
    let g:ale_lint_on_insert_leave = 1

    if has('win32') == 0 && has('win64') == 0 && has('win32unix') == 0
        let g:ale_command_wrapper = 'nice -n5'
    endif

    let g:airline#extensions#ale#enabled = 1

    let g:ale_linters = {
                \ 'c': ['gcc', 'cppcheck'], 
                \ 'cpp': ['gcc', 'cppcheck'], 
                \ 'python': ['flake8', 'pylint'], 
                \ 'lua': ['luac'], 
                \ 'go': ['go build', 'gofmt'],
                \ 'java': ['javac'],
                \ }
                "\ 'verilog': ['iverilog'],
                "\ 'systemverilog': ['iverilog'],


    function s:lintcfg(name)
        let conf = s:path('tools/conf/')
        let path1 = conf . a:name
        let path2 = expand('~/.config/nvim/linter/'. a:name)
        if filereadable(path2)
            return path2
        endif
        return shellescape(filereadable(path2)? path2 : path1)
    endfunc

    " flake8/pylint settings
    let g:ale_python_flake8_options = '--conf='.s:lintcfg('flake8.conf')
    let g:ale_python_pylint_options = '--rcfile='.s:lintcfg('pylint.conf')
    let g:ale_python_pylint_options .= ' --disable=W'
    let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
    let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
    let g:ale_c_cppcheck_options = ''
    let g:ale_cpp_cppcheck_options = ''

    let g:ale_linters.text = ['textlint', 'write-good', 'languagetool']

    if executable('gcc') == 0 && executable('clang')
        let g:ale_linters.c += ['clang']
        let g:ale_linters.cpp += ['clang']
    endif
endif

if index(g:plugin_group, 'lsp') >= 0
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'
endif


"----------------------------------------------------------
" YCM
"----------------------------------------------------------
" Vundle
"
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()

let g:ycm_add_preview_to_completeopt = 0

" disable diagnostics, use ALE instead
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_clangd_args=['--header-insertion=never']
let g:ycm_key_invoke_completion = '<c-g>'
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
set completeopt=menu,menuone,noselect


let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }


"----------------------------------------------------------------------
" Ycm whitelist
"----------------------------------------------------------------------
let g:ycm_filetype_whitelist = { 
            \ "c":1,
            \ "cpp":1, 
            \ "objc":1,
            \ "objcpp":1,
            \ "python":1,
            \ "java":1,
            \ "javascript":1,
            \ "coffee":1,
            \ "vim":1, 
            \ "go":1,
            \ "cs":1,
            \ "lua":1,
            \ "perl":1,
            \ "perl6":1,
            \ "php":1,
            \ "ruby":1,
            \ "rust":1,
            \ "erlang":1,
            \ "asm":1,
            \ "nasm":1,
            \ "masm":1,
            \ "tasm":1,
            \ "asm68k":1,
            \ "asmh8300":1,
            \ "asciidoc":1,
            \ "basic":1,
            \ "vb":1,
            \ "make":1,
            \ "cmake":1,
            \ "tcl":1,
            \ "html":1,
            \ "css":1,
            \ "less":1,
            \ "json":1,
            \ "cson":1,
            \ "typedscript":1,
            \ "haskell":1,
            \ "lhaskell":1,
            \ "lisp":1,
            \ "scheme":1,
            \ "sdl":1,
            \ "sh":1,
            \ "zsh":1,
            \ "bash":1,
            \ "man":1,
            \ "markdown":1,
            \ "matlab":1,
            \ "maxima":1,
            \ "dosini":1,
            \ "conf":1,
            \ "config":1,
            \ "zimbu":1,
            \ "ps1":1,
            \ }


call plug#end()
