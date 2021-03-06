" Plugin Setup
"   {{{
set nocompatible        " Ensure vim (not vi, for vundle)
set hidden
filetype off


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'sjl/badwolf'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mbbill/undotree'
Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'ggreer/the_silver_searcher'
Plugin 'tomtom/tcomment_vim'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'burnettk/vim-angular'
Plugin 'claco/jasmine.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Shougo/vimproc.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'w0rp/ale'
Plugin 'adelarsq/vim-matchit'
Plugin 'prettier/vim-prettier'
" Plugin 'heavenshell/vim-jsdoc'


Plugin 'junegunn/fzf.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'matthewsimo/angular-vim-snippets'
Plugin 'Valloric/YouCompleteMe'


call vundle#end()
filetype plugin indent on
" }}}

let g:airline#extensions#tabline#enabled = 1


" Autocompletion
"

" Colors & Highlighting
"   {{{
colorscheme badwolf 		" Cool Colourscheme
if !exists("g:syntax_on")	" Ensures highlighting isn't affected
	syntax enable   		" Enable syntax processing, aka allows highlighting & font
endif

let g:airline_theme='distinguished'
let g:javascript_plugin_jsdoc = 1
" }}}

" Spaces & Tabs
"   {{{
" let g:typescript_indent_disable = 1
" let g:javascript_indent_disable = 1

filetype indent on      " Loads filetype specific indent files (from .vim/indent)

set autoindent          " Sets vim to mantain indent when newline is created
set expandtab           " Sets tab to add spaces according to softtabstop

" Sets spacing for different filetypes
augroup webDevGroup
  au BufRead,BufNewFile *.js,*.ts,*.html,*.css,*.vim
        \ :setlocal tabstop=2
   		\| :setlocal shiftwidth=2

augroup END

" And options for python
au BufNewFile,BufRead *.py
      \| :setlocal tabstop=4
      \| :setlocal softtabstop=4
      \| :setlocal shiftwidth=4
      \| :setlocal textwidth=79
      \| :setlocal fileformat=unix

:set tabstop=2
:set shiftwidth=2
:setlocal tabstop=2
:setlocal softtabstop=2
:setlocal shiftwidth=2

setlocal foldlevelstart=10

"   }}}

" UI Config
"   {{{
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
noremap <leader>n :NERDTreeToggle<CR>
noremap <leader>u :UndotreeToggle<CR>
noremap <leader>r :redraw!<CR>
nnoremap <leader>ev :e $MYVIMRC<CR>        " Maps ,ev to open .vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>    " Maps ,sv to load .vimrc
nnoremap <leader>js :%!python -m json.tool<CR>    "
" nnoremap <leader>s :mksession<CR>           " Saves session, can be opened with vim -s

" Ag command
" vnoremap <leader>a y:!tmux send-keys Enter :Ag Enter; tmux run-shell -b "sleep 0.3; tmux send-keys <C-r>""<CR>
" nnoremap <leader>a :Ag<CR>
" nnoremap <leader>a zMzr

nnoremap <leader>rel :set relativenumber!<CR>

nnoremap <leader>. :bn<CR>
nnoremap <leader>m :bp<CR>

nnoremap <leader>, :CtrlPLine<CR>

nnoremap <leader>html :source ~/.vim/homebrew/htmlSkel.vim<CR>
nnoremap <leader>cl oconsole.log()<Esc>
nnoremap <leader>st osetTimeout(() => {}, 2000)<Esc>7hi
" }}}

" Hotkeys
"   {{{
  nnoremap U J
  nnoremap <ALT+k> <Up>
  nnoremap <ALT+j> <Down>
" }}}


" Fugitive
"   {{{
  nnoremap <leader>gd :Gdiff<CR>
  nnoremap <leader>gs :Gstatus<CR>
  nnoremap <leader>gc :Gcommit<CR>
  nnoremap <leader>gp :Gpull<CR>
  noremap <leader>dp :diffput<CR>
  noremap <leader>dg :diffget<CR>

