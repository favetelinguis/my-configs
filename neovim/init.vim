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
  call minpac#add('joshdick/onedark.vim', {'type': 'opt'})
  call minpac#add('itchyny/lightline.vim')
  call minpac#add('sheerun/vim-polyglot')
  call minpac#add('mhinz/vim-grepper')
  call minpac#add('yssl/QFEnter')
  call minpac#add('tpope/vim-vinegar')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('jiangmiao/auto-pairs')
  call minpac#add('luochen1990/rainbow')

  " RUST
  call minpac#add('rust-lang/rust.vim')
  call minpac#add('ncm2/ncm2')
  call minpac#add('roxma/nvim-yarp')


  call minpac#add('autozimu/LanguageClient-neovim', {'do': {-> system('bash install.sh')}})

  "ncm2
  " enable ncm2 for all buffers
  autocmd BufEnter * call ncm2#enable_for_buffer()

  " IMPORTANT: :help Ncm2PopupOpen for more information
  set completeopt=noinsert,menuone,noselect
  set shortmess+=c

  " Rust settings
  let g:rustfmt_autosave = 1 " Formats buffer on save

  " << LSP >>
  let g:LanguageClient_autoStart = 0
  nnoremap <leader>lcs :LanguageClientStart<CR>

  " if you want it to turn on automatically
  " let g:LanguageClient_autoStart = 1

  let g:LanguageClient_serverCommands = {
      \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
      \ }

  noremap <silent> <leader>h :call LanguageClient_textDocument_hover()<CR>
  noremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
  noremap <silent> <leader>r :call LanguageClient_textDocument_rename()<CR>
  " << LSP >>

  " Plugin settings here.
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
  packadd! onedark.vim " must load last?
  colorscheme onedark

  " lightline config
  set noshowmode " remove -- INSERT -- in ex prompt
  let g:lightline = { 'colorscheme': 'onedark' } " set color scheme for lightline
endif

if has('nvim')
  " Exit from terminal mode
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>

  " Set cursor color in terminal mode
  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif
