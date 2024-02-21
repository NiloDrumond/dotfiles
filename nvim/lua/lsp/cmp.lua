local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

local source_mapping = {
  npm = "NPM",
  crates = "CRA",
  nvim_lsp = "",
  -- nvim_lsp                = icons.code .. 'LSP',
  nvim_lsp_signature_help = "SIG",
  buffer = "BUF",
  -- nvim_lua = icons.bomb,
  luasnip = "SNP",
  path = "PTH",
  -- treesitter = icons.tree,
  -- zsh = icons.terminal .. "ZSH",
}

cmp.setup({
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol" })
      local menu = source_mapping[entry.source.name]
      local maxwidth = 100

      -- NOTE: autoimport path: https://stackoverflow.com/questions/72668920/how-to-show-paths-for-auto-imports-with-neovim-nvim-cmp
      if entry.completion_item.detail ~= nil and entry.completion_item.detail ~= "" then
        -- vim_item.menu = entry.source.name .. " " .. string.sub(entry.completion_item.detail, 1, 20)
        vim_item.menu = menu .. " " .. string.sub(entry.completion_item.detail, 1, 20)
      else
        vim_item.menu = menu
      end
      vim_item.abbr = string.sub(vim_item.abbr, 1, 20)

      return vim_item
    end,
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Up
    ["<C-d>"] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      -- elseif luasnip.expand_or_jumpable() then
      --   luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      -- elseif luasnip.jumpable(-1) then
      --   luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = {
    { name = "npm",                    keyword_length = 4 },
    { name = "nvim_lsp",               priority = 10 },
    { name = "path" },
    { name = "nvim_lsp_signature_help" },
    { name = "luasnip" },
  },
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    {
      name = "cmdline",
      option = {
        ignore_cmds = { "Man", "!" },
      },
    },
  }),
})
