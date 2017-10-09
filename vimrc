" Plugins {{{

" Initialization {{{

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vader.vim'
Plug 'majutsushi/tagbar'
Plug 'pardom/vim-gradle'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'shougo/vimproc.vim'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'udalov/kotlin-vim'
Plug 'valloric/youcompleteme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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

" CtrlP {{{
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" }}}
 
" Dart {{{
autocmd BufWrite *.dart silent :DartFmt
" }}}

" Goyo {{{
let g:goyo_width=120
" }}}

" Kotlin {{{
autocmd BufWritePost *.kt silent !kotlin-format -w %
" }}}

" NERDTree {{{
" Open NERDTree automatically when vim starts up on opening a directory.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0])&& !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Open a NERDTree automatically when vim starts up if no files were specified.
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Size
let g:NERDTreeWinSize=50
" Hidden files
let g:NERDTreeShowHidden=1
" }}}

" YouCompleteMe {{{
let g:ycm_semantic_triggers = {'haskell' : ['.']}
" }}}

" }}}

" Appearance {{{

syntax on
set colorcolumn=100
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

