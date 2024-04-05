local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end
require("lsp.mason")
require("lsp.cmp")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local schemastore_ok, schemastore = pcall(require, "schemastore")
if schemastore_ok then
  lspconfig.jsonls.setup({
    capabilities = capabilities,
    settings = {
      json = {
        schemas = schemastore.json.schemas(),
        validate = { enable = true },
      },
    },
  })
end

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

lspconfig.eslint.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    local normal_leader_mappings = {
      ["c"] = {
        ["f"] = { "<cmd>EslintFixAll<CR>", "Eslint fix all" },
      },
    }
    local wk_ok, wk = pcall(require, "which-key")
    local WK = require("utils").WK
    if wk_ok then
      wk.register(normal_leader_mappings, WK.make_opts(WK.Normal, WK.leader, bufnr))
    end
  end,
})

local simple_servers = { "bashls", "tsserver", "lua_ls", "tailwindcss", "jsonls", "taplo" }
for _, server in ipairs(simple_servers) do
  lspconfig[server].setup({
    capabilities = capabilities,
  })
end
