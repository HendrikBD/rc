
" Colors & Highlighting
"
colorscheme badwolf		" Cool Colourscheme 

if !exists("g:syntax_on")	" Ensures highlighting isn't affected
	syntax enable		" Enable syntax processing, aka allows highlighting & font
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


set directory^=$HOME/.vim/tmp
