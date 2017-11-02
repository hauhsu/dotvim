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

" super strong auto complete 
Plugin 'Valloric/YouCompleteMe'
let g:ycm_confirm_extra_conf = 0
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>ji :YcmCompleter GoToDeclaration<CR>
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion   = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
let g:ycm_filetype_blacklist = {}


" snippet engine
Plugin 'SirVer/ultisnips'
let g:UltiSnipsSnippetsDir='~/.vim/snippets'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "~/.vim/UltiSnips"]
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" snippet patterns
Plugin 'honza/vim-snippets'

" file browser
Plugin 'scrooloose/nerdtree'
nnoremap <silent> <F5> :NERDTreeTabsToggle<CR>

Plugin 'jistr/vim-nerdtree-tabs'
nnoremap <silent> <F6> :TagbarToggle<CR>

" c++/python source overview
Plugin 'majutsushi/tagbar'

Plugin 'tomtom/tlib_vim'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
let g:pandoc_no_folding = 1


"SystemC syntax highlight
"Plugin 'Kocha/vim-systemc'


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


"Specific file type setting
au BufRead,BufNewFile *.cpp,*.hpp set cin ai et nu sw=2 ts=2 
au BufRead,BufNewFile *.v set cin ai et nu sw=2 ts=2
au BufRead,BufNewFile *.c,*.h set cin ai et nu sw=2 ts=2
au BufRead,BufNewFile *.py set ai et nu sw=4 ts=4 tw=80 
au BufRead,BufNewFile *.sc set ai et nu sw=4 ts=4 tw=80 spell filetype=scala
au BufRead,BufNewFile *.sc set ai et nu sw=4 ts=4 tw=80 filetype=scala
au BufRead,BufNewFile *.rst set ai et nu sw=4 ts=4 tw=80 spell
au BufRead,BufNewFile *.tex set ai et nu sw=4 ts=4 tw=80 spell

"Edit and source vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"Compile C/C++ in Vim
autocmd FileType c,cpp  map <buffer> <leader><space> :w<cr>:make<cr>
nnoremap <leader>cn :cn<cr>
nnoremap <leader>cp :cp<cr>
nnoremap <leader>cw :cw 10<cr> 
nnoremap <leader>cq :ccl<cr> 


"use \tl to switch to last tab
let g:lasttab = 1
nnoremap <Leader>gt :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


imap jk <ESC>


"share clip board
set clipboard=unnamed

" Change directory to the current buffer when opening files.
set autochdir



map <C-K> :pyf ~/scripts/clang-format-3.4.py<cr>
imap <C-K> <c-o>:pyf ~/scripts/clang-format-3.4.py<cr>
