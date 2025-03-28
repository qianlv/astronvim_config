return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    lazy = false,
    opts = {
      -- add any opts here
      -- for example
      provider = "gemini",
      vendors = {
        deepseek = {
          __inherited_from = "openai",
          api_key_name = "DEEPSEEK_API_KEY",
          endpoint = "https://api.deepseek.com",
          model = "deepseek-coder",
        },
        bytes = {
          __inherited_from = "openai",
          api_key_name = "BYTE_API_KEY",
          endpoint = "https://ark.cn-beijing.volces.com/api/v3",
          model = "deepseek-r1-250120",
        },
        qianwen = {
          __inherited_from = "openai",
          api_key_name = "ALI_API_KEY",
          endpoint = "https://dashscope.aliyuncs.com/compatible-mode/v1",
          model = "qwen-coder-plus-latest",
        },
        -- gemini = {
        --   endpoint = 'https://generativelanguage.googleapis.com/v1beta/models',
        --   api_key_name = "GEMINI_API_KEY",
        -- }
      },
      -- behaviour = {
      --   auto_suggestions = true,
      -- },
      mappings = {
        submit = {
          insert = "<C-m>",
        },
      },
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
