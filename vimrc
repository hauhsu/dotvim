"---------
" Plugins
"---------
call plug#begin('~/.vim/plugged')

"
" Super strong auto complete 
"
Plug 'Valloric/YouCompleteMe'
let g:ycm_confirm_extra_conf = 0
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>ji :YcmCompleter GoToDeclaration<CR>
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_filetype_blacklist = {}
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['pylint', 'python', 'flask8', 'mypy']


"
" Snippet engine
"
Plug 'SirVer/ultisnips'
let g:UltiSnipsSnippetsDir='~/.vim/snippets'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "~/.vim/UltiSnips"]
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger="<c-j>"


" snippet patterns
Plug 'honza/vim-snippets'

"
" Vim undo history browser
"
Plug 'sjl/gundo.vim'

"
" Git history browser
"
Plug 'junegunn/gv.vim'

"
" File browser
"
Plug 'scrooloose/nerdtree'
nnoremap <leader>t :NERDTreeToggle<CR>
" open nerdtree in current file dir
map <Leader>nt :NERDTree %:p:h<CR>
let NERDTreeIgnore=['\.o$', '__pycache__' ]

" C/C++ Python source overview
Plug 'majutsushi/tagbar'
nnoremap <leader>y :TagbarToggle<CR>

"
"Syntax checking
"
Plug 'vim-syntastic/syntastic'
nnoremap <leader>sy :SyntasticToggleMode<CR>

"
"Git wrapper
"
Plug 'tpope/vim-fugitive'

"
" Multiple cursor
"
Plug 'mg979/vim-visual-multi'

"
" Quick comment
"
Plug 'tpope/vim-commentary'

"
" Grep in vim
"
Plug 'dkprice/vim-easygrep'

"
" Move like 
"
Plug 'easymotion/vim-easymotion'

"
" Show indent
"
Plug 'Yggdroot/indentLine'

call plug#end()
"----end plugged


"------------------------
" General configurations
"------------------------
syntax on
colorscheme desert
set number
set hlsearch
set tabstop=4
set shiftwidth=4
set autoindent
set backspace=indent,eol,start
set ruler
set mouse=a
"share clip board
set clipboard=unnamed
" Change directory to the current buffer when opening files.
set autochdir
" Make vim more colorful
set termguicolors

if has("gui_macvim")
	set macmeta
	set mouse=a
endif

" Specific file type setting
au BufRead,BufNewFile *.cpp,*.hpp set cin ai et nu sw=2 ts=2 
au BufRead,BufNewFile *.v set cin ai et nu sw=2 ts=2
au BufRead,BufNewFile *.c,*.h set cin ai et nu sw=2 ts=2
au BufRead,BufNewFile *.py set ai et nu sw=4 ts=4 tw=79
au BufRead,BufNewFile *.hs set ai et nu sw=4 ts=4 tw=79
au BufRead,BufNewFile *.sc set ai et nu sw=4 ts=4 tw=80 filetype=scala
au BufRead,BufNewFile *.rst set ai et nu sw=4 ts=4 tw=80 spell
au BufRead,BufNewFile *.tex set ai et nu sw=4 ts=4 tw=80 spell


"-------------
" Key Mapping
"-------------

" Edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Run make for C/C++
autocmd FileType c,cpp  map <buffer> <leader><space> :w<cr>:make<cr>
nnoremap <leader>cn :cn<cr>
nnoremap <leader>cp :cp<cr>
nnoremap <leader>cw :cw 10<cr> 

" Tab navigation
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Cancel highlight
nnoremap <leader>h :noh<cr> 

" Map jk to ESC
imap jk <ESC>

" Highlight trailing spaces
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/
