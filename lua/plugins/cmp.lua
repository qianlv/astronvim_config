-- cspell: disable
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    {
      "uga-rosa/cmp-dictionary",
      config = function()
        local dict = require "cmp_dictionary"
        dict.setup {
          paths = { "/home/qianlv/.config/english.dict" },
          exact_length = 2,
          first_case_insensitive = true,
          document = {
            enable = true,
            command = { "wn", "${label}", "-over" },
          },
        }
      end,
    },
    -- "hrsh7th/cmp-nvim-lsp-signature-help",
  },

  opts = function(_, opts)
    local cmp = require "cmp"
    local sources = {
      {
        name = "dictionary",
        keyword_length = 2,
        priority = 300,
      },
      -- {
      --   name = "nvim_lsp_signature_help",
      -- }
    }

    opts.sources = cmp.config.sources(vim.list_extend(opts.sources, sources))
    opts.mapping["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" })
    opts.mapping["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" })

    return opts
  end,
}
