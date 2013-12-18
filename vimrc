"General setting
syntax on
colorscheme desert
set nu
set hlsearch
set tabstop=4
set shiftwidth=4
set ai

"Specific file type setting
au BufRead,BufNewFile *.cpp set cin ai et nu sw=2 ts=2
au BufRead,BufNewFile *.c set cin ai et nu sw=2 ts=2
au BufRead,BufNewFile *.h set cin ai et nu sw=2 ts=2
au BufRead,BufNewFile *.py set ai et nu sw=4 ts=4 tw=80
au BufRead,BufNewFile *.md set ai et nu sw=4 ts=4 tw=80 spell spelllang=en_us

nnoremap <F9> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>  
nnoremap <silent> <F5> :NERDTree<CR>
nnoremap <silent> <F6> :Tlist<CR>

"Tlist setting
let Tlist_Show_One_File=1  
let Tlist_Exit_OnlyWindow=1 

set nocp 
filetype plugin on
set completeopt=menu,menuone

"Pathogen setting
call pathogen#infect() 

"Template setting
"let g:templates_plugin_loaded = 1

"Pandoc vim setting
let g:pandoc_no_folding = 1


