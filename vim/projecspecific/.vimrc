" This file is ment for C projects

" Set indentation rules
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" Highligt after 110 width
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

" Vim assumes .h files are c++ change this to C
" If project comes with doxygen documentation use
" subtype to enable very nice doxygen highlighting.
augroup project
  autocmd!
  autocmd BufRead, BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

" By default vim has gf command that opens the file under the cursor in a new tab.
" This is extreamly useful when viewing header files.
" By default vim searches the working dir. I can also set vims path to search other dirs.
let &path.="src/include,/usr/include/AL,"

" configure build system
" vim has a built in command for make, the options that are executed can be set as shown.
set makeprg=make\ -C\ ../build\ -j9
" bind make to F4 ! prevents vim from jumping to location of first error found
nnoremap <F4> :make!<cr>

"Configure launch system
" map F5 to run my program
nnoremap <F5> :!./my_great_program<cr>
