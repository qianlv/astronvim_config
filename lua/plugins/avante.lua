return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    lazy = false,
    opts = {
      -- add any opts here
      -- for example
      provider = "deepseek",
      vendors = {
        deepseek = {
          __inherited_from = "openai",
          api_key_name = "DEEPSEEK_API_KEY",
          endpoint = "https://api.deepseek.com",
          model = "deepseek-coder",
          max_tokens = 8192,
        },
        bytes = {
          __inherited_from = "openai",
          api_key_name = "BYTE_API_KEY",
          endpoint = "https://ark.cn-beijing.volces.com/api/v3",
          model = "deepseek-r1-250120",
          max_tokens = 4096,
        },
        qianwen = {
          __inherited_from = "openai",
          api_key_name = "ALI_API_KEY",
          endpoint = "https://dashscope.aliyuncs.com/compatible-mode/v1",
          model = "qwen-coder-plus-latest",
          max_tokens = 4096,
        },
        gemini = {
          model = 'gemini-2.0-flash',
        }
      },
      -- behaviour = {
      --   auto_suggestions = true,
      -- },
      mappings = {
        submit = {
          insert = "<C-m>",
        },
      },
      windows = {
        ask = {
          floating = false,
        }
      }
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
  },
}
