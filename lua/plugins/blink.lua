return {
  {
    "Saghen/blink.cmp",
    opts = function(_, opts)
      if not opts.keymap then opts.keymap = {} end
      opts.keymap["<C-b>"] = { "scroll_documentation_up", "fallback" }
      opts.keymap["<C-f>"] = { "scroll_documentation_down", "fallback" }
      return opts
    end,
  },
}
