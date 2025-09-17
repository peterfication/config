return {
  -- Check out https://github.com/Exafunction/codeium.nvim

  -- { "github/copilot.vim" },
  -- {
  --   "David-Kunz/gen.nvim",
  --   opts = {
  --     -- model = "mistral",
  --     -- model = "deepseek-coder:6.7b",
  --     model = "deepseek-coder:6.7b-instruct-q4_K_M",
  --     display_mode = "split", -- Can be "float" or "split".
  --   },
  -- },
  -- {
  --   'huggingface/llm.nvim',
  --   opts = {
  --     tokens_to_clear = { "<EOT>" },
  --     fim = {
  --       enabled = true,
  --       prefix = "<PRE> ",
  --       middle = " <MID>",
  --       suffix = " <SUF>",
  --     },
  --     model = "http://localhost:11434/api/generate",
  --     context_window = 4096,
  --     tokenizer = {
  --       repository = "codellama/CodeLlama-7b-hf",
  --     },
  --     adaptor = "ollama",
  --     request_body = { model = "codellama:7b-code" },
  --   },
  -- },
  -- https://github.com/gsuuon/model.nvim
  -- https://github.com/fauxpilot/fauxpilot
  -- https://github.com/fauxpilot/fauxpilot/issues/53
  -- https://github.com/rjmacarthy/twinny
  -- https://github.com/freckletonj/uniteai
  -- {
  --   'tzachar/cmp-ai',
  --   dependencies = 'nvim-lua/plenary.nvim',
  --   config = function()
  --     require('cmp_ai.config'):setup({
  --       max_lines = 100,
  --       provider = 'Ollama',
  --       provider_options = {
  --         model = 'codellama:7b-code',
  --       },
  --       notify = true,
  --       notify_callback = function(msg)
  --         vim.notify(msg)
  --       end,
  --       run_on_every_keystroke = true,
  --       ignored_file_types = {
  --         -- default is not to ignore
  --         -- uncomment to ignore in lua:
  --         -- lua = true
  --       },
  --     })
  --   end,
  -- },
  -- {
  --   "nomnivore/ollama.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },

  --   -- All the user commands added by the plugin
  --   cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },

  --   keys = {
  --     -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
  --     {
  --       "<leader>oo",
  --       ":<c-u>lua require('ollama').prompt()<cr>",
  --       desc = "ollama prompt",
  --       mode = { "n", "v" },
  --     },

  --     -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
  --     {
  --       "<leader>oG",
  --       ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
  --       desc = "ollama Generate Code",
  --       mode = { "n", "v" },
  --     },
  --   },
  -- },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = false,
        },
        panel = {
          enabled = false,
        },
      })
    end,
  },

  {
    "zbirenbaum/copilot-cmp",
    dependencies = {
      "zbirenbaum/copilot.lua",
    },
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
      "folke/which-key.nvim",
    },
    config = function()
      require("CopilotChat").setup({
        window = {
          layout = "float", -- 'vertical', 'horizontal', 'float'
          border = "double", -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
          width = 0.9,
          height = 0.8,
        },
      })

      require("which-key").add({
        { "<Leader>v", group = "chatgpt" },
        { "<Leader>vv", ":CopilotChatToggle<CR>", desc = "Toggle CopilotChat" },
        { "<Leader>vn", ":CopilotChatReset<CR>:CopilotChatOpen<CR>", desc = "Open CopilotChat with a new session" },
      })
    end,
  },

  -- {
  --   "jackMort/ChatGPT.nvim",
  --   config = function()
  --     require("legendary").command({
  --       ":ChatGPTInit",
  --       function()
  --         require("chatgpt").setup({
  --           api_key_cmd = "op read op://Freelancing/6ej4zcr22njqjyjfwcofva7sru/api_key",
  --           keymaps = {
  --             close = { "<C-c>" },
  --             submit = "<C-g>",
  --             yank_last = "<C-y>",
  --             yank_last_code = "<C-k>",
  --             scroll_up = "<C-u>",
  --             scroll_down = "<C-d>",
  --             toggle_settings = "<C-o>",
  --             new_session = "<C-n>",
  --             cycle_windows = "<Tab>",
  --             -- in the Sessions pane
  --             select_session = "<Space>",
  --             rename_session = "r",
  --             delete_session = "d",
  --           },
  --         })
  --       end,
  --       description = "Initialize ChatGPT",
  --     })
  --   end,
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --     "mrjones2014/legendary.nvim",
  --   },
  -- },
}
