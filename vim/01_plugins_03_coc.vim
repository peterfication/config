" CoC - Conquer of Completion

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>"

"\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Run ESLint auto fix.
" This keymapping is similar to running Prettier with <Leader>p
nnoremap <Leader>P :CocCommand eslint.executeAutofix<CR>

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Fill the quicklist from COC errors
" nnoremap <Leader>c :CocDiagnostics<CR>

" Open the CoC sources in an FZF view
nnoremap <silent> <space>CD :<C-u>CocFzfList diagnostics --current-buf<CR>
nnoremap <silent> <space>Cd :<C-u>CocFzfList diagnostics<CR>
nnoremap <silent> <space>CC :<C-u>CocFzfList commands<CR>
nnoremap <silent> <space>CS :<C-u>CocFzfList symbols<CR>
nnoremap <silent> <space>CL :<C-u>CocFzfList location<CR>
nnoremap <silent> <space>CA :<C-u>CocFzfList actions<CR>

" Somehow I can't get this to work :/
" This needs UniversalCtags to be installed
" brew install --HEAD universal-ctags/universal-ctags/universal-ctags
nnoremap <silent> <space>CO :<C-u>CocFzfList outline<CR>

" coc-spell-checker
" https://github.com/iamcco/coc-spell-checker
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>iw :CocCommand cSpell.addIgnoreWordToUser <C-R><C-W>
vmap <leader>iw :CocCommand cSpell.addIgnoreWordToUser <C-R><C-W>
