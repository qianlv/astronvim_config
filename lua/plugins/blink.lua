local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
  {
    "Saghen/blink.cmp",
    build = 'cargo build --release',
    opts = function(_, opts)
      if not opts.keymap then opts.keymap = {} end
      opts.keymap["<C-b>"] = { "scroll_documentation_up", "fallback" }
      opts.keymap["<C-f>"] = { "scroll_documentation_down", "fallback" }

      -- Tab 键配置：优先接受 Supermaven 建议，然后 blink.cmp 操作
      opts.keymap["<Tab>"] = {
        function(cmp)
          local suggestion = require("supermaven-nvim.completion_preview")
          if suggestion.has_suggestion() then
            vim.schedule(function()
              suggestion.on_accept_suggestion()
            end)
            return true
          end
          return false
        end,
        "select_next",
        "snippet_forward",
        function(cmp)
          if has_words_before() or vim.api.nvim_get_mode().mode == "c" then
            return cmp.show()
          end
        end,
        "fallback",
      }

      -- opts.fuzzy = {
      --   implementation = "lua"
      -- }

      -- opts.sources = vim.tbl_deep_extend("keep", opts.sources or {}, {
      --   default = {},
      --   providers = {
      --     avante = {
      --       module = "blink-cmp-avante",
      --       name = "Avante",
      --       opts = {
      --         -- options for blink-cmp-avante
      --       },
      --     },
      --   },
      -- })

      return opts
    end,
  },
  {
    "ribru17/blink-cmp-spell",
    lazy = true,
    specs = {
      {
        "Saghen/blink.cmp",
        optional = true,
        opts = {
          sources = {
            default = { "spell" },
            providers = {
              spell = {
                name = "Spell",
                module = "blink-cmp-spell",
                opts = {
                  -- EXAMPLE: Only enable source in `@spell` captures, and disable it
                  -- in `@nospell` captures.
                  enable_in_context = function()
                    local curpos = vim.api.nvim_win_get_cursor(0)
                    local captures = vim.treesitter.get_captures_at_pos(0, curpos[1] - 1, curpos[2] - 1)
                    local in_spell_capture = false
                    for _, cap in ipairs(captures) do
                      if cap.capture == "spell" then
                        in_spell_capture = true
                      elseif cap.capture == "nospell" then
                        return false
                      end
                    end
                    return in_spell_capture
                  end,
                },
              },
            },
          },
          fuzzy = {
            sorts = {
              function(a, b)
                local sort = require "blink.cmp.fuzzy.sort"
                if a.source_id == "spell" and b.source_id == "spell" then return sort.label(a, b) end
              end,
              -- This is the normal default order, which we fall back to
              "score",
              "kind",
              "label",
            },
          },
        },
      },
    },
  },
}
