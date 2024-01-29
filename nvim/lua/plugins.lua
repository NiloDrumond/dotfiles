require("lazy").setup({
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("configs.colorizer")
		end
  },
	{
		"backdround/neowords.nvim",
	},
	{
		"EdenEast/nightfox.nvim",
		config = function()
			require("configs.nightfox")
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("configs.tokyonight")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		config = function()
			require("configs.kanagawa")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("configs.treesitter")
		end,
	},
	{

		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
			require("configs.which-key")
		end,
	},
})
