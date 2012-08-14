" Has this already been loaded?
if exists("loaded_custom_headers")
  finish
endif
let loaded_custom_headers=1

command! -nargs=1 InsertHeader :call s:f_InsertHeader(<f-args>)


function! s:f_InsertHeader(filename)
   let l:start_line = line(".")
   let l:header_line_count = line("$")
   let l:filename = expand(a:filename)
   call append(l:start_line-1, readfile(l:filename))

   let l:header_line_count = line("$") - l:header_line_count

   exe ":" . l:start_line
   exe ":silent .,.+" . l:header_line_count . "g/%copyright%/s/%copyright%/" .
         \ strftime("%Y") . " " . $CUSTOM_HEADERS_COPYRIGHT

   exe ":" . l:start_line
   exe ":silent .,.+" . l:header_line_count . "g/%author%/s/%author%/" .
         \ $CUSTOM_HEADERS_AUTHOR_NAME

   exe ":" . l:start_line
   exe ":silent .,.+" . l:header_line_count . "g/%date%/s/%date%/" .
         \ strftime("%d\\/%m\\/%Y")

   exe ":" . l:start_line
   exe ":silent .,.+" . l:header_line_count . "g/%filename%/s/%filename%/" .
         \ expand("%:t")

   exe ":" . l:start_line
   exe ":silent .,.+" . l:header_line_count . "g/%filename_upcase%/s/%filename_upcase%/" .
         \ toupper(expand("%:t:r"))

   exe ":" . l:start_line
   delmarks s
endfunction
