local mason_ok, mason = pcall(require, "mason")

if not mason_ok then
  return
end

-- TODO: ensure installed for formatters:
-- prettier, jsonlint
mason.setup({
  ensure_installed = { "prettier", "jsonlint", "shfmt", "rust-analyzer", "tailwindcss" },
})

-- mason_lsp.setup({
--   -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
--   -- This setting has no relation with the `automatic_installation` setting.
--   ---@type string[]
--   ensure_installed = { "lua_ls", "bashls", "eslint", "jsonls", "tailwindcss", "taplo" },
--
--   -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
--   -- This setting has no relation with the `ensure_installed` setting.
--   -- Can either be:
--   --   - false: Servers are not automatically installed.
--   --   - true: All servers set up via lspconfig are automatically installed.
--   --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
--   --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
--   ---@type boolean
--   automatic_installation = true,
--   --
--   -- See `:h mason-lspconfig.setup_handlers()`
--   ---@type table<string, fun(server_name: string)>?
--   handlers = nil,
-- })
