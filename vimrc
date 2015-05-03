" General
set nocompatible " Disable vi compatibility
set history=256 " Number of things to remember
set autowrite " Writes on make/shell commands
set autoread
"set timeoutlen=250 " Time to wait after ESC (default causes an annoying delay)
set clipboard+=unnamed " Yanks go on clipboard instead
set pastetoggle=<F5> " Toggle between paste and normal: for 'safer' pasting from keyboard
set tags=./tags;$HOME " Walk directory tree up to $HOME looking for tags

set guifont=Source\ Code\ Pro:h18
set t_Co=256

set wildignore=*.swp,*.back
set noswapfile

" File encoding
set encoding=utf-8
set fileencoding=utf-8

" Swich windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Modeline
set modeline
set modelines=5 " Default numbers of lines to read for modeline instructions

" Backup
set nowritebackup
set nobackup
set directory=/tmp// " Prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)

" Buffers
set hidden " The current buffer can be put to the background without writing to disk

" Match and search
set hlsearch " Highlight search
set ignorecase " Do case-insensitive matching
set smartcase " Be sensitive when there's a capital letter
set incsearch
nmap <silent> ,/ :nohlsearch<CR>

" formatting
set fo+=o " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r " Don not automatically insert a comment leader after an enter
set fo-=t " Do not auto-wrap text using textwidth (does not apply to comments)

set nowrap
set textwidth=0 " Don't wrap lines by default
set wildmode=longest,list " At comment line, complete longest common string, then list alternatives.

set backspace=indent,eol,start " more powerful backspacing

set tabstop=2
set softtabstop=2
set shiftwidth=2 " Set the default shift width for indents
set expandtab " Make tabs into spaces (set by tabstop)
set smarttab " Smarter tab levels

set autoindent
set smartindent
set copyindent
set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case

" Paste mode
nnoremap <F12> :set invpaste paste?<CR>
set pastetoggle=<F12>

" Misc.
let mapleader = ","
map <F1> :wqall<CR>
noremap ; <S-:>


" Visual
set number
set showmatch " Show matching brackets
set matchtime=5 " Bracket blinking
"set novisualbell " No blinking
"set noerrorbells " No noise
set laststatus=2 "Always show status line
set ruler " Show ruler
set showcmd " Display an incomplete command in the lower right corner of the Vim window
set shortmess=atI " Shortens messages

set list
set lcs=tab:>-,trail:-
set showmode
set title


set foldenable " Turn on folding
set foldmethod=indent
set foldlevel=4
set foldopen=block,hor,mark,percent,quickfix,tag

set mouse=a " enable mouse
set mousehide " Hide mouse after chars typed

set splitbelow
set splitright

" Commands and Auto commands

" Sudo write
comm! W exec 'w !sudo tee % > /dev/null' | e!

" Auto commands
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru}     set ft=ruby
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         set ft=markdown
au BufRead,BufNewFile {COMMIT_EDITMSG}                                set ft=gitcommit

" Tabs
map <silent> tp :tabprev<CR>
map <silent> tn :tabnext<CR>
map <silent> tq :tabclose<CR>

map <silent> <F12> :set invlist<CR>

" be iMproved, required
set nocompatible
" required
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Trying this
Plugin 'tpope/vim-surround'
Plugin 'file-line'
Plugin 'thinca/vim-quickrun'
Plugin 'thinca/vim-poslist'
Plugin 'mattn/gist-vim'

" Programming
Plugin 'jQuery'
Plugin 'tpope/vim-rails'

" Snippets
" Plugin 'gmarik/snipmate.vim'
" Plugin 'ervandew/snipmate.vim'

" Syntax highlight
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-markdown'
Plugin 'slim-template/vim-slim'

" Git integration
Plugin 'git.zip'
Plugin 'tpope/vim-fugitive'

Plugin 'majutsushi/tagbar'
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'

if has('gui_running')
  set background=light
  colorscheme ir_black
  "colorscheme desert
else
  "colorscheme default
  colorscheme zenburn
  "colorscheme ir_black
  "colorscheme desert
end

" The silver searcher
Plugin 'rking/ag.vim'
let g:ackprg = 'ag --nogroup --nocolor --column --ignore=db --ignore=log --ignore=tmp --ignore=test'

Plugin 'kien/ctrlp.vim'
let g:ctrlp_match_window_reversed = 0

" Nerd tree
Plugin 'scrooloose/nerdtree'
map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTreeMirror<CR>

" quickly comment your code, try ,cc on selected line
Plugin 'scrooloose/nerdcommenter'

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

Plugin 'bitc/vim-bad-whitespace'
map <Leader>d :EraseBadWhitespace<CR>

Plugin 'ervandew/supertab'
let g:SuperTabNoCompleteAfter=['^', ' ', '\t', ',', '\s']

Plugin 'othree/xml.vim'

syntax on

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

inoremap <c-/> <c-x><c-p>
