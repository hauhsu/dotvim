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

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'

" Other plugins
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'majutsushi/tagbar'


Plugin 'tomtom/tlib_vim'
Plugin 'vim-pandoc/vim-pandoc-syntax'

" snippet engine
Plugin 'SirVer/ultisnips'
" snippet patterns
Plugin 'honza/vim-snippets'

"SystemC syntax highlight
"Plugin 'Kocha/vim-systemc'
"Compile while texting
"Plugin 'scrooloose/syntastic'

"vim with lldb
Plugin 'gilligan/vim-lldb'

"Git wrapper
Plugin 'tpope/vim-fugitive'

"Latex
Plugin 'gerw/vim-latex-suite'


"Scala
Plugin 'derekwyatt/vim-scala'

"
Plugin 'terryma/vim-multiple-cursors'

"Quick comment
Plugin 'tpope/vim-commentary'

"Easy Grep
Plugin 'dkprice/vim-easygrep'

"Auto pair
Plugin 'jiangmiao/auto-pairs'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"----end vundle 

"General configurations
syntax on
colorscheme desert
set nu
set hlsearch
set tabstop=4
set shiftwidth=4
set ai
set backspace=indent,eol,start
set ruler
set mouse=a


"Specific file type setting
au BufRead,BufNewFile *.cpp,*.hpp set cin ai et nu sw=2 ts=2 
au BufRead,BufNewFile *.v set cin ai et nu sw=2 ts=2
au BufRead,BufNewFile *.c,*.h set cin ai et nu sw=2 ts=2
au BufRead,BufNewFile *.md set ai et nu sw=4 ts=4 tw=80 spell spelllang=en_us filetype=markdown
au BufRead,BufNewFile *.py set ai et nu sw=4 ts=4 tw=80 spell

nnoremap <silent> <F5> :NERDTreeTabsToggle<CR>
nnoremap <silent> <F6> :TagbarToggle<CR>

"Edit and source vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"Compile in Vim
autocmd FileType c,cpp  map <buffer> <leader><space> :w<cr>:make<cr>
nnoremap <leader>cn :cn<cr>
nnoremap <leader>cp :cp<cr>
nnoremap <leader>cw :cw 10<cr> 


"Pandoc vim setting
let g:pandoc_no_folding = 1

"use \tl to switch to last tab
let g:lasttab = 1
nnoremap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i


"Test map
imap jk <ESC>

"YouCompleteMe settings
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_confirm_extra_conf = 0
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>ji :YcmCompleter GoToDeclaration<CR>
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
let g:UltiSnipsExpandTrigger="<c-j>"
let g:ycm_autoclose_preview_window_after_insertion = 1


"share clip board
set clipboard=unnamed


"vim lldb map
let g:lldb_map_Lframe = "<leader>f"


" Change directory to the current buffer when opening files.
set autochdir

" Add UntiSnips path
let g:UltiSnipsSnippetDirectories=["UltiSnips", "~/.vim/UltiSnips"]

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
