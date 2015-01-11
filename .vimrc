" unsure why this was here
" filetype off

" Notes:
" - reload config:
"   :source ~/.vimrc
"
" TODO:
" - document this file
" - move gvim-specific diretove to .gvimrc
let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'jedi-vim')

execute pathogen#infect()
execute pathogen#helptags()

set nocompatible
set background=dark
set encoding=utf-8

set nobackup
set nowritebackup
set noswapfile
" set paste
set laststatus=2
set t_Co=256

" highlight >100 chars red
" match ErrorMsg '\%>101v.\+'

set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set expandtab
set smarttab

set visualbell


" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1
let g:pymode_options_max_line_length = 120
" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0


if has('persistent_undo')
    set undofile
    set undodir=~/.vim/undodir
endif

syntax enable

filetype plugin indent on
syntax on

" bash-like filename completion
set wildmode=longest,list,full
set wildmenu

" delete key behavior in osx
set backspace=indent,eol,start

" autoreload when vimrc changes
" this conflicts with vim-airline, loses buffer highlighting.
" augroup myvimrc
"     au!
"     au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
" augroup END

" close window if nerdtree is the only buffer
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" start nerdtree if vim is opened with no files specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" remap <leader>nn to NERDTree, opening in the cwd for whatever file is open

" don't set cwd to open file's dir
if version >= 703
    set noautochdir
    let NERDTreeChDirMode=0
endif

" show bookmarks automatically
let NERDTreeShowBookmarks=1

"
" keymaps
"
" open nerd in cwd
nnoremap <leader>nt :NERDTree .<CR>

" toggle set number
nnoremap <leader>sn :set number!<CR>

" close the current buffer but don't close the window
nnoremap <leader>bb :bp<bar>sp<bar>bn<bar>bd<CR>

" insert ipdb brkpt
nnoremap <leader>pdb oimport ipdb; ipdb.set_trace()


" vim-airline
let g:airline_powerline_fonts = 1

 " vim-airline-tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'


" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

