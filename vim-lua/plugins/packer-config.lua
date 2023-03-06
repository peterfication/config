-- From https://github.com/wbthomason/packer.nvim/issues/719#issuecomment-993435944
return require("packer").startup({
  function(use)
    use({ "wbthomason/packer.nvim" })
    require("plugins.init").config(use)

    if packer_bootstrap then
      require("packer").sync()
    end
  end,
  -- config = require 'packer-config'
})
