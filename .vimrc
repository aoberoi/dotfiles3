" -----------------------------------------------------------------------------
" Settings (things that start with set and can be in single-quotes)
" -----------------------------------------------------------------------------

" enable syntax highlighting
:syntax enable

" turn on line numbering
set number

" turn on (line, column) 00% display in status bar
set ruler

" set text encoding
set encoding=utf-8

" show matching bracket or parenthesis when cursor is over one
set showmatch

" highlighting for search matches
set hlsearch

" case-insensitive search
set ignorecase

" press tab for command completion
set wildmenu

" keep the cursor at least 3 lines away from top or bottom of screen
set scrolloff=3

" don't wrap lines on the sides of the screen, no effect on buffer itself
set nowrap

" on new lines, use indent from preceding lines
set autoindent

" HARD TABS ONLY
" ==============
" number of spaces for autoindent (>> or << or ==)
set shiftwidth=2
" number of spaces the <Tab> character appears as
set tabstop=2

" SOFT TABS ONLY
" ==============
" <Tab> key inserts spaces instead of tab characters
" set expandtab
" number of spaces for autoindent (>> or << or ==)
" set shiftwidth=2
" determintes what happens when pressing <Tab> or  <BS>. While explandtab is on, keep
" this value equal to shiftwidth
" set softtabstop=2

" seeing invisible characters
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list

" -----------------------------------------------------------------------------
" Commands (start with colon)
" -----------------------------------------------------------------------------

" enable syntax highlighting
:syntax enable

