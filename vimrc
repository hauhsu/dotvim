"----Vundle
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
	echo "Installing Vundle.."
	echo ""
	silent !mkdir -p ~/.vim/bundle
	silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/Vundle.vim
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

" Other plugins
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'git@github.com:jistr/vim-nerdtree-tabs.git'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-git'
Plugin 'git://github.com/MarcWeber/vim-addon-mw-utils.git'
Plugin 'tomtom/tlib_vim'
Plugin 'git@github.com:vim-pandoc/vim-pandoc-syntax.git'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'Kocha/vim-systemc'
Plugin 'git@github.com:vim-scripts/OmniCppComplete.git'
Plugin 'git@github.com:elzr/vim-json.git'
"cannot compile vim with python support QQ
"Plugin 'git@github.com:Valloric/YouCompleteMe.git' 

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"----end vundle 

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
au BufRead,BufNewFile *.cpp,*.hpp set cin ai et nu sw=2 ts=2 omnifunc=omni#cpp#complete#Main tags+=~/.vim/tags/stl_tags

au BufRead,BufNewFile *.v set cin ai et nu sw=2 ts=2
au BufRead,BufNewFile *.c set cin ai et nu sw=4 ts=4
au BufRead,BufNewFile *.h set cin ai et nu sw=2 ts=2
au BufRead,BufNewFile *.py set ai et nu sw=4 ts=4 tw=80
au BufRead,BufNewFile *.md set ai et nu sw=4 ts=4 tw=80 spell spelllang=en_us

nnoremap <silent> <F5> :NERDTreeTabsToggle<CR>
nnoremap <silent> <F6> :TagbarToggle<CR>
nnoremap <F4> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>  

autocmd FileType c,cpp  map <buffer> <leader><space> :w<cr>:make<cr>
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :cw 10<cr> 


" OmniCppComplete
set nocp 
filetype plugin on
set completeopt=menu,menuone
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]


"Pandoc vim setting
let g:pandoc_no_folding = 1



"switch to last tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
