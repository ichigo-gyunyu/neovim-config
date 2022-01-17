" if !empty(expand(glob("./in")))
"     nnoremap <buffer> <leader>r :!g++ -std=c++20 -O2 -Wall -g -fsanitize=address -Dichigo_runtime -o out % && ./out < in<CR>
" else
"     nnoremap <buffer> <leader>r :!g++ -std=c++20 -O2 -Wall -g -fsanitize=address -Dichigo_runtime -o out % && ./out <CR>
" endif

nnoremap <buffer> <leader>r :TermExec cmd=make<CR>
