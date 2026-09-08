return {
  -- inline ghost-text completion, accept with <C-f>
  {
    "milanglacier/minuet-ai.nvim",
    event = "InsertEnter",
    opts = {
      provider = "openai_fim_compatible",
      n_completions = 1,
      context_window = 512,
      request_timeout = 6,
      virtualtext = {
        auto_trigger_ft = { "python", "typescript", "typescriptreact", "javascript", "javascriptreact", "lua" },
      },
      provider_options = {
        openai_fim_compatible = {
          api_key = "TERM",
          name = "Ollama",
          end_point = "http://localhost:11434/v1/completions",
          model = "qwen2.5-coder:3b",
          optional = { max_tokens = 96, top_p = 0.9 },
        },
      },
    },
    config = function(_, opts)
      require("minuet").setup(opts)
      vim.keymap.set("i", "<C-f>", require("minuet.virtualtext").action.accept, { desc = "Accept AI suggestion" })
      vim.keymap.set("i", "<A-]>", require("minuet.virtualtext").action.next, { desc = "Next AI suggestion" })
      vim.keymap.set("i", "<A-[>", require("minuet.virtualtext").action.prev, { desc = "Previous AI suggestion" })
    end,
  },

  -- agentic chat: can read, search, and edit files in your project
  {
    "olimorris/codecompanion.nvim",
    event = "BufRead",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
    opts = {
      display = {
        chat = {
          intro_message = "Welcome to CodeCompanion ✨! Press ? for options",
          show_header_separator = false,
          show_references = true,
          show_token_count = true,
        },
      },
      strategies = {
        chat = {
          adapter = "qwen_agent",
          tools = {
            opts = { auto_submit_errors = true, auto_submit_success = true },
            ["files"] = {},
            ["cmd_runner"] = {},
            ["editor"] = {},
            groups = {
              ["full_stack_dev"] = {
                description = "Read, search, and edit files across the project",
                tools = { "files", "cmd_runner", "editor" },
              },
            },
          },
        },
        inline = {
          adapter = "qwen_agent",
          keymaps = {
            accept_change = { modes = { n = "ga" }, description = "Accept the suggested change" },
            reject_change = { modes = { n = "gr" }, description = "Reject the suggested change" },
          },
        },
      },
      adapters = {
        http = {
          qwen_agent = function()
            return require("codecompanion.adapters").extend("ollama", {
              name = "qwen-3b-agent",
              schema = {
                model = { default = "qwen2.5-coder:3b" },
                num_ctx = { default = 8192 },
                num_predict = { default = -1 },
              },
            })
          end,
        },
      },
    },
    keys = {
      { "<leader>ai", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle AI Chat" },
      { "<leader>ae", "<cmd>CodeCompanionChat Explain<cr>", mode = "v", desc = "Explain code" },
    },
  },
}
