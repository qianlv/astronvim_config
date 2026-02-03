-- cspell: disable
-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- {
  --   "keaising/im-select.nvim",
  --   config = function()
  --     require("im_select").setup {
  --       default_im_select = "1033",
  --       default_command = "/mnt/c/im-select.exe",
  --     }
  --   end,
  -- },

  { "akinsho/git-conflict.nvim", version = "*", config = true },

  -- Supermaven AI 代码补全
  {
    "supermaven-inc/supermaven-nvim",
    event = "VeryLazy",
    opts = {
      keymaps = {
        accept_suggestion = nil, -- 禁用默认的 Tab 绑定，使用 blink.cmp 的 keymap
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
      },
      ignore_filetypes = {},
      color = {
        suggestion_color = "#6e7681",
        cterm = 244,
      },
    },
  },
}
