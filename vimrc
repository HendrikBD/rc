" Plugin Setup
"   {{{
set nocompatible        " Ensure vim (not vi, for vundle)
set hidden

filetype off

set rtp+=~/.fzf
set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
call plug#begin('~/.vim/bundle')

Plug 'VundleVim/Vundle.vim'

" Theme
Plug 'sjl/badwolf'

" Status
Plug 'itchyny/lightline.vim'

" Generic Utilities
Plug 'scrooloose/nerdtree'
Plug 'mbbill/undotree'
Plug 'tomtom/tcomment_vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Shougo/vimproc.vim'
Plug 'tpope/vim-fugitive' " Fugitive, brings git into vim
Plug 'tpope/vim-surround'
Plug 'adelarsq/vim-matchit'
Plug 'prettier/vim-prettier'
Plug 'heavenshell/vim-jsdoc'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Server

Plug 'Quramy/tsuquyomi'

" LSP + Ale
Plug 'w0rp/ale'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'burnettk/vim-angular'
Plug 'othree/javascript-libraries-syntax.vim'

Plug 'claco/jasmine.vim'

Plug 'chrisbra/unicode.vim'
Plug 'tpope/vim-characterize'

" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'
" Plugin 'matthewsimo/angular-vim-snippets'
" Plugin 'Valloric/YouCompleteMe'



" call vundle#end()
" filetype plugin indent on
call plug#end()
filetype plugin indent on
" }}}


" Colors & Highlighting
"   {{{
colorscheme badwolf 		" Cool Colourscheme 
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE


if !exists("g:syntax_on")	" Ensures highlighting isn't affected
	syntax enable   		" Enable syntax processing, aka allows highlighting & font
endif

" Remove split highlighting
highlight VertSplit cterm=NONE


" Font
set guifont=DejaVuSans

" Highlighting
hi Folded ctermbg=000
hi Search ctermbg=99
hi Search ctermfg=236

" }}}

" Spaces & Tabs
"   {{{

filetype indent on      " Loads filetype specific indent files (from .vim/indent)

set autoindent          " Sets vim to mantain indent when newline is created
set expandtab           " Sets tab to add spaces according to softtabstop

:set tabstop=2
:set softtabstop=2
:set shiftwidth=2

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
noremap <leader>nt :NERDTreeToggle<CR>
noremap <leader>nf :NERDTreeFind<CR>
noremap <leader>u :UndotreeToggle<CR>

" Edit configs
nnoremap <leader>ev :e $MYVIMRC<CR>        " Maps ,ev to open .vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>    " Maps ,sv to load .vimrc

nnoremap <leader>ees :e $HOME/.eslintrc.json<CR>
" nnoremap <leader>s :mksession<CR>           " Saves session, can be opened with vim -s
nnoremap <leader>a :Ag 

nnoremap <leader>rel :set relativenumber!<CR>

nnoremap <leader>. :bn<CR>
nnoremap <leader>m :bp<CR>

nnoremap <leader>, :CtrlPLine<CR>

nnoremap <leader>html :source ~/.vim/homebrew/htmlSkel.vim<CR>

nnoremap <leader>pst :set paste<CR>
nnoremap <leader>npst :set nopaste<CR>
" }}}

" Generic Steup
" {{{
"
set relativenumber!
"
" }}}

" Hotkeys
"   {{{
nnoremap U J
" }}}

" Fugitive
"   {{{
  nnoremap <leader>gd :Gdiff<CR>
  nnoremap <leader>gs :Gstatus<CR>
  nnoremap <leader>gc :Gcommit<CR>
  " nnoremap <leader>gp :Gpull<CR>
  noremap <leader>dp :diffput<CR>
  noremap <leader>dg :diffget<CR>

" }}}

" FZF Commands
"   {{{
nnoremap <leader>fa :Ag<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fc :Commits<CR>
" }}}


" Copy Commands
" {{{
" Add hotkeys to copy text to independnet registers
noremap <leader>W "ayy
noremap <leader>w "ap
noremap <leader>q i<space><esc>"apbhx
"s-a
noremap <leader>S "syy
noremap <leader>s "sp
noremap <leader>a i<space><esc>"spbhx

" Command to copy to windows clipboard (saves to new buffer then uses clip.exe)
" map <C-c> y:new ~/.vimbuffer<CR>VGp:x<CR>:bd ~/.vimbuffer<CR>:!cat ~/.vimbuffer \| clip.exe<CR><CR>
noremap <C-c> y:new ~/.vimbuffer<CR>VGp:x<CR>:bd ~/.vimbuffer<CR>
noremap <C-d> :r ~/.vimbuffer<CR>
" }}}

