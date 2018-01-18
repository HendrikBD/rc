execute pathogen#infect()                      

" Colors & Highlighting
"
colorscheme badwolf 		" Cool Colourscheme 

if !exists("g:syntax_on")	" Ensures highlighting isn't affected
	syntax enable   		" Enable syntax processing, aka allows highlighting & font
endif

"Spaces & Tabs
"
set tabstop=4			" Sets the number of visual spaces/tab
set softtabstop=4		" Sets the number of spaces/tab for editing
set expandtab			" Sets tab to create spaces (instead of tab char)

"UI Config
"
set number              " Adds line numbers
set showcmd             " Shows commands entered at bottom
set cursorline          " Underlines the current line
filetype indent on      " Loads filetype specific indent files (from .vim/indent)
set wildmenu            " Provides a graphical menu when autocompleting commands
set lazyredraw          " Removes unnecessary redraws of text
set showmatch           " Highlights matching parenthesis



" Leader Shortcuts
"
let mapleader=","                           " Set leader to comma
nnoremap <leader>u :GundoToggle<CR>         " Maps ,u to gundo Super-Undo
nnoremap <leader>ev :sp $MYVIMRC<CR>        " Maps ,ev to open .vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>    " Maps ,sv to load .vimrc
nnoremap <leader>s :mksession<CR>           " Saves session, can be opened with vim -s
nnoremap <leader>a :Ag                      " Uses ag (silver searcher) to search source code

" Searching
"
set incsearch           " Search as characters are entered
set hlsearch            " Highlights search results
                        " Turn off search highlight with space, currently NOT working
nnoremap <leader><space> :nohls<CR>

" Folding
"
set foldenable          " Allow text folding
set foldlevelstart=10   " Open most folds by default
set foldnestmax=10      " 10 nested fold maximum
nnoremap <space> za     " Remaps space to open/close folds
set foldmethod=indent   " Fold based on indent level

" Movement
"
" nnoremap E $            " Remaps E to move to end of line
nnoremap gV '[v']
nnoremap <C-J> <C-W><C-J>   " Remaps split navigation to Ctrl-h/j/k/l
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"CtrlP Settings
"
let g:ctrlp_match_window = 'bottom,order:ttb'       " Order matching files top to bottom
let g:ctrlp_switch_buffer = 0                       " Always open new files in new buffer
let g:ctrlp_working_path_mode = 0                   " Allow changing working dir during editing
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'  " Not really sure, more cd stuff?

" Backups & Directory
"    Enable backups and set backup directory
set backup
set backupdir=~/.vim/tmp/backup
set writebackup
set directory^=$HOME/.vim/tmp

"set modelines=1
" foldmethod=marker:foldlevel=0

