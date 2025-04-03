-- cspell: disable
-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
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
    "keaising/im-select.nvim",
    config = function()
      require("im_select").setup {
        default_im_select = "1033",
        default_command = "/mnt/c/im-select.exe",
      }
    end,
  },

  { "akinsho/git-conflict.nvim", version = "*", config = true },
}
