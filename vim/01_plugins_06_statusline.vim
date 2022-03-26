let g:airline_powerline_fonts = 1

let g:airline_theme='molokai'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#tab_nr_type = 1 " tab number

lua << EOF
require("bufferline").setup{
  options = {
    offsets = {
      {
          filetype = "nerdtree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "left"
      }
    }
  }
}
EOF
