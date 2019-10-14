" Use space not tabs
set tabstop=4 shiftwidth=4 expandtab

" Ignore case in search if search have upper case in it include case
set ignorecase
set smartcase

" Activate true color for nvim
set termguicolors

" exit insertmode
inoremap fd <ESC>
" set leader
let mapleader = "\<Space>"
set nowrap           " do not automatically wrap on load
set formatoptions-=t " do not automatically wrap text when typing

" Try to load minpac.
packadd minpac

if !exists('*minpac#init')
  " minpac is not available.

  " Settings for plugin-less environment.
else
  " minpac is available.
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Additional plugins here.
  call minpac#add('junegunn/fzf')
  call minpac#add('easymotion/vim-easymotion')
  call minpac#add('morhetz/gruvbox')
  call minpac#add('vim-airline/vim-airline')
  call minpac#add('sheerun/vim-polyglot')
  call minpac#add('mhinz/vim-grepper')
  call minpac#add('yssl/QFEnter')
  call minpac#add('tpope/vim-vinegar')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('jiangmiao/auto-pairs')
  call minpac#add('luochen1990/rainbow')
  call minpac#add('miyakogi/conoline.vim')
  call minpac#add('w0rp/ale')
  call minpac#add('christoomey/vim-tmux-navigator')
  " Haskell specific
  call minpac#add('alx741/vim-hindent')

  " Navigate panes without having to use w
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>

  " Plugin settings here.
  " ALE settings
  " Use the quickfix list for ALE and not the loclist
  let g:ale_set_loclist = 0
  let g:ale_set_quickfix = 1

  " ranbow params
  let g:rainbow_active = 1
  " vim-grepper
  let g:grepper = {}
  let g:grepper.tools = ['rg', 'git']
  " Search for the current selection example gsw search word
  nmap gs <plug>(GrepperOperator)
  xmap gs <plug>(GrepperOperator)
  nnoremap <Leader>g :Grepper -tool rg<CR>

  " QFEnter uses the same navigation as fzf
  let g:qfenter_keymap = {}
  let g:qfenter_keymap.vopen = ['<C-v>']
  let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
  let g:qfenter_keymap.topen = ['<C-t>']

  " Define user commands for updating/cleaning the plugins.
  " Each of them loads minpac, reloads .vimrc to register the
  " information of plugins, then performs the task.
  command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
  command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
  command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

  " Run the FZF plugin command
  nnoremap <C-p> :<C-u>FZF<CR>
  " make sure to set env export FZF_DEFAULT_COMMAND='rg --files' use rip-grep for fzf
  
  " Easymotion config
  " s{char}{char} to move to {char}{char}
  nmap s <Plug>(easymotion-overwin-f2)
  let g:EasyMotion_smartcase = 1 " ingore case

  " theme config
  syntax on
  colorscheme gruvbox
  " airline config
  let g:airline_theme = 'gruvbox'

endif

if has('nvim')
  " Exit from terminal mode
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>

  " Set cursor color in terminal mode
  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif
