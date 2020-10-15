" VIM Configuration File
" Description: Optimized for C/C++ development, but useful also for other things.
" Author: Gerhard Gappmeier

let mapleader=" "
set termguicolors " enables high colors quality

" set UTF-8 encoding
set enc=utf-8
set encoding=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 8 spaces
set shiftwidth=4     " indent also with 4 spaces
set softtabstop=4
set fileformat=unix
set list		"shows tabs and spaces
set colorcolumn=80 "set line at column 80
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120
" turn syntax highlighting on
set t_Co=256
syntax on
let python_highlight_all=1
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

set cursorline
set relativenumber
set splitbelow
set splitright



autocmd BufWritePre * %s/\s\+$//e " spot EOL whitespaces
let g:gruvbox_guisp_fallback = "bg"
colorscheme gruvbox " setting the color shceme

let g:ycm_clangd_binary_path = "/usr/bin/clangd-9"  "add path to clang binary
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'klen/python-mode'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/taglist.vim'
Plugin 'wesleyche/Trinity'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'a.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'preservim/nerdcommenter'
Plugin 'scrooloose/syntastic'
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

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Syntastic Plugin
set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
" End of Syntastic Plugin

" Begin  of  YCM plugin
let g:ycm_autoclose_preview_window_after_completion=1 " make sure YCM  window  disappear  after slection
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>  " leader + g got to definition

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF


" End of YCM Plugin

nmap <M-h> <C-w>h
nmap <M-j> <C-w>j
nmap <M-k> <C-w>k
nmap <M-l> <C-w>l
nmap <C-v> :vs<CR>
nmap  <C-h> :sp<CR>

"execute "set <M-j>=\ej"
nmap <M-j> <C-w>j
let g:airline_powerline_fonts = 1 " the arrows for the airline


" Enhanced keyboard mappings

 "Open and close folds
 nmap ff za

nmap <F8> :TlistToggle<CR> "Opend the tagbar menue

"Switches to header/source file
nmap <F7> :A<CR>

nmap qq :q<CR>
nmap qqq :q!<CR>
" in normal mode F2 will save the file
nmap <F2> :w<CR>


function! ToggleSpellChecking() "Function to toggle the spell Checking

	if &spell==0
	:setlocal spell spelllang=en
	else
	:setlocal  nospell
	endif

endfunction

nmap <F3> :call ToggleSpellChecking()<CR>
imap<F3> <ESC>:call ToggleSpellChecking()<CR>i
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i

nnoremap <silent> <expr> <F4> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
"nmap  <silent> <F4> :NERDTreeToggle<CR> "Toggle NERDTree
imap  <F4> <ESC> :NERDTreeToggle <CR>
