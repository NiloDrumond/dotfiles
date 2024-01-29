local configs = require("nvim-treesitter.configs")

configs.setup({
	ensure_installed = { "lua", "javascript", "html", "typescript", "rust", "json", "toml", "tsx" },
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },
})
