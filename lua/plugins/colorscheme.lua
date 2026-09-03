---@type LazySpec
return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },

  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_background = "medium"
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_ui_contrast = "high"
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_disable_italic_comment = 0
      vim.g.gruvbox_material_diagnostic_text_highlight = 1
      vim.g.gruvbox_material_diagnostic_line_highlight = 1
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
    end,
  },

  {
    "Mofiqul/dracula.nvim",
    name = "dracula",
    opts = function(_, opts)
      opts.italic_comments = true
      return opts
    end,
  },

  {
    "hardhackerlabs/theme-vim",
    name = "theme-vim",
  },

  {
    "sainnhe/everforest",
    lazy = true,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.everforest_enable_italic = true
      vim.g.everforest_background = "medium"
      -- vim.cmd.colorscheme "everforest"
    end,
  },
}
