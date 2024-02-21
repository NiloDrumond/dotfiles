local null_ls = require("null-ls")

-- NOTE: see builtins https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.completion.spell,
    null_ls.builtins.diagnostics.jsonlint,
  },
})
