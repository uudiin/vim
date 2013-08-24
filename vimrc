" An example for a vimrc file.
"
" Maintainer:   Bram Moolenaar <Bram@vim.org>
" Last change:  2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"         for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"       for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch       " do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent        " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif





" base configure
set autoread

let mapleader = ","
let g:mapleader = ","

nmap <leader>w :w!<cr>

set wildmenu
set wildignore=*.o,*.obj,*~,*.pyc

set whichwrap+=<,>,h,l

set smartcase

set lazyredraw

set magic

set showmatch

" English menu
"set langmenu=en_US
"let SLANG = 'en_US'

set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gbk,cp936,gb2312,gb18030,big5,euc-jp,euc-kr,latinl,chinese

set langmenu=zh_CN.UTF-8

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

let &termencoding = &encoding

set ffs=unix,dos,mac

if has("win32")
    set fileencoding=chinese
    set guifont=Consolas:h11:cANSI
else
    set fileencoding=utf-8
endif

language message zh_CN.UTF-8

set number

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

retab

set cindent

set linebreak
set textwidth=300

set autoindent
set smartindent

set bsdir=buffer
set autochdir
set cursorline
set ignorecase

set nobackup
set nowb
set noswapfile

set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ [line:\ %l/%L,\ row:\ %c][%p%%]

set tags=tags;

colorscheme molokai

syntax enable

if has("gui_running")
    set guioptions-=m  " hide menu
    set guioptions-=T   " hide toolbar
    set nowrap
else
    set wrap
endif


" configure for .vimrc
if has("win32")
    map <silent> <leader>ss :source $VIM/_vimrc<cr>
    map <silent> <leader>ee :edit $VIM/_vimrc<cr>
else
    map <silent> <leader>ss :source ~/.vimrc<cr>
    map <silent> <leader>ee :edit ~/.vimrc<cr>
endif
"autocmd! bufwritepost .vimrc source ~/.vimrc

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" configure for taglist
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Auto_Update = 1
let Tlist_Sort_Type = "name"

map <silent> <F9> :TlistToggle<cr>


" configure for netrw
let g:netrw_winsize = 30

nmap <silent> <leader>fe :Sexplore!<cr>


" configure for bufexplorer
let g:bufExplorerDefultHelp = 0
let g:bufExplorerShowRelativePath = 1
let g:bufExplorerSortBy = 'mru'       " most recently used
let g:bufExplorerSplitRight = 0
let g:bufExplorerSplitVertical = 1
let g:bufExplorerSplitVerSize = 30
let g:bufExplorerUseCurrentWindow = 1
autocmd BufWinEnter \[buf_list\] setl nonumber


" configure for winmanager
let g:winManagerWindowLayout = "FileExplorer|TagList"
let g:winManagerWidth = 25
let g:defaultExplorer = 0
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>
nmap <silent> <leader>wm :WMToggle<cr>


" configure for lookupfile
let g:LookupFile_MinPatLength = 2
let g:LookupFile_PreserveLastPattern = 0
let g:LookupFile_AlwaysAcceptFirst = 1
let g:LookupFile_AllowNewFiles = 0


" configure for minibufexp
let g:miniBufExplorerMoreThanOne = 1
let g:miniBufExplMapCTabSwitchBufs = 1


" configure for NERDTree
let NERDTreeIgnore=['\.\w*[^chp]$', '\..[^p]p$', '\.[^c]pp$']
let NERDTreeWinPos = 'right'
"let NERDTreeWinSize=g:winManagerWidth
let NERDTreeWinSize=20
"let NERDChrismasTree=1

map <silent> <F10> :NERDTreeToggle<cr>
imap <silent> <F10> <ESC>:NERDTreeToggle<cr>


" configure for SuperTab
let g:SuperTabRetainCompletionType = 2
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"



" configure for std_c
let c_syntax_for_h = 1


" configure for cscope
" :help cscope-suggestions
"if has("cscope")
"   set csto =1
"   set cst
"   set nocsverb
"   if filereadable("cscope.out")
"       cs add cscope.out
"   elseif $CSCOPE_DB != ""
"       cs add $CSCOPE_DB
"   endif
"   set csverb
"endif

nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>


function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" helper for qemu
map <silent> <leader>file :Cfile i386-softmmu/qemu-system-i386
map <silent> <leader>run :Crun /media/Virtual/qemu/hda.img -m 256 
map <silent> <leader>setps :Cset $ps&=~(1<<8) 
map <silent> <leader>hsig :Chandle SIGUSR1 noprint nostop

