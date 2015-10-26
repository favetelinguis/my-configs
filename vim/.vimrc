" Vundle {{{

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

  " Bars, panels, and files
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'

" Requires Git
Plugin 'tpope/vim-fugitive'
Plugin 'int3/vim-extradite'
Plugin 'airblade/vim-gitgutter'
Plugin 'mattn/webapi-vim' "Required by gist
Plugin 'mattn/gist-vim'
Plugin 'vim-scripts/gitignore'

" Text manipulation
Plugin 'tpope/vim-commentary'
Plugin 'vasconcelloslf/vim-interestingwords' " Highlight words

" Colors and layout
Plugin 'altercation/vim-colors-solarized'

" " Custom bundles
if filereadable(expand("~/.vim.local/bundles.vim"))
  source ~/.vim.local/bundles.vim
endif
if filereadable(expand("~/.vim.local/clojure.vim"))
  source ~/.vim.local/clojure.vim
endif

call vundle#end()

" }}}

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

" Use ii in insert mode to enter normal mode
inorema ii <Esc>
" }}}

" VIM user interface {{{

" Kill the damned Ex mode.
nnoremap Q <nop>

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
" set so=7

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


" }}}

" Text, tab and indent related {{{

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=4
set tabstop=4

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

" Leader bindings {{{
" Leader k highlight word interesting word plugin
" Leader K unhighlight all words interesting word plugin
" Leader ?? git gutter to see change
" If nerd tree is closed, find current file, if open, close it
nmap <silent> <leader>f <ESC>:call ToggleFindNerd()<CR>
nmap <silent> <leader>F <ESC>:NERDTreeToggle<CR>

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Fuzzy find files
nnoremap <silent> <Leader><space> :CtrlP<CR>

" Open new file
nnoremap <Leader>o :CtrlP<CR>

" Save file
nnoremap <Leader>w :w<CR>


" Disable highlight when <leader><cr> is pressed
" but preserve cursor coloring
nmap <silent> <leader><cr> :noh\|hi Cursor guibg=red<cr>
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
" }}}


" Git/Gist {{{

" Gist authorisation settings
let g:github_user = $GITHUB_USER
let g:github_token = $GITHUB_TOKEN
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" }}}

" Ctrlp {{{

let g:ctrlp_max_files=0
let g:ctrlp_show_hidden=1
let g:ctrlp_custom_ignore = { 'dir': '\v[\/](.git)$' }

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


" Customization {{{

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
if filereadable(expand("~/.vimrc.clojure"))
  source ~/.vimrc.clojure
endif

" }}}
