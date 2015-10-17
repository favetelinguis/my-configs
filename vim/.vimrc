" General {{{

" This option will force vim to source .vimrc files that are stored in working directory
" and enables project specific settings. OBS See set secure in this file!
set exrc

" Since vimrc will source .vimrc from any folder it it started from this is a security 
" threat.
" This will limit what command as allowed to execute in non default vimrc files
" commands that writes to files of execute shellcommands are not allowed and map commands 
" are shown.
set secure

" use indentation for folds
set foldmethod=indent
set foldnestmax=5
set foldlevelstart=99
set foldcolumn=0

augroup vimrcFold
  " fold vimrc itself by categories
  autocmd!
  autocmd FileType vim set foldmethod=marker
  autocmd FileType vim set foldlevel=0
augroup END

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" Leader key timeout
set tm=2000

" Use par for prettier line formatting
" set formatprg="PARINIT='rTbgqR B=.,?_A_a Q=_s>|' par\ -w72"

" Kill the damned Ex mode.
nnoremap Q <nop>

set clipboard=unnamed

" Use ii in insert mode to enter normal mode
inorema ii <Esc>

" Save file
nnoremap <Leader>w :w<CR>

" }}}

" Vundle {{{

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" Support bundles
Plugin 'vim-scripts/gitignore'
Plugin 'mileszs/ack.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets' "Snippets used by ultisnip

  " Bars, panels, and files
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'xolox/vim-misc' " Required by easytags
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'int3/vim-extradite'
Plugin 'airblade/vim-gitgutter'
Plugin 'mattn/webapi-vim' "Required by gist
Plugin 'mattn/gist-vim'

" Text manipulation
Plugin 'vim-scripts/Gundo'
Plugin 'tpope/vim-commentary'
Plugin 'vasconcelloslf/vim-interestingwords' " Highlight words

" Colors and layout
Plugin 'altercation/vim-colors-solarized'

" " Custom bundles
" " Nice to use if i want to source other bundles
" if filereadable(expand("~/.vim.local/bundles.vim"))
"   source ~/.vim.local/bundles.vim
" endif

call vundle#end()

" }}}

" VIM user interface {{{

" Used for a nicer completion of the command mode
" Turn on the WiLd menu
set wildmenu
" Tab-complete files up to longest unambiguous prefix
set wildmode=list:longest,full

" Disable VIM welcomescreen
set shortmess+=I

" Better splits (new windows appear below and to the right)
set splitbelow
set splitright

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Always show current position
" set ruler
set number
set relativenumber
" Highlight the current line
set cursorline


" Show trailing whitespace
set list
" But only interesting whitespace
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" Height of the command bar
set cmdheight=1

" Configure backspace so it acts as it should act
" set backspace=eol,start,indent
" set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set vb t_vb=

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" }}}

" Colors and Fonts {{{

" Enable syntax highlighting
syntax enable
"
" For solarized color scheme
set background=dark
colorscheme solarized
let g:solarized_diffmode="high"

" Enable filetype plugins
filetype plugin on
filetype indent on

" Use same color behind concealed unicode characters
hi clear Conceal

" Don't blink normal mode cursor
set guicursor=n-v-c:block-Cursor
set guicursor+=n-v-c:blinkon0

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" }}}

" Files, backups and undo {{{

" Turn backup off, since most stuff is in Git anyway...
set nobackup
set nowb
set noswapfile

" Source the vimrc file after saving it
augroup sourcing
  autocmd!
  autocmd bufwritepost .vimrc source $MYVIMRC
augroup END

" Open file prompt with current path
" nmap <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>

" Show undo tree
nmap <silent> <leader>u :GundoToggle<CR>

" Fuzzy find files
nnoremap <silent> <Leader><space> :CtrlP<CR>
let g:ctrlp_max_files=0
let g:ctrlp_show_hidden=1
let g:ctrlp_custom_ignore = { 'dir': '\v[\/](.git)$' }

" }}}

" Text, tab and indent related {{{

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" }}}

" Moving around, tabs, windows and buffers {{{

" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

" Disable highlight when <leader><cr> is pressed
" but preserve cursor coloring
nmap <silent> <leader><cr> :noh\|hi Cursor guibg=red<cr>

" Return to last edit position when opening files (You want this!)
augroup last_edit
  autocmd!
  autocmd BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal! g`\"" |
       \ endif
augroup END

" Remember info about open buffers on close
set viminfo^=%

" don't close buffers when you aren't displaying them
set hidden

"Always show the status line
set laststatus=2

" }}}

" Status line {{{

" Always show the status line
set laststatus=2

" Don't show seperators for airline
let g:airline_left_sep=''
let g:airline_right_sep=''

" }}}

" Editing mappings {{{

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

augroup whitespace
  autocmd!
  autocmd BufWrite *.hs :call DeleteTrailingWS()
augroup END

" }}}

" Spell checking {{{

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" }}}

" Helper functions {{{

" }}}

" NERDTree {{{

" Close nerdtree after a file is selected
let NERDTreeQuitOnOpen = 1

function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! ToggleFindNerd()
  if IsNERDTreeOpen()
    exec ':NERDTreeToggle'
  else
    exec ':NERDTreeFind'
  endif
endfunction

" If nerd tree is closed, find current file, if open, close it
nmap <silent> <leader>f <ESC>:call ToggleFindNerd()<CR>
nmap <silent> <leader>F <ESC>:NERDTreeToggle<CR>

" }}}

" Tags {{{

" Autofocus tagbar when expanded
let g:tagbar_autofocus = 1

"Use F8 for toggle tabbar
nmap <leader>y :TagbarToggle<CR>

" Add my custom comand to run first time in a c project to generate tags for c and h files
command InitCTags UpdateTags **/*.[hc]
" }}}

" Git/Gist {{{

" Gist authorisation settings
let g:github_user = $GITHUB_USER
let g:github_token = $GITHUB_TOKEN
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" }}}

" YCM {{{
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
" }}}

" Ctrlp {{{

" fuzzy find buffers
noremap <leader><leader> :CtrlPBuffer<cr>

" Fuzzy tags finder
nnoremap <leader>t :CtrlPTag<CR>

" Open new file
nnoremap <Leader>o :CtrlP<CR>

" Faster search
let g:ctrlp_use_caching = 0
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
   let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
   let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
       \ }
endif
" }}}

" Gundo settings {{{

let g:gundo_close_on_revert = 1
let g:gundo_preview_bottom = 1
" make gundo persistence in case of crash
set undodir=~/.vim/tmp/undo//
set undofile
set history=100
set undolevels=100
"
" }}}

" Customization {{{

" " Nice way to source external vimrc into this
" if filereadable(expand("~/.vimrc.local"))
"   source ~/.vimrc.local
" endif

" }}}
