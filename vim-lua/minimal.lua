-- nvim -u ~/config/vim-lua/minimal.lua
local on_windows = vim.loop.os_uname().version:match("Windows")

local function join_paths(...)
  local path_sep = on_windows and "\\" or "/"
  local result = table.concat({ ... }, path_sep)
  return result
end

vim.cmd([[set runtimepath=$VIMRUNTIME]])
local temp_dir = vim.loop.os_getenv("TEMP") or "/tmp"

vim.cmd("set packpath=" .. join_paths(temp_dir, "nvim", "site"))

local package_root = join_paths(temp_dir, "nvim", "site", "pack")
local install_path = join_paths(package_root, "packer", "start", "packer.nvim")
local compile_path = join_paths(install_path, "plugin", "packer_compiled.lua")

require("packer").startup({
  function(use)
    use({ "wbthomason/packer.nvim" })
    use({
      "nvim-treesitter/nvim-treesitter",
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = { "ruby" },
          highlight = {
            enable = true,
          },
        })
      end,
    })
    use({
      "neovim/nvim-lspconfig",
      config = function()
        local nvim_lsp = require("lspconfig")
        nvim_lsp.solargraph.setup({})
      end,
    })
    use({
      "tinted-theming/base16-vim",
      config = function()
        vim.o.termguicolors = true

        vim.cmd("colorscheme base16-solarized-dark")
      end,
    })
  end,
  config = {
    package_root = package_root,
    compile_path = compile_path,
  },
})

vim.o.termguicolors = true
