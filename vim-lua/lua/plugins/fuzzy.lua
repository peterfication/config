return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
      { "kyazdani42/nvim-web-devicons" },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      { "AckslD/nvim-neoclip.lua" },
      { "nvim-telescope/telescope-file-browser.nvim" },
      { "peterfication/telescope-github.nvim" },
      { "folke/which-key.nvim" },
      -- { 'ptethng/telescope-makefile' },
      --
      --
      { "stevearc/aerial.nvim" },
      { "L3MON4D3/LuaSnip" },
      { "benfowler/telescope-luasnip.nvim" },
      { "s1n7ax/nvim-window-picker" },
      {'nvim-telescope/telescope-ui-select.nvim' },
    },
    config = function()
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")
      -- local trouble = require("trouble.providers.telescope")
      local action_window_picker = function(prompt_bufnr)
        local picker = require("window-picker")
        local winid = picker.pick_window()
        if winid then
          local entry = require("telescope.actions.state").get_selected_entry()
          if entry and entry.filename then
            vim.api.nvim_set_current_win(winid)
            vim.cmd("edit " .. entry.filename)
          end
        end
      end

      require("telescope").setup({
        defaults = {
          cache_picker = {
            num_pickers = 100,
          },
          mappings = {
            i = {
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
              ["<C-d>"] = actions.delete_buffer,
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,
              ["<C-w>"] = action_window_picker,
              -- TODO: This prevents <C-x> to open a horizontal split
              -- ["<c-x>"] = trouble.open_with_trouble,
            },
            n = {
              ["d"] = actions.delete_buffer,
              ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["q"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["w"] = action_window_picker,
              -- TODO: This prevents <C-x> to open a horizontal split
              -- ["<c-x>"] = trouble.open_with_trouble,
            },
          },
          preview = {
            -- From https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#use-terminal-image-viewer-to-preview-images
            mime_hook = function(filepath, bufnr, opts)
              local is_image = function(img_filepath)
                local image_extensions = { "png", "jpg" } -- Supported image formats
                local split_path = vim.split(img_filepath:lower(), ".", { plain = true })
                local extension = split_path[#split_path]
                return vim.tbl_contains(image_extensions, extension)
              end

              if is_image(filepath) then
                local term = vim.api.nvim_open_term(bufnr, {})
                local function send_output(_, data, _)
                  for _, d in ipairs(data) do
                    vim.api.nvim_chan_send(term, d .. "\r\n")
                  end
                end
                vim.fn.jobstart({
                  "catimg",
                  -- "viu",
                  filepath, -- Terminal image viewer command
                }, { on_stdout = send_output, stdout_buffered = true, pty = true })
              else
                require("telescope.previewers.utils").set_preview_message(
                  bufnr,
                  opts.winid,
                  "Binary cannot be previewed"
                )
              end
            end,
          },
        },
        pickers = {
          git_commits = {
            mappings = {
              i = {
                ["<C-d>"] = function()
                  -- Open in diffview
                  local selected_entry = action_state.get_selected_entry()
                  local value = selected_entry.value
                  -- close Telescope window properly prior to switching windows
                  vim.api.nvim_win_close(0, true)
                  vim.cmd("stopinsert")
                  vim.schedule(function()
                    vim.cmd(("DiffviewOpen %s^!"):format(value))
                  end)
                end,
              },
            },
          },
        },
      })

      require("telescope").load_extension("aerial")
      require("telescope").load_extension("file_browser")
      -- require("telescope").load_extension("fzf")
      require("telescope").load_extension("gh")
      require("telescope").load_extension("luasnip")
      require("telescope").load_extension("neoclip")
      require("telescope").load_extension("ui-select")

      local function visual_paste(opts)
        local handlers = require("neoclip.handlers")
        handlers.set_registers({ "z" }, opts.entry)
        vim.api.nvim_feedkeys('gv"zp', "n", false)
      end

      require("neoclip").setup({
        history = 1000,
        default_register = { "+", '"', "*" },
        preview = true,
        on_paste = {
          set_reg = true,
        },
        keys = {
          telescope = {
            n = {
              custom = {
                ["v"] = visual_paste,
              },
            },
            i = {
              custom = {
                ["<c-v>"] = visual_paste,
              },
            },
          },
        },
      })

      local builtin = require("telescope.builtin")

      local git_hunks = function()
        require("telescope.pickers")
          .new({
            finder = require("telescope.finders").new_oneshot_job({ "git", "jump", "--stdout", "diff" }, {
              entry_maker = function(line)
                local filename, lnum_string = line:match("([^:]+):(%d+).*")

                -- I couldn't find a way to use grep in new_oneshot_job so we have to filter here
                -- return nil if filename is /dev/null because this means the file was deleted
                if filename:match("^/dev/null") then
                  return nil
                end

                return {
                  value = filename,
                  display = line,
                  ordinal = line,
                  filename = filename,
                  lnum = tonumber(lnum_string),
                }
              end,
            }),
            sorter = require("telescope.sorters").get_generic_fuzzy_sorter(),
            previewer = require("telescope.config").values.grep_previewer({}),
            results_title = "Git hunks",
            prompt_title = "Git hunks",
            layout_strategy = "flex",
          }, {})
          :find()
      end

      require("which-key").add({
        { "<Leader>e", group = "Open file(s)" },
        { "<Leader>eb", ":Telescope file_browser hidden=true<CR>", desc = "Telescope file browser" },
        { "<Leader>eo", ":Oil<CR>", desc = "Oil file browser" },
        { "<Leader>ee", builtin.find_files, desc = "Find files with Telescope" },
        { "<Leader>eg", builtin.git_files, desc = "Find Git ls-files with Telescope" },
        { "<Leader>eh", builtin.oldfiles, desc = "Recent files with Telescope" },

        { "<Leader>E", group = "Open buffer(s)" },
        { "<Leader>EB", ":Telescope file_browser path=%:p:h<CR>", desc = "Telescope file browser for current file" },
        { "<Leader>EE", builtin.buffers, desc = "Find files of currently open buffers" },

        { "<Leader>f", group = "Search" },
        { "<Leader>ff", builtin.live_grep, desc = "Telescope live grep search (Use <C-Space> to refine the search)" },
        {
          "<Leader>ft",
          ":lua require('telescope.builtin').grep_string({ search = 'TODO:' })<CR>",
          desc = "List all TODO: comments in Telescope",
        },
        {
          "<Leader>fw",
          ":lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<CR>",
          desc = "Open input to search for word with Telescope",
        },

        { "<Leader>F", builtin.grep_string, desc = "Find word under cursor with Telescope" },

        { "<Leader>H", builtin.pickers, desc = "Telescope history" },
        { "<Leader>/", builtin.pickers, desc = "Search history with Telescope" },

        { "<Leader>l", builtin.current_buffer_fuzzy_find, desc = "Select lines of current buffer with Telescope" },

        { "<Leader>?", builtin.help_tags, desc = "Search Vim help tags with Telescope" },

        { "<Leader>dE", builtin.diagnostics, desc = "Diagnostics of project with Telescope" },
        { "<Leader>de", ":Telescope diagnostics bufnr=0<CR>", desc = "Diagnostics of current buffer with Telescope" },
        { "<Leader>xE", builtin.diagnostics, desc = "Diagnostics of project with Telescope" },
        { "<Leader>xe", ":Telescope diagnostics bufnr=0<CR>", desc = "Diagnostics of current buffer with Telescope" },

        { "<Leader>m", builtin.marks, desc = "Open marks in Telescope" },
        { "<Leader>j", builtin.jumplist, desc = "Open jumplist in Telescope" },

        { "<Leader>c", group = "Commands" },
        { "<Leader>cc", builtin.commands, desc = "Open commands in Telescope" },
        { "<Leader>ch", builtin.command_history, desc = "Open command history in Telescope" },

        { "<Leader>C", builtin.builtin, desc = "Open builtin Telescope actions in Telescope" },

        { "<Leader>qh", ":Telescope quickfixhistory<CR>", desc = "Open quickfix history in Telescope" },
        { "<Leader>qq", ":Telescope quickfix<CR>", desc = "Open quickfix list in Telescope" },

        { "<Leader>g", group = "Git" },
        { "<Leader>gc", builtin.git_commits, desc = "Open Git commits in Telescope (<C-d> opens DiffView)" },
        { "<Leader>gs", git_hunks, desc = "Open Git status hunks in Telescope" },

        { "<Leader>G", group = "Git 2" },
        {
          "<Leader>GC",
          builtin.git_bcommits,
          desc = "Open current buffer Git commits in Telescope (<C-d> opens DiffView)",
        },
        { "<Leader>GS", builtin.git_status, desc = "Open Git status files in Telescope" },

        { "<Leader>o", group = "Octo / Github" },
        { "<Leader>oi", ":Telescope gh issues<CR>", desc = "Open Github issues in Telescope ([o]cto [i]ssues)" },
        {
          "<Leader>op",
          ":Telescope gh pull_request<CR>",
          desc = "Open Github pull requests in Telescope ([o]cto [p]ull requests)",
        },

        { "<Leader>p", ":Telescope neoclip<CR>", desc = "Open neoclip (clipboard) in Telescope" },

        { "<Leader>p", ":Telescope neoclip<CR>", desc = "Open neoclip (clipboard) in Telescope", mode = "v" },

        { "<Leader>ZZ", builtin.treesitter, desc = "Open Treesitter in Telescope" },
        { "<Leader>ZT", builtin.current_buffer_tags, desc = "Open current buffer tags in Telescope" },
      })
    end,
  },
}
