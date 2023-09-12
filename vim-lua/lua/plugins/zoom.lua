if true then return {} end

return {
  {
    "nyngwang/NeoZoom.lua",
    dependencies = {
      "nyngwang/NeoNoName.lua", -- you will need this if you want to use the keymap sample below.
    },
    config = function()
      require("neo-zoom").setup({
        left_ratio = 0.03,
        top_ratio = 0.03,
        width_ratio = 0.9,
        height_ratio = 0.9,
        -- border = 'double',
        -- exclude_filetype = {
        --   'fzf', 'qf', 'dashboard'
        -- }
        -- scrolloff_on_zoom = 13, -- offset to the top-border.
      })
      local NOREF_NOERR_TRUNC = { silent = true, nowait = true }
      vim.keymap.set("n", "<CR>", require("neo-zoom").neo_zoom, NOREF_NOERR_TRUNC)

      -- My setup (This requires NeoNoName.lua, and optionally NeoWell.lua)
      local cur_buf = nil
      vim.keymap.set("n", "<CR>", function()
        if require("neo-zoom").FLOAT_WIN ~= nil and vim.api.nvim_win_is_valid(require("neo-zoom").FLOAT_WIN) then
          vim.cmd("NeoZoomToggle")
          vim.api.nvim_set_current_buf(cur_buf)
          return
        end
        -- don't zoom-in on floating win.
        if vim.api.nvim_win_get_config(0).relative ~= "" then
          return
        end
        cur_buf = vim.api.nvim_get_current_buf()
        vim.cmd("NeoZoomToggle")
        vim.cmd("wincmd p")
        local try_get_no_name = require("neo-no-name").get_current_or_first_valid_listed_no_name_buf()
        if try_get_no_name ~= nil then
          vim.api.nvim_set_current_buf(try_get_no_name)
        else
          vim.cmd("NeoNoName")
        end
        vim.cmd("wincmd p")
        -- Post pop-up commands
        -- vim.cmd('NeoWellJump')
      end, NOREF_NOERR_TRUNC)
    end,
  }
}
