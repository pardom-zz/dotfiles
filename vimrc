" Plugins {{{

" Initialization {{{

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vader.vim'
Plug 'majutsushi/tagbar'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'shougo/vimproc.vim'
Plug 'tfnico/vim-gradle'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'udalov/kotlin-vim'
Plug 'valloric/youcompleteme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/mru.vim'
Plug 'w0rp/ale'

call plug#end()

" }}}

" ALE {{{
let g:airline#extensions#ale#enabled = 1
" }}}

" Base16 {{{
if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif
" }}}

" Dart {{{
autocmd BufWrite *.dart silent :DartFmt
" }}}

" Goyo {{{
let g:goyo_width=120
" }}}

" NERDTree {{{
" Open NERDTree automatically when vim starts up on opening a directory.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0])&& !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}

" YouCompleteMe {{{
let g:ycm_semantic_triggers = {'haskell' : ['.']}
" }}}

" }}}

" Appearance {{{

syntax on
set colorcolumn=120
set number
set ruler

" }}}

" Behavior {{{

" Backups {{{
set nobackup
set nowb
set noswapfile
" }}}

" }}}

" Key Mappings {{{
let mapleader=','

noremap <leader>w :w<CR>
noremap <leader>q :q<CR>
noremap <leader>ia gg=G
noremap <leader>df :Goyo<CR>
noremap <space> za

map <C-n> :NERDTreeToggle<CR>
map <leader>r :MRU getcwd()<CR>
" nmap J :m +1<CR>
" nmap K :m -2<CR>
" }}}

" Indentation {{{

set autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=4

set expandtab
set si
set wrap
set lbr
set tw=120

filetype indent on

" }}}

" Folding {{{

set foldmethod=indent
set foldnestmax=10
set foldlevelstart=10

" }}}

" vim:foldmethod=marker:foldlevel=0

