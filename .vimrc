execute pathogen#infect()

" Colors & Highlighting
"   {{{
colorscheme badwolf 		" Cool Colourscheme 
if !exists("g:syntax_on")	" Ensures highlighting isn't affected
	syntax enable   		" Enable syntax processing, aka allows highlighting & font
endif
" }}}

"Spaces & Tabs
"   {{{
set tabstop=4			" Sets the number of visual spaces/tab
set softtabstop=4		" Sets the number of spaces/tab for editing
set expandtab			" Sets tab to create spaces (instead of tab char)
" Defines file specific spacing
au BufNewFile,BufRead *.py
    \| :setlocal shiftwidth=4
    \| :setlocal textwidth=79
    \| :setlocal autoindent
    \| :setlocal fileformat=unix
au BufNewFile,BufRead *.js,*.html,*.css
    \| :setlocal tabstop=2
    \| :setlocal softtabstop=2
    \| :setlocal shiftwidth=2
    \| :setlocal foldlevelstart=10
au BufNewFile,BufRead *.txt
    \| :setlocal tabstop=4
    \| :setlocal softtabstop=4
    \| :setlocal shiftwidth=4
    \| :setlocal autoindent 
    \| :setlocal foldlevelstart=10
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyc,*.c,*.h match BadWhitespace /\s\+$/
" }}}

"UI Config
"   {{{
filetype indent on      " Loads filetype specific indent files (from .vim/indent)
set number              " Adds line numbers
set showcmd             " Shows commands entered at bottom
set cursorline          " Underlines the current line
set wildmenu            " Provides a graphical menu when autocompleting commands
set lazyredraw          " Removes unnecessary redraws of text
set showmatch           " Highlights matching parenthesis
set encoding=utf-8
set hidden
set clipboard=unnamed
" }}}

" Leader Shortcuts
"   {{{
let mapleader=","                           " Set leader to comma
nnoremap <leader>u :GundoToggle<CR>         " Maps ,u to gundo Super-Undo
nnoremap <leader>ev :sp $MYVIMRC<CR>        " Maps ,ev to open .vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>    " Maps ,sv to load .vimrc
nnoremap <leader>s :mksession<CR>           " Saves session, can be opened with vim -s
nnoremap <leader>a :Ag 
" }}}

" Searching
"   {{{
set incsearch           " Search as characters are entered
set hlsearch            " Highlights search results
                        " Turn off search highlight with space, currently NOT working
nnoremap <leader><space> :nohls<CR>
" }}}

" Folding
"   {{{
set foldenable          " Allow text folding
set foldlevelstart=0   " Open most folds by default
set foldnestmax=10      " 10 nested fold maximum
nnoremap <space> za     " Remaps space to open/close folds
set foldmethod=indent   " Fold based on indent level
" }}}

" Movement & Splitting
"   {{{
nnoremap gV '[v']
nnoremap <C-J> <C-W><C-J>   " Remaps split navigation to Ctrl-h/j/k/l
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright
" }}}

"CtrlP Settings
"   {{{
let g:ctrlp_match_window = 'bottom,order:ttb'       " Order matching files top to bottom
let g:ctrlp_switch_buffer = 0                       " Always open new files in new buffer
let g:ctrlp_working_path_mode = 0                   " Allow changing working dir during editing
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'  " Not really sure, more cd stuff?
" }}}

" Backups & Directory
" Enable backups and set backup directory   {{{
set backup
set backupdir=~/.vim/tmp/backup
set writebackup
set directory^=$HOME/.vim/tmp
" }}}

" Autocomplete (YouCompleteMe) Options
"   {{{
" let g:ycm_python_binary_path = '/usr/bin/python'
let g:ycm_autoclose_preview_window_completion=1 "ensures autocomp window exits
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" }}}

" Virtualenv Support
" {{{

py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
" }}}

" Plugins, from ~/.vim/bundle
" {{{
" badwolf, fugitive, indentPy, powerline, the_silver_searcher, CtrlP, gundo,
" nerdtree, SimpylFold, YouCompleteMe
"}}}

" Running and Compiling
" {{{
    nnoremap <buffer> <F5> :exec '!python' shellescape(@%, 1)<cr>
" }}}

set modeline
set modelines=1
" vim: foldmethod=marker:foldlevel=0
