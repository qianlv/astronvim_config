-- cspell: disable
--
local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

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
    {
      "milanglacier/minuet-ai.nvim",
    },
  },

  opts = function(_, opts)
    local cmp = require "cmp"
    local minuet_status_ok, minuet = pcall(require, "minuet.virtualtext")
    local snip_status_ok, luasnip = pcall(require, "luasnip")
    -- local llm_status_ok, llm = pcall(require, 'llm.completion')

    local sources = {
      {
        name = "dictionary",
        keyword_length = 2,
      },
    }

    -- opts.performance = {
    --   fetching_timeout = 2000,
    -- }

    opts.sources = cmp.config.sources(vim.list_extend(opts.sources, sources))

    if not opts.mapping then opts.mapping = {} end
    opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
      if minuet_status_ok and minuet.action.is_visible() then
        vim.defer_fn(minuet.action.accept, 30)
      -- elseif llm_status_ok and llm.shown_suggestion ~= nil then
      --   llm.complete()
      elseif cmp.visible() then
        cmp.select_next_item()
      elseif snip_status_ok and luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" })

    opts.mapping["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" })
    opts.mapping["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" })

    return opts
  end,
}
