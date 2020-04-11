" VIM Configuration File
" Description: Optimized for C/C++ development, but useful also for other things.
" Author: Gerhard Gappmeier
"
set termguicolors " enables high colors quality

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set softtabstop=8
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120
" turn syntax highlighting on
set t_Co=256
syntax on
" colorscheme wombat256
" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

set clipboard=unnamedplus "to copu text into external files

set mouse=a

set foldmethod=syntax "Folding

set autochdir 
set background=dark    " Setting dark mode

map <space> za  "Open and close folds
set cursorline
set relativenumber

let g:gruvbox_guisp_fallback = "bg"
colorscheme gruvbox " setting the color shceme



set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/taglist.vim'
Plugin 'wesleyche/Trinity'
Plugin 'ctrlpvim/ctrlp.vim'


call vundle#end()
filetype plugin indent on
" Vundle brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


let g:airline_powerline_fonts = 1 " the arrows for the airline 


" Enhanced keyboard mappings

nmap <F8> :TlistToggle<CR> "Opend the tagbar menue


" in normal mode F2 will save the file
nmap <F2> :w<CR>

" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i

nmap <F3> :setlocal spell spelllang=en<CR>
imap <F3> <ESC>:setlocal spell spelllang=en<CR>i
nmap <S-F3> :setlocal nospell<CR>
imap <S-F3>  <ESC>:setlocal nospell<CR>i

" switch between header/source with F4
"map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" recreate tags file with F5
"map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
" create doxygen comment
"map <F6> :Dox<CR>
" build using makeprg with <F7>
"map <F7> :make<CR>
" build using makeprg with <S-F7>
"map <S-F7> :make clean all<CR>
" goto definition with F12
"map <F12> <C-]>
" in diff mode we use the spell check keys for merging
"if &diff
 "  ” diff settings
 " map <M-Down> ]c
  "map <M-Up> [c
  "map <M-Left> do
  "map <M-Right> dp
  "map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
"else
  " spell settings
 " :setlocal spell spelllang=en
  " set the spellfile - folders must exist
 " set spellfile=~/.vim/spellfile.add
 " map <M-Down> ]s
 " map <M-Up> [s
":wuu"endif
