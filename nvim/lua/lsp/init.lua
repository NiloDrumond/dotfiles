local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	return
end

require("lsp.mason")

lspconfig.lua_ls.setup({
	commands = {
		Format = {
			function()
				require("stylua-nvim").format_file()
			end
		}
	}
})
lspconfig.bashls.setup({})
lspconfig.bashls.setup({})
