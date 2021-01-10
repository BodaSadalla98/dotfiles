" VIM Configuration File
"
"
filetype on
filetype indent on
set shell=/bin/zsh
let $CXXFLAGS='-std=c++20 -O2  -g -Werror -Wall'

" ====================== Set LEader Key ========================================
let mapleader=" "
set termguicolors " enables high colors quality

" ================ Indentation ======================

set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab
"===============================================================================
set nofoldenable " Disable files auto indent

" =================================== Encoding =================================
set enc=utf-8
set encoding=utf-8
set fenc=utf-8
set termencoding=utf-8

"===============================================================================
"
"
set nocompatible " disable vi compatibility (emulation of old bugs)
set scrolloff=7


set fileformat=unix
set list        "shows tabs and spaces
set t_Co=256
syntax on
let python_highlight_all=1
set number
set showmatch " highlight matching braces


set comments=sl:/*,mb:\ *,elx:\ */   " intelligent comments

set clipboard=unnamedplus "to copu text into external files
set showtabline=2
set mouse=a
set ruler
set foldmethod=syntax "Folding

set autochdir
set background=dark    " Setting dark mode

set cursorline
set relativenumber
set splitbelow
set splitright
autocmd BufWritePre * %s/\s\+$//e " spot EOL whitespaces

" ==============================================================================

" ================ File management =============================================

" Turn off swap files
set noswapfile
set nobackup
set nowb

" TODO: improve behaviour
" reload files changed outside vim
set autoread
" Triger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
autocmd FileChangedShellPost *
            \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None


" ==============================================================================






" =====================================  Start of Vundle =======================
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
Plugin 'kevinhwang91/rnvimr', {'do': 'make sync'}
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Chiel92/vim-autoformat'
Plugin 'xuhdev/SingleCompile'
Plugin 'dracula/vim', { 'as': 'dracula' }
Plugin 'tpope/vim-dispatch'
Plugin 'puremourning/vimspector'
call vundle#end()
filetype plugin indent on
" ==============================================================================
"========================== Gruvbox ============================================
"let g:gruvbox_guisp_fallback = "bg"
colorscheme gruvbox " setting the color shceme
let g:gruvbox_contrast_dark = 'hard'
" ==============================================================================
"========================== YCM ================================================
let g:ycm_clangd_binary_path = "/usr/bin/clangd-10"  "add path to clang binary
let g:ycm_clangd_uses_ycmd_caching = 0  " Let clangd fully control code completion
let g:ycm_autoclose_preview_window_after_completion=1 " make sure YCM  window  disappear  after slection
nnoremap <leader>g  :YcmCompleter GoToDefinition<CR>
"ElseDeclaration<CR>   leader + g got to definition"
let g:pymode_python = 'python3'
"let g:ycm_global_ycm_extra_conf = '.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" ==============================================================================
"
"
" ========================= NerdTree ===========================================
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1


" ==============================================================================
"
"
" ========================= Syntastic ==========================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" ==============================================================================


" ========================= Ranger ==========================================
" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1
nmap <M-r> :RnvimrToggle<CR>

" ==============================================================================


" ========================= Vimspector ==========================================

let g:vimspector_enable_mappings = 'HUMAN'
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dx :VimspectorReset<CR>
nnoremap <leader>de :VimspectorEval
nnoremap <leader>do :VimspectorShowOutput






" ==============================================================================

" ========================= Airline ==========================================

let g:airline_powerline_fonts = 1 " the arrows for the airline
let g:airline#extensions#tabline#enabled = 1

" ==============================================================================

" ================ Keyboard bindings ===========================================
nmap <M-h> <C-w>h
nmap <M-j> <C-w>j
nmap <M-k> <C-w>k
nmap <M-l> <C-w>l
nmap <Leader>v :vs<CR>
nmap  <Leader>h :sp<CR>

" ================ Folds =======================================================

" clipboard
" copy
noremap <C-c> "+y
" paste
noremap <C-v> "+p
" cut
noremap <C-x> "+d
" paste in insert mode
inoremap <C-v> <Esc>"+pa

" ==============================================================================
"
"
" ================ Resize window ===============================================
nnoremap <M-DOWN>    :resize -2<CR>
nnoremap <M-UP>    :resize +2<CR>
nnoremap <M-RIGHT>    :vertical resize -2<CR>
nnoremap <M-LEFT>    :vertical resize +2<CR>

" ==============================================================================
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>
nmap <M-j> <C-w>j


"Open and close folds
nmap ff za
" Toggle tagbar
nmap <F8> :TlistToggle<CR> "Opend the tagbar menue

"Switches to header/source file
nmap <F7> :A<CR>

nmap qq :q<CR>
nmap qqq :q!<CR>
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i


function! ToggleSpellChecking() "Function to toggle the spell Checking

    if &spell==0
        :setlocal spell spelllang=en
    else
        :setlocal  nospell
    endif

endfunction

nmap <F3> :call ToggleSpellChecking()<CR>
imap<F3> <ESC>:call ToggleSpellChecking()<CR>i

nnoremap <silent> <expr> <F4> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
"nmap  <silent> <F4> :NERDTreeToggle<CR> "Toggle NERDTree
imap  <F4> <ESC> :NERDTreeToggle <CR>

nnoremap <silent> <F5> :w <bar> :make %<<CR>
nnoremap <F6> :terminal ./%<CR>

" Copies the Current buffer
nmap <leader>y ggVG"+y''

autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format


augroup c
    autocmd!
    autocmd FileType c,cpp,h,hpp,glsl call MakeRun()
augroup end

function! MakeRun()
    nnoremap <F5> :terminal  make %< && ./%< <cr>
    inoremap <F5> <esc> :terminal  make %< && ./%< <cr>

endfunction
" Toggle search highlight
nnoremap <F1> :set hlsearch!<CR>

"autocmd filetype cpp nnoremap <F6> :w <bar>   :te g++ -ulimit -Wall -Wno-unused-result -std=c++11   -O2   % -o %:r && ./%:r <CR>


autocmd filetype python nnoremap <F5> :terminal  python3 %<cr>
autocmd filetype python inoremap <F5> <esc> :terminal python3 % <cr>
au BufWrite * :Autoformat


"autocmd FileType cpp set makeprg=g++\ \-Wall\ -Werror\ -std=c++20\ %\ -g\ -o\ %:r

"autocmd filetype cpp nnoremap <F7> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

"nmap <F6> :SCCompile<cr>
"nmap <F7> :SCCompileRun<cr>
