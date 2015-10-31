" echo ">^.^<"

set number
"" set textwidth=79  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line

set foldmethod=indent
set foldlevel=99

set backspace=indent,eol,start
set hlsearch

" just for keeping in mind, jump back -- <c-o>
" from jedi_vim
" Completion <C-Space>
" Goto assignments <leader>g (typical goto function)
" Goto definitions <leader>d (follow identifier as far as possible, includes imports and statements)
" Show Documentation/Pydoc K (shows a popup with assignments)
" Renaming <leader>r
" Usages <leader>n (shows all the usages of a name)
" Open module, e.g. :Pyimport os (opens the os module)

let mapleader=","

" open vimrc and make changes take effect
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" quickly quote this word
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" mapping keys for run python
nnoremap <F9> :! python %<cr>

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" move code blocks up and down
vnoremap <c-down> :m '>+1<CR>gv=gv
vnoremap <c-up> :m '<-2<CR>gv=gv
vnoremap < <gv
vnoremap > >gv

execute pathogen#infect()
syntax on
filetype plugin on
filetype plugin indent on

nnoremap <F5> :GundoToggle<CR>

"" let g:syntastic_python_python_exec = '/path/to/python3'
let g:syntastic_python_checkers = ['pep8', 'pylint']
let g:syntastic_alway_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" ignore some warnings
"" let g:syntastic_python_checker_args='--ignore=E501,E225'

" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir,
            'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

map <c-n> :NERDTreeToggle<CR>

" Preview md file in chrome
autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} vnoremap <Leader>p :!start "/opt/google/chrome/google-chrome %"<CR>

autocmd BufWritePre *.py :%s/\s\+$//e
