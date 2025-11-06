require("crates").setup({
  lsp = {
    enabled = true,
    actions = true,
    completion = true,
    hover = true,
    on_attach = function(client, bufnr)
    end
  }
})
