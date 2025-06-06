require("go").setup({
  goimports = "gopls", -- if set to 'gopls' will use golsp format
  gofmt = "gopls",    -- if set to gopls will use golsp format
  tag_transform = false,
  test_dir = "",
  comment_placeholder = "  ",
  lsp_cfg = true,      -- false: use your own lspconfig
  lsp_gofumpt = true,  -- true: set default gofmt in gopls format to gofumpt
  lsp_on_attach = true, -- use on_attach from go.nvim
  lsp_keymaps = false,
  dap_debug = true,
})
