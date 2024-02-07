local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  return
end
require("lsp.mason")
require("lsp.cmp")
local capabilities = require("cmp_nvim_lsp").default_capabilities()




-- lspconfig.lua_ls.setup({
--   capabilities = capabilities,
--   commands = {
--     Format = {
--       function()
--         require("stylua-nvim").format_file()
--       end
--     }
--   }
-- })
-- lspconfig.bashls.setup({})

local simple_servers = { 'bashls', "tsserver", "eslint", "lua_ls" }
for _, server in ipairs(simple_servers) do
  lspconfig[server].setup({
    capabilities = capabilities
  })
end
