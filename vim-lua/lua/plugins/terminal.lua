return {
  {
    "akinsho/toggleterm.nvim",
    dependencies = {
      "folke/which-key.nvim",
    },
    config = function()
      require("toggleterm").setup({
        auto_scroll = false,
        open_mapping = [[<c-t>]],
        direction = "float",
        on_open = function(term)
          vim.cmd("startinsert!")
        end,
      })

      local function open_new_terminal()
        local terms = require("toggleterm.terminal").get_all(true)
        local next_index = #terms + 1
        require("toggleterm").toggle(next_index)
      end

      require("which-key").add({
        { "<Leader>gd", ':8TermExec cmd="lazydocker; exit" direction=float<CR>', desc = "Open lazydocker" },
        { "<Leader>t1", "<CMD>ToggleTerm 1<CR>", desc = "Open terminal 1" },
        { "<Leader>t2", "<CMD>ToggleTerm 2<CR>", desc = "Open terminal 2" },
        { "<Leader>t3", "<CMD>ToggleTerm 3<CR>", desc = "Open terminal 3" },
        { "<Leader>t4", "<CMD>ToggleTerm 4<CR>", desc = "Open terminal 4" },
        { "<Leader>t5", "<CMD>ToggleTerm 5<CR>", desc = "Open terminal 5" },
        { "<Leader>t6", "<CMD>ToggleTerm 6<CR>", desc = "Open terminal 6" },
        { "<Leader>t7", "<CMD>ToggleTerm 7<CR>", desc = "Open terminal 7" },
        { "<Leader>t8", "<CMD>ToggleTerm 8<CR>", desc = "Open terminal 8" },
        { "<Leader>t9", "<CMD>ToggleTerm 9<CR>", desc = "Open terminal 9" },
        { "<Leader>te", "<CMD>TermSelect<CR>", desc = "Select terminal to show" },
        { "<Leader>tn", open_new_terminal, desc = "Open a new terminal" },
      })

      require("which-key").add({
        -- NOTE: <Leader><ESC> would be a nice mapping but this will mess with spaces that
        -- that you want to enter.
        { "<C-Space>", [[<C-\><C-n>]], desc = "In terminal, go from INSERT to NORMAL mode", mode = "t" },
      })

      -- The prev/next functionality is taken from https://github.com/akinsho/toggleterm.nvim/issues/522
      local function get_term_index(current_id)
        vim.print("get term index current_id: " .. current_id)
        local terms = require("toggleterm.terminal").get_all(true)
        local idx

        for i, v in ipairs(terms) do
          if v.id == current_id then
            idx = i
          end
        end

        vim.print("get term index current_id: " .. current_id .. " term index: " .. idx)
        return idx
      end

      -- local function go_prev_term()
      --   local current_id = vim.b.toggle_number
      --   if current_id == nil then
      --     return
      --   end

      --   local terms = require("toggleterm.terminal").get_all(true)
      --   local prev_index

      --   local index = get_term_index(current_id, terms)
      --   if index > 1 then
      --     prev_index = index - 1
      --   else
      --     prev_index = #terms
      --   end
      --   require("toggleterm").toggle(index)
      --   require("toggleterm").toggle(prev_index)
      -- end

      local function go_next_term()
        local current_id = vim.b.toggle_number
        if current_id == nil then
          return
        end

        local terms = require("toggleterm.terminal").get_all(true)
        local next_index

        local index = get_term_index(current_id)
        if index == #terms then
          next_index = 1
        else
          next_index = index + 1
        end
        vim.print("length: " .. #terms .. " current index: " .. index .. " next index: " .. next_index)
        -- Only toggle if index and next_index are different
        if index ~= next_index then
          require("toggleterm").toggle(index)
          require("toggleterm").toggle(next_index)
        end
      end

      -- vim.keymap.set({ "n", "i", "t" }, "<C-5>", function()
      --   go_prev_term()
      -- end, { desc = "Toggle term previous" })
      vim.keymap.set({ "n", "i", "t" }, "<C-k>", function()
        go_next_term()
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("i", true, false, true), "x!", true)
      end, { desc = "Toggle term next" })
    end,
  },
}
