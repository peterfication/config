" From https://stackoverflow.com/questions/7452842/how-to-fold-to-a-specific-level-in-vim-across-an-entire-file-at-once
function! <sid>CloseFoldOpens(opens_level)
    let lineno = 2
    let last = line("$")
    while lineno < last
        if foldclosed(lineno) != -1
            let lineno = foldclosedend(lineno) + 1
        elseif foldlevel(lineno) > foldlevel(lineno - 1)
        \ && foldlevel(lineno) == a:opens_level
            execute lineno."foldclose"
            let lineno = foldclosedend(lineno) + 1
        else
            let lineno = lineno + 1
        end
    endwhile
endfunction
nnoremap <silent> z1 zR:%foldclose<cr>
nnoremap <silent> z2 zR:call <sid>CloseFoldOpens(2)<cr>
nnoremap <silent> z3 zR:call <sid>CloseFoldOpens(3)<cr>
nnoremap <silent> z4 zR:call <sid>CloseFoldOpens(4)<cr>
nnoremap <silent> z5 zR:call <sid>CloseFoldOpens(5)<cr>