" Searching
"   {{{
set incsearch           " Search as characters are entered
set hlsearch            " Highlights search results
                        " Turn off search highlight with space, currently NOT working
nnoremap <leader><space> :nohls<CR>
vnoremap // y/<C-R>"<CR>'
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
nnoremap J <C-d>
nnoremap K <C-u>

set splitbelow
set splitright
" }}}

" NERDTree Settings
" {{{
let NERDTreeChDirMode=2
" }}}

set wildignore+=*/node_modules/*

" Backups & Directory
" Enable backups and set backup directory   {{{
set backup
set backupdir=~/.vim/tmp/backup
set writebackup
set directory^=$HOME/.vim/tmp
" }}}

" Autocomplete Options & Cmds
"   {{{
" let g:ycm_python_binary_path = '/usr/bin/python'
" let g:ycm_autoclose_preview_window_completion=1 "ensures autocomp window exits
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" let g:UltiSnipsExpandTrigger="<CR>"

" let g:ycm_key_list_select_completion = ['<Tab>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<S-Tab>', '<Up>']
"
" let g:UltiSnipsJumpForwardTrigger = "<Tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<S-tab>"

" Setting <CR> (enter) to trigger UltiSnippet if menu is up, otherwise inset
" newline

" let g:ulti_expand_or_jump_res = 0 "default value, just set once

" function! Ulti_ExpandOrJump_and_getRes()
"   call UltiSnips#ExpandSnippetOrJump()
"   return g:ulti_expand_or_jump_res
" endfunction

" inoremap <CR> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0)?"":"\n"<CR>

set completeopt=menuone,preview,noinsert
" }}}

" Virtualenv Support
" {{{

" py3 << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"   execfile(activate_this, dict(__file__=activate_this))
" EOF
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
" }}}

" Notifications
"   {{{
set visualbell
" }}}
"

" Auto Formatting
set formatoptions-=cro



" Syntastic Config (recommended by repo)
"   {{{
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
"
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = 'npm run lint --'
" }}}




" Hide insert/mode
set noshowmode
set laststatus=2


" =============================================================================
" Filename: autoload/lightline/colorscheme/PaperColor_dark.vim
" Author: TKNGUE
" License: MIT License
" Last Change: 2015-07-27 06:01
" =============================================================================

let s:red = '#df0000'
let s:green = '#008700'
let s:blue = '#00afaf'

let s:pink = '#afdf00'
let s:olive = '#dfaf5f'
let s:navy = '#df875f'

let s:orange = '#d75f00'
let s:purple = '#8959a8'
let s:aqua = '#3e999f'

" Basics:
let s:foreground = '#d0d0d0'
let s:background = '#444444'
let s:window = '#efefef'
let s:status = '#999999'
let s:error = '#5f0000'

" Tabline:
let s:tabline_bg = '#3a3a3a'
let s:tabline_active_fg = '#1c1c1c'
let s:tabline_active_bg = '#00afaf'
let s:tabline_inactive_fg = '#c6c6c6'
let s:tabline_inactive_bg = '#585858'

" Statusline:
let s:statusline_active_fg = '#1c1c1c'
let s:statusline_active_bg = '#5f8787'
let s:statusline_inactive_fg = '#c6c6c6'
let s:statusline_inactive_bg = '#444444'

" Visual:
let s:visual_fg = '#000000'
let s:visual_bg = '#8787af'

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:foreground, s:background ], [ s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.normal.right = [ [ s:foreground, s:background ], [ s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ]]
let s:p.inactive.right = [ [ s:foreground, s:background ], [ s:foreground, s:background ] ]
let s:p.inactive.left = [ [ s:foreground, s:background ], [ s:foreground, s:background ] ]
let s:p.inactive.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ], ]
let s:p.insert.left = [ [ s:background, s:blue], [ s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.replace.left = [ [ s:background, s:pink ], [s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.visual.left = [ [ s:visual_fg, s:visual_bg ], [s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.tabline.left = [ [s:tabline_inactive_fg, s:tabline_inactive_bg ]]
let s:p.tabline.tabsel = [ [s:tabline_active_fg, s:tabline_active_bg ] ]
let s:p.tabline.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ]]
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:background, s:error ] ]

let g:lightline#colorscheme#hidden_dark#palette = lightline#colorscheme#fill(s:p)

let g:lightline = {
      \ 'colorscheme': 'hidden_dark',
      \ }



set modeline
set modelines=1
" vim: foldmethod=marker
