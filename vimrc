 " Plugins {{{
" Pathogen {{{

execute pathogen#infect()

"  }}}
"  Airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set timeoutlen=50

" }}}

" }}}
" Fonts and colors {{{

set t_Co=256 
colorscheme PaperColor 
syntax enable
set background=dark
let g:airline_theme = 'PaperColor'

" Encoding
set encoding=utf8
set fileencoding=utf-8
set fileencodings=utf-8

" }}}
" Tabs {{{

set tabstop=4           " number of visual spaces per TAB
set shiftwidth=4        " number of spaces used for each step of (auto)indent
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set smarttab            " be smart when using tab
set autoindent          " autoindent
set modelines=1         " enable using settings from modelines when reading a file

" }}}
 " UI {{{

set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype plugin on
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
" set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set ruler               " show current position
set cmdheight=1         " height of the command bar
set noerrorbells         
set novisualbell        
set laststatus=2        " always show status line
set nostartofline       " stop certain movements from always going to the first character of a line.
set noshowmode          " Don't show the current mode (airline.vim takes care of us)
set hid                 " buffer becomes hidden when it is abandoned
set so=7                " set 7 lines to the cursor - when moving vertically
set title               " set terminal title to filename
set history=50          " keep 50 commands and 50 search patterns in the history.
set ttyfast             " terminal connection is fast

" }}}
" Search {{{
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " ignore case when 
set smartcase           " be smart about case when searching
set magic               " for regexp turn magic on
" }}}
" Folding {{{

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level

" }}}
" Movement {{{

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" }}}
" Leader {{{
"
let mapleader=","       " leader is comma
" }}}
" Backup {{{
 
set nobackup
set nowb
set noswapfile

" }}}
" Shortcuts {{{

"Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" Ctrp+n to toggle NerdTree
map <C-n> :NERDTreeToggle<CR>

" }}}
" Config groups {{{

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
	autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>StripTrailingWhitespaces()
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

 " }}}
" Misc {{{

" Reload .vimrc after saving
autocmd bufwritepost .vimrc source $MYVIMRC

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%
" }}}
" Functions {{{

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

function! <SID>CleanFile()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %!git stripspace
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

"}}}
" vim:foldmethod=marker:foldlevel=0
