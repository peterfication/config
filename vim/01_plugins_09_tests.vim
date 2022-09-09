nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
" nmap <silent> <leader>a :TestSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
" nmap <silent> <leader>g :TestVisit<CR>

let test#strategy = "vimux"

let test#ruby#rspec#options = {
  \ 'file':    '--format documentation --require ~/config/vim/ruby/quickfix_formatter.rb --format QuickfixFormatter --out quickfix.out',
  \ 'suite':    '--format progress --require ~/config/vim/ruby/quickfix_formatter.rb --format QuickfixFormatter --out quickfix.out',
\}
