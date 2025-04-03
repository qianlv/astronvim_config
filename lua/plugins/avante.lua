local prefix = "<Leader>a"
return {
  "yetone/avante.nvim",
  build = vim.fn.has "win32" == 1 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
  event = "User AstroFile", -- load on file open because Avante manages it's own bindings
  cmd = {
    "AvanteAsk",
    "AvanteBuild",
    "AvanteEdit",
    "AvanteRefresh",
    "AvanteSwitchProvider",
    "AvanteChat",
    "AvanteToggle",
    "AvanteClear",
  },
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    { "AstroNvim/astrocore", opts = function(_, opts) opts.mappings.n[prefix] = { desc = " Avante" } end },
  },
  opts = {
    provider = "gemini",
    auto_suggestions_provider = "gemini",
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
        }
    },
    mappings = {
      ask = prefix .. "<CR>",
      edit = prefix .. "e",
      refresh = prefix .. "r",
      focus = prefix .. "f",
      select_model = prefix .. "?",
      stop = prefix .. "S",
      select_history = prefix .. "h",
      toggle = {
        default = prefix .. "t",
        debug = prefix .. "d",
        hint = prefix .. "h",
        suggestion = prefix .. "s",
        repomap = prefix .. "R",
      },
      diff = {
        next = "]c",
        prev = "[c",
      },
      files = {
        add_current = prefix .. ".",
      },
      submit = {
        insert = "<C-m>",
      }
    },
    web_search_engine = {
      provider = "tavily",
    }
  },
  specs = { -- configure optional plugins
    { "AstroNvim/astroui", opts = { icons = { Avante = "" } } },
    -- { -- if copilot.lua is available, default to copilot provider
    --   "zbirenbaum/copilot.lua",
    --   optional = true,
    --   specs = {
    --     {
    --       "yetone/avante.nvim",
    --       opts = {
    --         provider = "copilot",
    --         auto_suggestions_provider = "copilot",
    --       },
    --     },
    --   },
    -- },
    {
      -- make sure `Avante` is added as a filetype
      "MeanderingProgrammer/render-markdown.nvim",
      optional = true,
      opts = function(_, opts)
        if not opts.file_types then opts.file_types = { "markdown" } end
        opts.file_types = require("astrocore").list_insert_unique(opts.file_types, { "Avante" })
      end,
    },
    {
      -- make sure `Avante` is added as a filetype
      "OXY2DEV/markview.nvim",
      optional = true,
      opts = function(_, opts)
        if not opts.filetypes then opts.filetypes = { "markdown", "quarto", "rmd" } end
        opts.filetypes = require("astrocore").list_insert_unique(opts.filetypes, { "Avante" })
      end,
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      optional = true,
      opts = {
        filesystem = {
          commands = {
            avante_add_files = function(state)
              local node = state.tree:get_node()
              local filepath = node:get_id()
              local relative_path = require("avante.utils").relative_path(filepath)

              local sidebar = require("avante").get()

              local open = sidebar:is_open()
              -- ensure avante sidebar is open
              if not open then
                require("avante.api").ask()
                sidebar = require("avante").get()
              end

              sidebar.file_selector:add_selected_file(relative_path)

              -- remove neo tree buffer
              if not open then sidebar.file_selector:remove_selected_file "neo-tree filesystem [1]" end
            end,
          },
        },
        window = {
          mappings = {
            ["oa"] = "avante_add_files",
          },
        },
      },
    },
  }
}
