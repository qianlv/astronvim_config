-- cspell: disable
return {
  -- {
  --   "Kurama622/llm.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
  --   cmd = { "LLMSessionToggle", "LLMSelectedTextHandler", "LLMAppHandler" },
  --   lazy = false,
  --   config = function()
  --     local tools = require "llm.tools"
  --     require("llm").setup {
  --       enable_trace = true,
  --       -- [[ Deepseek ]]
  --       -- url = "https://api.deepseek.com/chat/completions",
  --       -- model = "deepseek-chat",
  --       fetch_key = function()
  --         return vim.env.BYTE_KEY
  --       end,
  --       url = "https://ark.cn-beijing.volces.com/api/v3/chat/completions",
  --       -- model = "doubao-1-5-lite-32k-250115",
  --       -- model = "deepseek-r1-distill-qwen-7b-250120",
  --       model = "deepseek-v3-241226",
  --       api_type = "openai",
  --       max_tokens = 4096,
  --       temperature = 0.3,
  --       top_p = 0.7,
  --
  --       prompt = "You are a helpful chinese assistant.",
  --
  --       prefix = {
  --         user = { text = "😃 ", hl = "Title" },
  --         assistant = { text = "  ", hl = "Added" },
  --       },
  --
  --       -- history_path = "/tmp/llm-history",
  --       save_session = true,
  --       max_history = 15,
  --       max_history_name_length = 20,
  --
  --       app_handler = {
  --         -- Your AI tools Configuration
  --         -- TOOL_NAME = { ... }
  --       },
  --
  --       -- stylua: ignore
  --       keys = {
  --         -- The keyboard mapping for the input window.
  --         ["Input:Submit"]      = { mode = "n", key = "<cr>" },
  --         ["Input:Cancel"]      = { mode = {"n", "i"}, key = "<C-c>" },
  --         ["Input:Resend"]      = { mode = {"n", "i"}, key = "<C-r>" },
  --
  --         -- only works when "save_session = true"
  --         ["Input:HistoryNext"] = { mode = {"n", "i"}, key = "<C-j>" },
  --         ["Input:HistoryPrev"] = { mode = {"n", "i"}, key = "<C-k>" },
  --
  --         -- The keyboard mapping for the output window in "split" style.
  --         ["Output:Ask"]        = { mode = "n", key = "i" },
  --         ["Output:Cancel"]     = { mode = "n", key = "<C-c>" },
  --         ["Output:Resend"]     = { mode = "n", key = "<C-r>" },
  --
  --         -- The keyboard mapping for the output and input windows in "float" style.
  --         ["Session:Toggle"]    = { mode = "n", key = "<leader>ac" },
  --         ["Session:Close"]     = { mode = "n", key = {"<esc>", "Q"} },
  --       },
  --     }
  --   end,
  --   keys = {
  --     { "<leader>ac", mode = "n", "<cmd>LLMSessionToggle<cr>" },
  --     { "<leader>ae", mode = "v", "<cmd>LLMSelectedTextHandler 请解释下面这段代码<cr>" },
  --     { "<leader>at", mode = "x", "<cmd>LLMSelectedTextHandler 英译汉<cr>" },
  --   },
  -- },

  {
    "milanglacier/minuet-ai.nvim",
    enabled = false,
    config = function()
      require("minuet").setup {
        provider = "openai_compatible",
        -- provider = "openai_fim_compatible",
        context_window = 512,
        provider_options = {
          -- 阿里FIM文档
          -- https://help.aliyun.com/zh/model-studio/user-guide/qwen-coder?scm=20140722.S_help%40%40%E6%96%87%E6%A1%A3%40%402850166.S_BB1%40bl%2BRQW%40ag0%2BBB2%40ag0%2Bos0.ID_2850166-RL_fim-LOC_doc%7EUND%7Eab-OR_ser-PAR1_2102029b17424418065905787d3d69-V_4-P0_0-P1_0&spm=a2c4g.11186623.help-search.i10#ee2bb51009n58
          openai_fim_compatible = {
            end_point = "https://dashscope.aliyuncs.com/compatible-mode/v1/completions",
            api_key = "ALI_API_KEY",
            -- model = "qwen2.5-coder-7b-instruct",
            -- model = "qwen2.5-coder-14b-instruct",
            model = "qwen2.5-coder-32b-instruct",
            name = "ALI",

            stream = true,
            -- template = {
            --   prompt = function(context_before_cursor, context_after_cursor)
            --     return "<|fim_prefix|>"
            --       .. context_before_cursor
            --       .. "<|fim_suffix|>"
            --       .. context_after_cursor
            --       .. "<|fim_middle|>"
            --   end,
            --   suffix = false,
            -- },
            optional = {
              max_tokens = 256,
              top_p = 0.9,
              seed = 1024,
            },
          },
          openai_compatible = {
            end_point = "https://dashscope.aliyuncs.com/compatible-mode/v1/chat/completions",
            api_key = "ALI_API_KEY",
            name = "ALI",
            model = "deepseek-v3",
            -- model = "qwen2.5-coder-7b-instruct",
            -- model = "qwen2.5-coder-14b-instruct",
            -- model = "qwen2.5-coder-32b-instruct",
            -- model = "deepseek-r1-distill-qwen-32b",

            stream = true,
            optional = {
              max_tokens = 256,
              top_p = 0.9,
              seed = 1024,
            },
          },
        },
        virtualtext = {
          auto_trigger_ft = { "python", "javascript", "typescript", "lua", "c", "cpp", "rust", "markdown", "java" },
          keymap = {
            -- 接受完整补全
            accept = "<A-a>",
            -- 接受一行
            accept_line = "<A-l>",
            -- 接受 n 行（提示输入数字）
            -- 例如，“A-z 2 CR”将接受 2 行
            accept_n_lines = "<A-z>",
            -- 切换到上一个补全项，或手动调用补全
            prev = "<A-[>",
            -- 切换到下一个补全项，或手动调用补全
            next = "<A-]>",
            dismiss = "<A-e>",
          },
          show_on_completion_menu = true,
        },
      }
    end,
  },
}
