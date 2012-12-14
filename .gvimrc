colorscheme base16-tomorrow
set background=dark
set linespace=2
set antialias

" Don't beep
set visualbell

" Start without the toolbar
set guioptions-=T

if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert
  set guifont=Source\ Code\ Pro:h14
elseif has("gui_gnome")
  set guifont=Ubuntu\ Mono\ 14
end

