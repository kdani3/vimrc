set nocompatible
filetype off 


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Set up plugins here
Plugin 'gmarik/Vundle.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'junegunn/seoul256.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'ivalkeen/vim-ctrlp-tjump'
Plugin 'kchmck/vim-coffee-script'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nvie/vim-flake8'
Plugin 'https://github.com/Valloric/YouCompleteMe.git'
Plugin 'scrooloose/syntastic'
Plugin 'mattn/emmet-vim'
Plugin 'MarcWeber/vim-addon-mw-utils' " Needed by snipmate
Plugin 'tomtom/tlib_vim' " Needed by snipmate
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/AutumnLeaf'
Plugin 'gregsexton/Gravity'

call vundle#end()
filetype plugin indent on


" Custom settings for EasyMotion
let g:EasyMotion_leader_key = '<leader>'


" More convinient way to use system clipboard
if has('clipboard')
    if has('unnamedplus') " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif


" Line numbering
set nu
set relativenumber


" Look & Feel
colorscheme seoul256
set guifont=Inconsolata-g\ for\ Powerline\ Medium\ 12
set linespace=2
set colorcolumn=80
highlight ColorColumn guibg=Gray14
set cursorline
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
syntax on


" Settings for search
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase " Case insensitive search
set smartcase " Case sensitive when uc present


" Ack settings
map <C-F> :Ack 
" Use ag instead of ack
let g:ackprg = 'ag --nogroup --nocolor --column'


" NERDTree settings
map <C-K><C-B> :NERDTreeToggle<CR>


" CtrlP settings
map <C-R> :CtrlPBufTagAll<Return>
let g:ctrlp_extensions = ['tag', 'buffertag']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(env|git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc|swp)$',
  \ }
" Use ag to speed up CtrlP
" Use .agignore (with .gitignore syntax) to ignore files
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'


" Indentation settings
set autoindent " Indent at the same level of the previous line
set shiftwidth=4 " Use indents of 4 spaces
set expandtab " Tabs are spaces, not tabs
set tabstop=4 " An indentation every four columns
set softtabstop=4 " Let backspace delete indent
set nojoinspaces " Prevents inserting two spaces after punctuation on a join (J)


" History settings
set history=1000 " Longer edit history


" Spell checking
set spell " Enable spell checking
set spelllang=en,hu,pt


" save with Ctrl-S
map <C-S> :w<RETURN>


" move vertically by visual line
nnoremap j gj
nnoremap k gk


" Hide the mouse cursor while typing
set mousehide


" persistent undo
" http://stackoverflow.com/a/22676189
" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir
" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " No console pops up
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif


" Wildmenu settings
set wildmode=longest,list,full
set wildmenu


" SnipMate settings
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger
