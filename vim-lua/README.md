# Neovim config in Lua

[Neovim Lua guide](https://github.com/nanotee/nvim-lua-guide)

## Set up lua files for Neovim to find them

```bash
ln -s ln -s ~/config/vim-lua .config/nvim/lua
```

## Features

- Jump between windows with `<Leader>W`
- Select register history with `<Leader>p`
- Telescope
  - Open files with `<Leader>e`
  - Switch current buffers with `<Leader>E` and close open buffers with `<C-d>`
  - Open recently opened files with `<Leader>he`
  - Run commands with `<Leader>c`
  - Run Telescope lists with `<Leader>C`
  - Run recently run commands with `<Leader>hc`
  - Search with `<Leader>f`
  - Search for word under the cursor with `<Leader>F`
  - Show search history with `<Leader>hf`
- LSP features
  - Format the current buffer with `<Leader>P`
  - List code actions with `<Leader>a`
- Git
  - Open Lazygit with `<Leader>gg`
  - Toggle blame line with `<Leader>gb`
  - Open Diffview for the current file with `<Leader>GG`
  - Open Tig blame with `<Leader>GB`
  - Jump to next and previous Git hunk with `ghn` and `ghp`
  - Switch between dirty Git files with `<Leader>gs`
- Set uppercase marks (e.g. `mA`) and jump between them via Telescope with `<Leader>m`
- Quickfix

## Nice Neovim plugins that I don't need at the moment

- https://github.com/nvim-neorg/neorg
- https://github.com/dhruvasagar/vim-zoom
- https://github.com/liuchengxu/vista.vim
- https://github.com/lewis6991/impatient.nvim
- https://github.com/dstein64/vim-startuptime
- https://github.com/NTBBloodbath/doom-nvim
- https://github.com/NTBBloodbath/cheovim
- https://github.com/norcalli/nvim-colorizer.lua
- https://github.com/ziontee113/syntax-tree-surfer

## (Neo)vim learning resources

- https://github.com/mhinz/vim-galore
- [Vhyrro - Understanding Neovim](https://www.youtube.com/watch?v=87AXw9Quy9U&list=PLx2ksyallYzW4WNYHD9xOFrPRYGlntAft&index=2)
