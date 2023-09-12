return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
      { "kyazdani42/nvim-web-devicons" },
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
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
    },
    config = function()
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")
      -- local trouble = require("trouble.providers.telescope")

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
              -- TODO: This prevents <C-x> to open a horizontal split
              -- ["<c-x>"] = trouble.open_with_trouble,
            },
            n = {
              ["d"] = actions.delete_buffer,
              ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["q"] = actions.send_selected_to_qflist + actions.open_qflist,
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

      require("neoclip").setup({
        history = 1000,
        default_register = { "+", '"', "*" },
        preview = true,
        on_paste = {
          set_reg = true,
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

      require("which-key").register({
        ["<Leader>"] = {
          e = {
            name = "Open file(s)",
            e = { builtin.find_files, "Find files with Telescope" },
            b = { ":Telescope file_browser hidden=true<CR>", "Telescope file browser" },
            h = { builtin.oldfiles, "Recent files with Telescope" },
          },

          E = {
            name = "Open buffer(s)",
            E = { builtin.buffers, "Find files of currently open buffers" },
            B = { ":Telescope file_browser path=%:p:h<CR>", "Telescope file browser for current file" },
          },

          f = {
            name = "Search",
            f = { builtin.live_grep, "Telescope live grep search (Use <C-Space> to refine the search)" },
            w = {
              ":lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<CR>",
              "Open input to search for word with Telescope",
            },
          },

          F = { builtin.grep_string, "Find word under cursor with Telescope" },

          H = { builtin.pickers, "Telescope history" },
          ["/"] = { builtin.pickers, "Search history with Telescope" },

          l = { builtin.current_buffer_fuzzy_find, "Select lines of current buffer with Telescope" },

          ["?"] = { builtin.help_tags, "Search Vim help tags with Telescope" },

          d = { builtin.diagnostics, "Diagnostics of project with Telescope" },
          D = { ":Telescope diagnostics bufnr=0<CR>", "Diagnostics of current buffer with Telescope" },

          m = { builtin.marks, "Open marks in Telescope" },
          j = { builtin.jumplist, "Open jumplist in Telescope" },

          c = {
            name = "Commands",
            c = { builtin.commands, "Open commands in Telescope" },
            h = { builtin.command_history, "Open command history in Telescope" },
          },

          C = { builtin.builtin, "Open builtin Telescope actions in Telescope" },

          q = {
            name = "Quickfix",
            q = { ":Telescope quickfix<CR>", "Open quickfix list in Telescope" },
            h = { ":Telescope quickfixhistory<CR>", "Open quickfix history in Telescope" },
          },

          o = {
            name = "Octo / Github",
            i = { ":Telescope gh issues<CR>", "Open Github issues in Telescope ([o]cto [i]ssues)" },
            p = { ":Telescope gh pull_request<CR>", "Open Github pull requests in Telescope ([o]cto [p]ull requests)" },
          },

          g = {
            name = "Git",
            s = { git_hunks, "Open Git status hunks in Telescope" },
            c = { builtin.git_commits, "Open Git commits in Telescope (<C-d> opens DiffView)" },
          },
          G = {
            name = "Git 2",
            S = { builtin.git_status, "Open Git status files in Telescope" },
            C = { builtin.git_bcommits, "Open current buffer Git commits in Telescope (<C-d> opens DiffView)" },
          },

          p = { ":Telescope neoclip<CR>", "Open neoclip (clipboard) in Telescope" },
        },
      })

      -- vim.keymap.set('n', '<Leader>Z', builtin.current_buffer_tags, {})
      -- vim.keymap.set('n', '<Leader>Z', builtin.treesitter, {})
    end,
  },
}
