"General setting
syntax on
colorscheme desert
set nu
set hlsearch
set tabstop=4
set shiftwidth=4
set ai
set ruler 

"Specific file type setting
au BufRead,BufNewFile *.cpp set cin ai et nu sw=2 ts=2
au BufRead,BufNewFile *.c set cin ai et nu sw=2 ts=2
au BufRead,BufNewFile *.h set cin ai et nu sw=2 ts=2
au BufRead,BufNewFile *.py set ai et nu sw=4 ts=4 tw=80
au BufRead,BufNewFile *.md set ai et nu sw=4 ts=4 tw=80 spell spelllang=en_us

nnoremap <silent> <F5> :NERDTree<CR>
nnoremap <silent> <F6> :TagbarToggle<CR>
nnoremap <F9> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>  


set nocp 
filetype plugin on
set completeopt=menu,menuone

"Pathogen setting
call pathogen#infect() 

"Let supertab and snipmate work together
"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabMappingForward="<S-Space>" 

"Template setting
"let g:templates_plugin_loaded = 1

"Pandoc vim setting
let g:pandoc_no_folding = 1


