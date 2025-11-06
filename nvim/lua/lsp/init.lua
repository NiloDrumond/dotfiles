require("lsp.mason")
require("lsp.cmp")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- local schemastore_ok, schemastore = pcall(require, "schemastore")
-- if schemastore_ok then
--   lspconfig.jsonls.setup({
--     capabilities = capabilities,
--     settings = {
--       json = {
--         schemas = schemastore.json.schemas(),
--         validate = { enable = true },
--       },
--     },
--   })
-- end

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

vim.lsp.config("eslint", {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		local wk_ok, wk = pcall(require, "which-key")
		if wk_ok then
			wk.add(
				{ mode = "n", { "<leader>cf", "<cmd>EslintFixAll<CR>", desc = "Eslint fix all" } },
				{ bufnr = bufnr }
			)
		end
	end,
})

vim.lsp.config("tailwindcss", {
	capabilities = capabilities,
	settings = {
		tailwindCSS = {
			experimental = {
				classRegex = {
					"tw`([^`]*)",
					'tw="([^"]*)',
					'tw={"([^"}]*)',
					"tw\\.\\w+`([^`]*)",
					"tw\\(.*?\\)`([^`]*)",
					{ "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
					{ "classnames\\(([^)]*)\\)", "'([^']*)'" },
					{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
					{ "cn\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
				},
			},
		},
	},
})

local simple_servers = { "bashls", "lua_ls", "jsonls", "taplo", "gopls", "prismals", "biome" }
for _, server in ipairs(simple_servers) do
	vim.lsp.config(server, {
		capabilities = capabilities,
	})
end

vim.lsp.enable("biome")
