"Vundle
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
	echo "Installing Vundle.."
	echo ""
	silent !mkdir -p ~/.vim/bundle
	silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
	let iCanHazVundle=0
endif

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'ervandew/supertab'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-git'
Plugin 'MarcWeber/vim-addon-mw-utils '
Plugin 'tomtom/tlib_vim'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'Kocha/vim-systemc'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"end vundle

"General setting
syntax on
colorscheme desert
set nu
set hlsearch
set tabstop=4
set shiftwidth=4
set ai
set backspace=indent,eol,start
set ruler


"Specific file type setting
au BufRead,BufNewFile *.cpp set cin ai et nu sw=2 ts=2
au BufRead,BufNewFile *.v set cin ai et nu sw=2 ts=2
au BufRead,BufNewFile *.c set cin ai et nu sw=4 ts=4
au BufRead,BufNewFile *.h set cin ai et nu sw=2 ts=2
au BufRead,BufNewFile *.py set ai et nu sw=4 ts=4 tw=80
au BufRead,BufNewFile *.md set ai et nu sw=4 ts=4 tw=80 spell spelllang=en_us

nnoremap <silent> <F5> :NERDTree<CR>
nnoremap <silent> <F6> :TagbarToggle<CR>
nnoremap <F9> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>  

autocmd FileType c,cpp  map <buffer> <leader><space> :w<cr>:make<cr>
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :cw 10<cr> 


set nocp 
filetype plugin on
set completeopt=menu,menuone

"Pathogen setting
"call pathogen#infect() 

"Template setting
"let g:templates_plugin_loaded = 1

"Pandoc vim setting
let g:pandoc_no_folding = 1

"let g:NERDTreeDirArrows=0

autocmd vimenter * NERDTree


"switch to last tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
