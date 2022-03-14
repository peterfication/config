" FZF
" Use ripgrep for search
" You need to install `$ brew install rigrep` for that
let $FZF_DEFAULT_COMMAND='rg --files'

" Open files
nnoremap <Leader>e :FZF<CR>
nnoremap <Leader>E :Buffers<CR>

" Go to line
nnoremap <Leader>l :Lines<CR>
nnoremap <Leader>L :BLines<CR>

" Search marks
nnoremap <Leader>m :Marks<CR>
" Search all commands
nnoremap <Leader>c :Commands<CR>
" Search tags
nnoremap <Leader>t :Tags<CR>
nnoremap <Leader>T :BTags<CR>

" Search
nnoremap <Leader>f :Rg<CR>
" Search for word under cursor in files
nnoremap <Leader>F :Rg <C-R><C-W><CR>

" File/command/search history
nnoremap <Leader>HF :History<CR>
nnoremap <Leader>HC :History:<CR>
nnoremap <Leader>HS :History/<CR>

" Git commits
" nnoremap <Leader>g :Commits<CR>
" nnoremap <Leader>G :BCommits<CR>
nnoremap <silent> <leader>GG :GFiles?<CR>
nnoremap <silent> <leader>gh :GitGutterQuickFix<CR>:FzfQFEdit<CR>
nnoremap <silent> <leader>GH :GitGutterQuickFixCurrentFile<CR>:FzfQFEdit<CR>
nmap gn <Plug>(GitGutterNextHunk)
nmap gp <Plug>(GitGutterPrevHunk)

" Snippets
nnoremap <Leader>s :Snippets<CR>

" From https://gist.github.com/davidmh/f35fba1f9cde176d1ec9b4919769653a
function! s:format_qf_line(line)
  let parts = split(a:line, ':')
  return { 'filename': parts[0]
         \,'lnum': parts[1]
         \,'col': parts[2]
         \,'text': join(parts[3:], ':')
         \ }
endfunction

function! s:qf_to_fzf(key, line) abort
  let l:filepath = expand('#' . a:line.bufnr . ':p')
  return l:filepath . ':' . a:line.lnum . ':' . a:line.col . ':' . a:line.text
endfunction

function! s:fzf_to_edit(filtered_list) abort
  let list = map(a:filtered_list, 's:format_qf_line(v:val)')
  if len(list) > 0
    execute "e +" . list[0].lnum . " " . list[0].filename
  endif
endfunction

command! FzfQFEdit call fzf#run({
      \ 'source': map(getqflist(), function('<sid>qf_to_fzf')),
      \ 'sink*':   function('<sid>fzf_to_edit'),
      \ 'window': {'width': 0.9, 'height': 0.6},
      \ 'options': ['--preview', '~/config/zsh/fzf/preview.sh {}', '--reverse', '--multi', '--prompt', 'Git hunks>'],
      \ })
