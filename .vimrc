" line numbers
set number

" syntax highlighting and with color scheme
filetype plugin indent on
syntax enable
colorscheme monokai

" install plugins using pathogen.vim
execute pathogen#infect()

" coding
set encoding=utf-8
set fileencoding=utf-8

" highlighting search matches
set hlsearch

" highlighling of current line but it slows down srolling
"set cursorline
"hi CursorLine term=bold cterm=bold guibg=Grey40

" show whitespaces using F2
noremap <F2> :set list!<CR>
set listchars=tab:>-,trail:.

" indentation commands
command Spaces2 set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
command Spaces4 set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
command Tabs set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
Tabs

" set rulers
set colorcolumn=80,100,120

" set update time for GitGutter
set updatetime=100

" backspace fix
set backspace=indent,eol,start

" spell checking
command Spell set spell spelllang=en_GB
command Spelloff set nospell
