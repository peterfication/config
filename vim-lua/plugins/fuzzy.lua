return function(use)
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
      { "kyazdani42/nvim-web-devicons" },
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      { "AckslD/nvim-neoclip.lua" },
      { "nvim-telescope/telescope-file-browser.nvim" },
      { "peterfication/telescope-github.nvim" },
      -- { 'ptethng/telescope-makefile' },
    },
    config = function()
      local actions = require("telescope.actions")
      local trouble = require("trouble.providers.telescope")

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
              ["<c-x>"] = trouble.open_with_trouble,
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,
            },
            n = {
              ["d"] = actions.delete_buffer,
              ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["q"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<c-x>"] = trouble.open_with_trouble,
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
      })

      require("telescope").load_extension("aerial")
      require("telescope").load_extension("file_browser")
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("gh")
      require("telescope").load_extension("luasnip")
      require("telescope").load_extension("neoclip")

      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<Leader>ee", builtin.find_files, {})
      vim.keymap.set("n", "<Leader>eb", ":Telescope file_browser hidden=true<CR>", {})
      vim.keymap.set("n", "<Leader>eh", builtin.oldfiles, {})
      vim.keymap.set("n", "<Leader>EE", builtin.buffers, {})
      vim.keymap.set("n", "<Leader>EB", ":Telescope file_browser path=%:p:h<CR>", {})

      -- Use <C-Space> to refine the search
      vim.keymap.set("n", "<Leader>ff", builtin.live_grep, {})
      vim.keymap.set(
        "n",
        "<Leader>fw",
        ":lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<CR>",
        {}
      )
      vim.keymap.set("n", "<Leader>F", builtin.grep_string, {})

      vim.keymap.set("n", "<Leader>H", builtin.pickers, {})
      vim.keymap.set("n", "<Leader>/", builtin.search_history, {})

      vim.keymap.set("n", "<Leader>l", builtin.current_buffer_fuzzy_find, {})

      vim.keymap.set("n", "<Leader>?", builtin.help_tags, {})
      -- vim.keymap.set('n', '<Leader>Z', builtin.current_buffer_tags, {})
      -- vim.keymap.set('n', '<Leader>Z', builtin.treesitter, {})
      vim.keymap.set("n", "<Leader>d", builtin.diagnostics, {})
      vim.keymap.set("n", "<Leader>D", ":Telescope diagnostics bufnr=0<CR>", {})

      vim.keymap.set("n", "<Leader>m", builtin.marks, {})
      vim.keymap.set("n", "<Leader>j", builtin.jumplist, {})

      vim.keymap.set("n", "<Leader>cc", builtin.commands, {})
      vim.keymap.set("n", "<Leader>ch", builtin.command_history, {})
      vim.keymap.set("n", "<Leader>C", builtin.builtin, {})

      vim.keymap.set("n", "<Leader>qq", ":Telescope quickfix<CR>", {})
      vim.keymap.set("n", "<Leader>qh", ":Telescope quickfixhistory<CR>", {})

      vim.keymap.set("n", "<Leader>oi", ":Telescope gh issues<CR>", {})
      vim.keymap.set("n", "<Leader>op", ":Telescope gh pull_request<CR>", {})

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

      vim.keymap.set("n", "<Leader>GS", builtin.git_status, {})
      vim.keymap.set("n", "<Leader>gs", git_hunks, {})

      require("neoclip").setup({
        history = 1000,
        default_register = { "+", '"', "*" },
        preview = true,
        on_paste = {
          set_reg = true,
        },
      })
      vim.keymap.set("n", "<Leader>p", ":Telescope neoclip<CR> ", {})

      -- require('telescope-makefile').setup({})
      -- vim.keymap.set('n', '<Leader>R', ':Telescope make<CR>', {})
      -- require("telescope").load_extension("make")
    end,
  })
end
