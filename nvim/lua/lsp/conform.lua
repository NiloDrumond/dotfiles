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
		-- typescript = { "eslint_d", "biome-check", "prettier" },
		-- typescriptreact = { "eslint_d", "biome-check", "prettier" },
		-- typescript = function(bufnr)
		-- 	return { first(bufnr, "biome-check", "eslint_d"), "prettier" }
		-- end,
		-- typescriptreact = function(bufnr)
		-- 	return { first(bufnr, "biome-check", "eslint_d"), "prettier" }
		-- end,
    typescript = {"biome", "biome-check", "biome-organize-imports", "eslint_d", "prettier"},
    typescriptreact = {"biome", "biome-check", "biome-organize-imports", "eslint_d", "prettier"},
    json = {"biome", "biome-check", "biome-organize-imports", "eslint_d", "prettier"},

		css = { "biome-check" },
		-- json = function(bufnr)
		-- 	return { first(bufnr, "biome-check", "eslint_d"), "prettier" }
		-- end,
		rust = { "rustfmt", lsp_format = "fallback" },
		go = { "gofmt", "goimports" },
		-- -- Conform will run multiple formatters sequentially
		-- python = { "isort", "black" },
		-- You can customize some of the format options for the filetype (:help conform.format)
		-- rust = { "rustfmt", lsp_format = "fallback" },
		-- Conform will run the first available formatter
		-- javascript = { "biome", "eslint", "prettier", stop_after_first = true },
		-- json = { "biome-check" },
		-- css = { "biome-check" },
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
