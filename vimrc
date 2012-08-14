" Header {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
" }

" Environment {
   syn clear
   syntax on

   set nocompatible
   set bkc=no

   set backspace=indent,eol,start "Improve Backspace


   set ic "Ignore case on search
   set hlsearch " Highlight search strings

   set mousehide " Hide mouse when typing

   " Ui {
      "Show the current edition mode on last line, number of column and line
      set showmode
      set nu
      set ls=2
      set ruler

      set ch=2 " Make command line two lines high

      " Highlight problematic whitespace
      set list
      set listchars=tab:>.,trail:.,extends:#,nbsp:. 
      colorscheme tango-morning
   " }

   " Backup {
      set backup
      set backupdir=$HOME/tmp/backup
      set autowrite
   " }

" }

" Formatting {
   set tw=80   "wrap on 80 chars
   set nowrap

   " Set Auto-indentation
   set autoindent
   set cindent

   "Put 3 spaces when using tabulations
   set et
   set sw=3
   set ts=3
   set sts=3

   " Remove trailing whitespaces and ^M chars
	autocmd FileType c,cpp,h,js,python autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
" }

" Key mapping {
   " compilation
   map <C-K>  :make<CR>
   map \      :cl<CR>
   imap <F9>  <Esc>:cN<CR>i
   imap <F10> <Esc>:cn<CR>i

   "Macros
   map <F2>   :InsertHeader $CUSTOM_HEADERS_C_SOURCE
   map <F3>   :InsertHeader $CUSTOM_HEADERS_C_FUNCTION
   map <F4>   :InsertHeader $CUSTOM_HEADERS_C_HEADER
   map <F5>   ^i/* <C-[>$a */<C-[>
   map <F6>   ^3x$2h3x

   " folding 
   map <F9>   zA

   "buffer management
   map <M-Down>  :bn<CR>
   map <M-Up>    :bp<CR>
   map <M-Left>  :tabp<CR>
   map <M-Right> :tabn<CR>
   map <C-D>     :Bclose<CR>

" }


" Plugins {
   " NERDTree {
      let NERDTreeQuitOnOpen=1
      map <C-B>  :NERDTreeToggle<CR>
   " }

   " taglist {
      let Tlist_GainFocus_On_ToggleOpen=1
      let Tlist_Show_Menu=1
      map <C-T> :TlistToggle<CR>
   " }
" }

" Tags {
   if filereadable( expand("$PWD/tags") )
      set tags=tags
   elseif filereadable( expand("$DEVROOT/ctags.out") )
      set tags=$ROOT/ctags.out
   endif
 " }
