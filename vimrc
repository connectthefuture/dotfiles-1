"
" Pathogen and plugins
"
execute pathogen#infect()
" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"
" Colors
"
colorscheme solarized 
syntax enable
set background=dark
let g:airline_theme = 'solarized'
"
" Tabs
"
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set smarttab            " be smart when using tab
set autoindent          " autoindent
set modelines=1
"
" UI
"
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype plugin on
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set ruler               " show current position
set textwidth=80        " make it obvious where 80 characters is
set colorcolumn=+1
set cmdheight=1         " height of the command bar
set noerrorbells        " 
set novisualbell        "
set laststatus=2        " always show status line
"
" Search
"
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " ignore case when searching
set smartcase           " be smart about case when searching
set magic               " for regexp turn magic on
"
" Folding
"
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level
"
" Movement
"
" move vertically by visual line
nnoremap j gj
nnoremap k gk
"
" Leader
"
let mapleader=","       " leader is comma
"
" Backup
" 
set nobackup
set nowb
set noswapfile
"
" Shortcuts
"
"Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END
"
" Misc
"
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%
