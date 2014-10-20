" -----------------------------------------------------------------------------
" Vundle (plugin management)
" -----------------------------------------------------------------------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'

" Color scheme
Plugin 'aoberoi/base16-vim'

" My Plugins here:
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'AndrewRadev/switch.vim'
Plugin 'matchit.zip'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'leafgarland/typescript-vim'
Plugin 'godlygeek/tabular'
" Plugin 'suan/vim-instant-markdown' " Doesn't seem stable enough

" All of your Plugins must be added before the following line
call vundle#end()           " required
filetype plugin indent on   " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" -----------------------------------------------------------------------------
" Settings (things that start with set and can be in single-quotes)
" -----------------------------------------------------------------------------

" turn on line numbering
set number

" turn on (line, column) 00% display in status bar
set ruler

" set text encoding
set encoding=utf-8

" show matching bracket or parenthesis when cursor is over one
set showmatch

" show command
set showcmd

" highlighting for search matches
set hlsearch

" case-insensitive search, unless i use captials and then it matters
set ignorecase
set smartcase

" press tab for command completion
set wildmenu

" always show the status line
set laststatus=2

" keep the cursor at least 3 lines away from top or bottom of screen
set scrolloff=3

" don't wrap lines on the sides of the screen, no effect on buffer itself
" set nowrap

" wrap a specific selection by visually selecting it and then hitting gq
set wrap
set textwidth=100
"
" don't autowrap text while in insert mode, don't do it for comments
" ** this does not take effect when a filetype plugin overrides these formatoptions
set formatoptions-=t
set formatoptions-=c
set formatoptions-=o
" allow gq, continue comments on next line if you press <Enter>, don't break a
" line after a 1-letter word
set formatoptions+=q
set formatoptions+=r
set formatoptions+=1

" on new lines, use indent from preceding lines, be smart about inc/dec with { or }
set smartindent
set autoindent

" when splitting with :sp or :vsp, put the new window below or right
"set splitbelow
"set splitright

" HARD TABS ONLY
" ==============
" number of spaces for autoindent (>> or << or ==)
" set shiftwidth=2
" number of spaces the <Tab> character appears as
" set tabstop=2

" SOFT TABS ONLY
" ==============
" <Tab> key inserts spaces instead of tab characters
set expandtab
" number of spaces for autoindent (>> or << or ==)
set shiftwidth=2
" determintes what happens when pressing <Tab> or  <BS>. While explandtab is on, keep
" this value equal to shiftwidth
set softtabstop=2

" Soft tabs for coffeescript
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 softtabstop=2 expandtab

" seeing invisible characters
set listchars=eol:¬,tab:▸\ ,trail:~,extends:>,precedes:<
set list

" -----------------------------------------------------------------------------
" Commands (start with colon)
" -----------------------------------------------------------------------------

" enable syntax highlighting
:syntax enable

" enable filetype detection
:filetype on
" enable loading the plugin files for specific file types (loads ftplugin.vim on rtp)
" (required by vundle)
:filetype plugin on
" enable loading the indent file for specific file types (loads indent.vim on rtp)
" (required by vundle)
:filetype indent on

" ------------------------------------------------------------------------------
" Variables (start with let)
" ------------------------------------------------------------------------------

let g:netrw_preview=1
let g:netrw_liststyle=3
let g:netrw_winsize=20
"let g:netrw_alto=nosb
"let g:netrw_altv=nospr

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn)$'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
" let g:ctrlp_user_command = 'find %s -type f'
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

let g:user_zen_settings = {
\   'html' : {
\     'default_attributes' : {
\       'script:tb' : [{'type': 'text/javascript'}, {'src': 'http://static.opentok.com/v1.1/js/TB.min.js'}],
\       'script:tb:s' : [{'type': 'text/javascript'}, {'src': 'https://swww.tokbox.com/v1.1/js/TB.min.js'}],
\       'script:tbrtc' : [{'type': 'text/javascript'}, {'src': 'http://static.opentok.com/webrtc/v2.0/js/TB.min.js'}],
\       'script:tbrtc:s' : [{'type': 'text/javascript'}, {'src': 'https://swww.tokbox.com/webrtc/v2.0/js/TB.min.js'}]
\     }
\   }
\}

" ------------------------------------------------------------------------------
" Custom functions
" ------------------------------------------------------------------------------

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d sts=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &softtabstop, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction

" ------------------------------------------------------------------------------
" Key mappings
" ------------------------------------------------------------------------------
" make window movement easier
" map <C-h> <C-w>h
" map <C-j> <C-w>j
" map <C-r> <C-w>k
" map <C-l> <C-w>l

" map leader
let mapleader=","

" insert modeline
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" switch.vim
nnoremap - :Switch<cr> 
