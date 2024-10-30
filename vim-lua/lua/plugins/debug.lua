return {
  {
    "mfussenegger/nvim-dap",
    requires = {
      "folke/which-key.nvim",
    },
    config = function()
      require("dap").adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = { os.getenv("HOME") .. "/.local/bin/js-debug/src/dapDebugServer.js", "${port}" },
        },
      }

      require("dap").configurations.typescript = {
        {
          name = "launch-ts-node",
          type = "pwa-node",
          request = "launch",
          runtimeArgs = { "-r", "./node_modules/ts-node/register" },
          runtimeExecutable = "node",
          args = { "--inspect", "${file}" },
          skipFiles = { "node_modules/**" },
          console = "integratedTerminal",
          cwd = "${workspaceFolder}",
        },
        {
          name = "launch-ts-jest",
          type = "pwa-node",
          request = "launch",
          runtimeExecutable = "node",
          runtimeArgs = { "./node_modules/.bin/jest" },
          args = { "--inspect", "${file}" },
          skipFiles = { "node_modules/**" },
          console = "integratedTerminal",
          rootPath = "${workspaceFolder}",
          cwd = "${workspaceFolder}",
        },
      }

      require("which-key").add({
        { "<Leader>d", group = "Diagnostics" },
        { "<Leader>db", ":DapToggleBreakpoint<CR>", desc = "Toggle DAP breakpoint" },
        { "<Leader>dn", ":DapNew launch-ts-node<CR>", desc = "Start DAP debugging session" },

        {
          "<leader>dc",
          function()
            require("dap").continue()
          end,
          desc = "Continue",
        },
        {
          "<leader>dC",
          function()
            require("dap").run_to_cursor()
          end,
          desc = "Run to Cursor",
        },
        {
          "<leader>dg",
          function()
            require("dap").goto_()
          end,
          desc = "Go to Line (No Execute)",
        },
        {
          "<leader>di",
          function()
            require("dap").step_into()
          end,
          desc = "Step Into",
        },
        {
          "<leader>dj",
          function()
            require("dap").down()
          end,
          desc = "Down",
        },
        {
          "<leader>dk",
          function()
            require("dap").up()
          end,
          desc = "Up",
        },
        {
          "<leader>dl",
          function()
            require("dap").run_last()
          end,
          desc = "Run Last",
        },
        {
          "<leader>do",
          function()
            require("dap").step_out()
          end,
          desc = "Step Out",
        },
        {
          "<leader>dO",
          function()
            require("dap").step_over()
          end,
          desc = "Step Over",
        },
        {
          "<leader>dp",
          function()
            require("dap").pause()
          end,
          desc = "Pause",
        },
        {
          "<leader>dr",
          function()
            require("dap").repl.toggle()
          end,
          desc = "Toggle REPL",
        },
        {
          "<leader>ds",
          function()
            require("dap").session()
          end,
          desc = "Session",
        },
        {
          "<leader>dt",
          function()
            require("dap").terminate()
          end,
          desc = "Terminate",
        },
        {
          "<leader>dw",
          function()
            require("dap.ui.widgets").hover()
          end,
          desc = "Widgets",
        },
      })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    requires = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
      "folke/which-key.nvim",
    },
    config = function()
      require("dapui").setup()

      require("which-key").add({
        { "<Leader>dd", ":lua require('dapui').toggle()<CR>", desc = "Open DAP UI" },
      })
    end,
  },
}