" }}}

" Visual Mode
" {{{
" vno:emap <C-O> y/<C-R>"<CR>
vnoremap // y/<C-r>"<CR>'
" }}}

" Tabs
" {{{
" vno:emap <C-O> y/<C-R>"<CR>
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
" }}}

"
" Copy Commands
" {{{
" Add hotkeys to copy text to independnet registers
noremap <leader>W "ayy
noremap <leader>w "ap
noremap <leader>q i<space><esc>"apbhx
"s-a
noremap <leader>S "syy
noremap <leader>s "sp
" noremap <leader>a i<space><esc>"spbhx

" Command to copy to windows clipboard (saves to new buffer then uses clip.exe)
" map <C-c> y:new ~/.vimbuffer<CR>VGp:x<CR>:bd ~/.vimbuffer<CR>:!cat ~/.vimbuffer \| clip.exe<CR><CR>
" Command to copy to ubuntu clipboard
map <C-c> y:new ~/.vimbuffer<CR>VGp:x<CR>:bd ~/.vimbuffer<CR>:!cat ~/.vimbuffer \| xclip -sel clip<CR><CR>
map <C-d> :r ~/.vimbuffer<CR>
"
" noremap <C-c> y:new ~/.vimbuffer<CR>VGp:x<CR>:bd ~/.vimbuffer<CR>:!cat ~/.vimbuffer \| clip.exe<CR><CR>
" map <C-v> :r ~/.vimbuffer<CR>
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
set foldlevelstart=10   " Open most folds by default
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

noremap H ^
noremap L $
noremap J <C-d>
noremap K <C-u>

cnoremap <C-k> <Up>
cnoremap <C-j> <Down>

set splitbelow
set splitright

runtime macros/matchit.vim
" }}}

" NERDTree Settings
" {{{
" let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~%']
"CtrlP Settings
"   {{{
let g:ctrlp_match_window = 'bottom,order:ttb'       " Order matching files top to bottom
let g:ctrlp_switch_buffer = 0                       " Always open new files in new buffer
let g:ctrlp_working_path_mode = 'rw'                " Allow changing working dir during editing
set wildignore+=*/node_modules/*
" let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'  " Not really sure, more cd stuff?
" }}}

" Backups & Directory
" Enable backups and set backup directory   {{{
set backup
set backupdir=~/.vim/tmp/backup
set writebackup
set directory^=$HOME/.vim/tmp
" }}}

" Autocomplete Options & Cmds
"   {{{
let g:ale_completion_enabled = 1

let g:ycm_python_binary_path = '/usr/bin/python'
let g:ycm_autoclose_preview_window_completion=1 "ensures autocomp window exits
noremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" let g:UltiSnipsExpandTrigger="<CR>"

let g:ycm_key_list_select_completion = ['<Tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-Tab>', '<Up>']

let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-tab>"

"set complete=.,b,u,]
set completeopt=preview,menuone,noinsert

" Setting <CR> (enter) to trigger UltiSnippet if menu is up, otherwise inset
" newline

let g:ulti_expand_or_jump_res = 0 "default value, just set once

function! Ulti_ExpandOrJump_and_getRes()
  call UltiSnips#ExpandSnippetOrJump()
  return g:ulti_expand_or_jump_res
endfunction

inoremap <CR> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0)?"":"\n"<CR>
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

" Running and Compiling
" {{{
    nnoremap <buffer> <F5> :exec '!python' shellescape(@%, 1)<cr>
" }}}

" Opening Format
" {{{
" :sp
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
set relativenumber!
" }}}

" Notifications
"   {{{
set visualbell
" }}}

" Ale Config
"   {{{
let g:ale_echo_cursor = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"   }}}

" Formatting
"
set formatoptions-=cro


" Ctrl Space options
"
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1


" Removes whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

set statusline+=%#warningmsg#
set statusline+=%*


set modeline
set modelines=1
" vim: foldmethod=marker
