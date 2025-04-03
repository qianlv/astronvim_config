return {
  {
    "Saghen/blink.cmp",
    dependencies = {
      "Kaiser-Yang/blink-cmp-avante",
    },
    opts = function(_, opts)
      if not opts.keymap then opts.keymap = {} end
      opts.keymap["<C-b>"] = { "scroll_documentation_up", "fallback" }
      opts.keymap["<C-f>"] = { "scroll_documentation_down", "fallback" }

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

      -- table.insert(opts.sources.default, "avante")
      return opts
    end,
  },
}
