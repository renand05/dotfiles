set runtimepath+=~/.vim_runtime

" Set compatibility to Vim only.
set nocompatible

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Turn on syntax highlighting.
syntax on

" For plug-ins to load correctly.
filetype plugin indent on

"-----------------------------------Plugins-----------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align

"auto complete
Plug 'valloric/youcompleteme'

"Ack finder
Plug 'mileszs/ack.vim'

"javascript completion 
Plug 'ternjs/tern_for_vim', { 'do' : 'npm install' }

" Align
Plug 'junegunn/vim-easy-align'

"nerdtree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

"Bar style
Plug 'vim-airline/vim-airline'

"Differences between files 
Plug 'will133/vim-dirdiff'

"Fugitive Git
Plug 'https://github.com/tpope/vim-fugitive.git'

"Colors 
Plug 'morhetz/gruvbox'

"linter
Plug 'dense-analysis/ale'

"Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Ack finder
Plug 'mileszs/ack.vim'

"html autocomplete
Plug 'mattn/emmet-vim'

call plug#end()
""-------------------------------------Plugins End-----------------------------

" Hybrid line numbers on
set number relativenumber
set nu rnu

" No backup files
set nobackup
set noswapfile

" Show spaces as char
set listchars=space:·
set list

" Set Tabs
set tabstop=2 shiftwidth=2 expandtab

" Set space as leader 
nnoremap <Space> <NOP>
nmap <Space> <leader>

"-----------Plugin variables--------------------------------------------------

" Autocompletion
set omnifunc=youcompleteme#Complete

" FZF maps
nnoremap <silent> <leader><space> :GitFiles<CR>
nnoremap <silent> <Leader><space> :GFiles<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>a :Ag<CR>
nnoremap <silent> <Leader>w :Ag <C-r>=expand('<cword>')<CR><CR>
nnoremap <silent> <Leader>b :Buffers<CR>kk

" ale - linter
let g:ale_sign_column_always = 1
let g:ale_linters_explicit = 1
let g:ale_sign_error='✗'
let g:ale_sign_warning='⚠'
let g:ale_echo_msg_error_str = '✗'
let g:ale_echo_msg_warning_str = '⚠'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_python_flake8_args = '--ignore=E501'
let g:ale_linters = {'javascript': ['eslint'],'python': ['flake8'],'php': ['php'],'css': ['stylelint'],'sass': ['stylelint']}
let g:ale_fixers = {'javascript': ['prettier', 'prettier-standard'],'typescript': ['prettier', 'prettier-standard']}
let g:ale_fix_on_save = 1
nnoremap <silent> <Leader>] :ALEGoToDefinition<CR>
" set omnifunc=ale#completion#OmniFunc

"Nerdtree
nmap <C-n> :NERDTreeToggle <CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeChDirMode = 2
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen = 1
let g:NERDTreeShowIgnoredStatus = 1

"emmet html ninja
let g:user_emmet_leader_key=','

"--------end Plugin variables--------------------------------------------------

"---------------------------------------- Colors -----------------------------

colorscheme gruvbox
" Fix for gruvbox command line command error message
highlight ErrorMsg guifg=#fffff ctermfg=172

highlight Normal guibg=NONE ctermbg=NONE

" Comments
highlight Comment ctermfg=67
" highlight Comment ctermfg=137

" Show limit columns
set colorcolumn=80
" highlight ColorColumn ctermbg=232

" Highlight search
set hlsearch

".Highlight current line
set cursorline
highlight CursorLine   cterm=underline ctermbg=NONE ctermfg=NONE

" Highlight white space
highlight ExtraWhitespace ctermfg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" Weird hack
highlight default Whitespace ctermfg=lightgrey
highlight clear Whitespace

" Hightlight line numbers
highlight LineNr ctermbg=NONE ctermfg=15
highlight CursorLineNr ctermbg=NONE ctermfg=227

" Highlight current window
" highlight StatusLine   ctermfg=15  guifg=#ffffff ctermbg=28 guibg=#4e4e4e cterm=bold gui=bold
" highlight StatusLineNC ctermfg=249 guifg=#b2b2b2 ctermbg=237 guibg=#3a3a3a cterm=none gui=none

" Highlight Folds
" highlight Folded ctermbg=16

"---------------------------------------- end Colors --------------------------
"
"custom mappings
inoremap jj <ESC>
inoremap <C-t> <Esc>:tabnew<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <Leader>n gt
nnoremap <Leader>p gT
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt

"pasting
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
vnoremap <C-C> :w !xclip -i -sel c<CR><CR>

"window navigation
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap <Leader>v :vsplit<CR>


