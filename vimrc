"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'vim-syntastic/syntastic'
    Plug 'sheerun/vim-polyglot'
call plug#end()

set history=1500

" Enable filetype plugins
filetype plugin on
filetype indent on

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_go_checkers = ['go', 'gofmt']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=15

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set number


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

syntax enable
colorscheme solarized
let g:solarized_termcolors=256
set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Add color bar at 80 caracters
set colorcolumn=120

" Show end of line
set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
map <leader>vimrc :tabe ~/.vim/.vimrc<cr>
autocmd bufwritepost .vimrc source $MYVIMRC

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
map <leader>n :NERDTreeToggle<CR>

autocmd FileType php set expandtab shiftwidth=2 tabstop=2 omnifunc=phpcomplete#CompletePHP
autocmd FileType go set noexpandtab shiftwidth=4 tabstop=4
autocmd FileType javascript set shiftwidth=2 tabstop=2
autocmd FileType rb set shiftwidth=2 tabstop=2
autocmd FileType ruby set shiftwidth=2 tabstop=2
autocmd FileType yml set shiftwidth=2 tabstop=2
autocmd FileType yaml set shiftwidth=2 tabstop=2
autocmd FileType coffee set shiftwidth=2 tabstop=2
autocmd FileType rst set shiftwidth=2 tabstop=2
autocmd FileType nit set shiftwidth=4 tabstop=4 noexpandtab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

set rtp+=/home/jpcaissy/src/fzf/bin/fzf
map <C-P> :FZF <Enter>


