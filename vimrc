" Use Vim settings, rather then Vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ Pathogen =========================
filetype off
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

"$ ls bundle/
"ack         command-t   fugitive    git         makegreen   nerdtree    pep8        py.test     pydoc       ropevim     snipmate    supertab    surround    tasklist

" ================ General Config ===================

syntax on                       " syntax highlighing
filetype on                     " try to detect filetypes
filetype indent on              " enable loading indent file for filetype
filetype plugin on              " and plugin
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set visualbell                  " No sounds
set grepprg=ack-grep            " replace the default grep program with ack
set nostartofline               " Avoid moving cursor to BOL when jumping around
set virtualedit=block           " Let cursor move past the last char in <C-v> mode
set backspace=2                 " Allow backspacing over autoindent, EOL, and BOL
set showmatch                   " Briefly jump to a paren once it's balanced
set matchtime=2                 " (for only .2 seconds).
set shiftround                  " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>             " show matching <> (html mainly) as well

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Auto change the directory to the current file I'm working on
"autocmd BufEnter * lcd %:p:h

"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

" ================ Search Settings  =================

set incsearch               " Find the next match as we type the search
set hlsearch                " Hilight searches by default
set viminfo='100,f1         " Save up to 100 marks, enable capital marks
set viminfo+=<50,s10,h      " Save 50 lines of registers, up to 10k
set viminfo+=h              " Turn hlsearch off when loading viminfo
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Remember File Position ===========
" 
" function! ResCur()
"     if line("'\"") <= line("$")
"         normal! g`"
"         return 1
"     endif
" endfunction
" 
" augroup resCur
"     autocmd!
"     autocmd BufWinEnter * call ResCur()
" augroup END

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

"silent !mkdir ~/.vim/backups > /dev/null 2>&1
"set undodir=~/.vim/backups
"set undofile

" ================ Indentation ======================

"set smartindent
set smarttab
set autoindent              " always set autoindenting on
set tabstop=4               " <tab> inserts 4 spaces 
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set nowrap                  " Don't wrap lines
set linebreak               " Wrap lines at convenient points

" ================ Folds ============================

" Then you will be able to be inside a method and type 'za' to open and close a fold.
set foldmethod=indent   " fold based on indent
set foldnestmax=3       " deepest fold is 3 levels
set nofoldenable        " dont fold by default

" ================ Completion =======================

set wildmode=list:longest,full
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.git
set wildignore+=*.pyc

" ================ Scrolling ========================

set scrolloff=8                  " Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Display ==========================

" show a line at column 79
if exists("&colorcolumn")
   set colorcolumn=79
endif

"set cursorline                 " have a line indicate the cursor location
set ruler                       " show the cursor position all the time
"set number                     " Display line numbers
set numberwidth=1               " using only 1 column (and 1 space) while possible
set background=dark             " We are using dark background in vim
set title                       " show title in console title bar
set showmode                    " Show current mode down the bottom
set gcr=a:blinkon0              " Disable cursor blink

"""" Messages, Info, Status
set ls=2                    " allways show status line
set noshowmode              " Don't show mode indicator because vim-airline
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete cmds down the bottom
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.
"set statusline=%<%f\ (%{&ft})%=%-19(%3l,%02c%03V%)%{fugitive#statusline()}
set statusline=%<%f\ (%{&ft})%=%-19(%3l,%02c%03V%)

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
"set list

"colorscheme anotherdark
"colorscheme solarized

syntax enable
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
colorscheme solarized

" ================ Load plugin settings =============

for f in split(glob('~/.vim/plugins/*.vim'), '\n')
  exe 'source' f
endfor

" ============ Plugin Shortcuts=====

" Ack searching 
nmap <leader>a <Esc>:Ack! 

" ============ Buffers =============
" 
" The most important part about navigating code within vim, is to completely
" understand how to use buffers. There is no reason to use tabs. Open files
" with :e <filename> to place in a buffer. We already installed the
" minibufexpl plugin, so you will already visually see every buffer opened.
" You can also get a list of them doing :buffers.
" 
" You can switch between the buffers using b<number>, such as :b1 for the
" first buffer. You can also use its name to match, so you can type :b
" mod<tab> to autocomplete opening the models.py buffer. You need to make sure
" you are using the minibufexpl from my github since it has patches that make
" it much better to work with.
" 
" To close a buffer you use :bd or :bw.

" ================ File Types =======================
" Python
" ======

"au BufRead *.py compiler nose
au FileType python set omnifunc=pythoncomplete#Complete
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" Don't let pyflakes use the quickfix window
let g:pyflakes_use_quickfix = 0

" Run pep8
let g:pep8_map='<leader>8'

" turn off hlsearch and update pyflakes on enter
au BufRead,BufNewFile *.py nnoremap <buffer><CR> :nohlsearch\|:call PressedEnter()<cr>
nnoremap <buffer><CR> :nohlsearch\|:call PressedEnter()<cr>

" clear the search buffer when hitting return and update pyflakes checks
function! PressedEnter()
    :nohlsearch
    if &filetype == 'python'
        :PyflakesUpdate
    end
endfunction

"au FileType python set omnifunc=pythoncomplete#Complete

" JSON
" ====

au! BufRead,BufNewFile *.json set filetype=json 

augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

" Javascript
" ==========

au BufRead *.js set makeprg=jslint\ %

" ================ Completion =======================
""" Insert completion
" don't select first item, follow typing in autocomplete
"set completeopt=menuone,longest,preview
"set pumheight=6             " Keep a small completion window
" close preview window automatically when we move around
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" Try different completion methods depending on its context
"let g:SuperTabDefaultCompletionType = "context"
"
" Add the virtualenv's site-packages to vim path
"py << EOF
"import os.path
"import sys
"import vim
"if 'VIRTUALENV' in os.environ:
"    project_base_dir = os.environ['VIRTUAL_ENV']
"    sys.path.insert(0, project_base_dir)
"    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"    execfile(activate_this, dict(__file__=activate_this))
"EOF
" Load up virtualenv's vimrc if it exists
"if filereadable($VIRTUAL_ENV . '/.vimrc')
"    source $VIRTUAL_ENV/.vimrc
"endif

