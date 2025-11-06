local function first(bufnr, ...)
	local conform = require("conform")
	for i = 1, select("#", ...) do
		local formatter = select(i, ...)
		if conform.get_formatter_info(formatter, bufnr).available then
			return formatter
		end
	end
	return select(1, ...)
end

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "biome-check", "eslint_d", "prettier" },
		javascriptreact = { "biome-check", "eslint_d", "prettier" },
    typescript = {"biome", "biome-check", "biome-organize-imports", "eslint_d", "prettier"},
    typescriptreact = {"biome", "biome-check", "biome-organize-imports", "eslint_d", "prettier"},
    json = {"biome", "biome-check", "biome-organize-imports", "eslint_d", "prettier"},
		css = { "biome-check" },
		rust = { "rustfmt", lsp_format = "fallback" },
		go = { "gofmt", "goimports" },
    toml = {"taplo"}
	},
	formatters = {
		["biome-check"] = {
			require_cwd = true,
		},
		["biome"] = {
			require_cwd = true,
		},
		["biome-organize-imports"] = {
			require_cwd = true,
		},
		["eslint_d"] = {
			require_cwd = true,
		},
		["prettier"] = {
			require_cwd = true,
		},
	},
})
