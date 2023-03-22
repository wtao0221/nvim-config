"----------------------------------------------------------------------
" basic settings
"----------------------------------------------------------------------

let &t_TI = ""
let &t_TE = ""


set nocompatible

set bs=eol,start,indent

set autoindent

set cindent

set winaltkeys=no

set nowrap

" cursur location
" set ruler
set cursorline
" set cursorcolumn

" search
set ignorecase
set smartcase
set hlsearch
set incsearch


"----------------------------------------------------------------------
" coding
"----------------------------------------------------------------------
if has('multi_byte')
    set encoding=utf-8
    set fileencoding=utf-8
    set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
endif
"
"
""----------------------------------------------------------------------
""----------------------------------------------------------------------
if has('autocmd')
    filetype plugin indent on
endif
"
"
""----------------------------------------------------------------------
""----------------------------------------------------------------------
if has('syntax')  
    syntax enable 
    syntax on 
endif
"
"
"----------------------------------------------------------------------
set showmatch

set matchtime=2

set display=lastline

set wildmenu

set lazyredraw

set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m

set listchars=tab:\|\ ,trail:.,extends:>,precedes:<

set tags=./.tags;,.tags

set formatoptions+=m

set formatoptions+=B

set ffs=unix,dos,mac


""----------------------------------------------------------------------
""----------------------------------------------------------------------
if has('folding')
    set foldenable
    set fdm=indent
    set foldlevel=99
endif


"----------------------------------------------------------------------
"----------------------------------------------------------------------
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class

set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib " stuff to ignore when tab completing
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz    " MacOSX/Linux
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android


"-----------------------------------
"
"
set mouse=a

set selection=exclusive

set selectmode=mouse,key

