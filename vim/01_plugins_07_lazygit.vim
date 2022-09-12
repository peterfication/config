" Setup mapping to call :LazyGit
nnoremap <silent> <leader>gg :LazyGit<CR>

lua << EOF
  require("toggleterm").setup {}

--   function _G.set_terminal_keymaps()
--     local opts = {buffer = 0}
--     vim.keymap.set('t', '<C-c>', [[<Cmd>ToggleTerm<CR>]], opts)
--   end
--
-- -- if you only want these mappings for toggle term use term://*toggleterm#* instead
-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

  -- local Terminal  = require('toggleterm.terminal').Terminal
  -- local tig = Terminal:new({
  --   cmd = "tig",
  --   direction = "float",
  --   hidden = true,
  -- })
  --
  -- function _tig_toggle()
  --   tig:toggle()
  -- end
  --
  -- vim.api.nvim_set_keymap("n", "<leader>hg", "<cmd>lua _tig_toggle()<CR>", {noremap = true, silent = true})
EOF

nnoremap <Leader>hb :TermExec cmd="tig blame %; exit" direction=float<CR>
nnoremap <Leader>hh :TermExec cmd="tig %; exit" direction=float<CR>

nnoremap <Leader>gb :BlamerToggle<CR>
