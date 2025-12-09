require("lazy").setup({
	{
		"gbprod/yanky.nvim",
		config = function()
			require("configs.yanky")
		end,
	},
	{
		"yujinyuz/gitpad.nvim",
		config = function()
			require("gitpad").setup({
				dir = "~/notes",
				default_text = "",
				on_attach = function(bufnr)
					vim.api.nvim_buf_set_keymap(bufnr, "n", "q", "<Cmd>wq<CR>", { noremap = true, silent = true })
				end,
			})
		end,
	},
	{ "tpope/vim-abolish" },
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		config = function()
			require("lsp.tstools")
		end,
	},
	{
		"dmmulroy/tsc.nvim",
		config = function()
			require("tsc").setup()
		end,
	},
	{
		"Bekaboo/dropbar.nvim",
		-- optional, but required for fuzzy finder support
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
		},
	},
	{
		"preservim/tagbar",
		config = function()
			vim.g.tagbar_sort = 0
			vim.g.tagbar_compact = 2
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
		},
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"folke/zen-mode.nvim",
		config = function()
			require("configs.zen")
		end,
	},
	{
		"ggandor/flit.nvim",
		dependencies = { "tpope/vim-repeat" },
		config = function()
			require("flit").setup({
				keys = { f = "f", F = "F", t = "t", T = "T" },
				-- A string like "nv", "nvo", "o", etc.
				labeled_modes = "nv",
				clever_repeat = true,
				multiline = true,
				-- Like `leap`s similar argument (call-specific overrides).
				-- E.g.: opts = { equivalence_classes = {} }
				opts = {},
			})
		end,
	},
	{
		"ggandor/leap.nvim",
		dependencies = { "tpope/vim-repeat" },
		config = function()
			vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
			vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
			-- require("leap").opts.special_keys.prev_target = "<s-cr>"
			-- require("leap").opts.special_keys.prev_group = "<s-cr>"
			-- require("leap.user").set_repeat_keys("<cr>", "<s-cr>")
		end,
	},
	{ "akinsho/git-conflict.nvim", version = "*", config = true },
	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		config = function()
			require("configs.crates")
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^6", -- Recommended
		lazy = false,
		config = function()
			vim.g.rustaceanvim = {
				server = {
					on_attach = function(client, bufnr)
						vim.api.nvim_set_hl(0, "@lsp.type.string.rust", {})
						vim.api.nvim_set_hl(0, "@lsp.typemod.string.injected.rust", {})
						-- Set Treesitter priority higher than semantic tokens
						-- vim.treesitter.language.register("rust", "rust")

						-- Keep semantic tokens but make Treesitter injections take precedence
						-- vim.api.nvim_create_autocmd("LspAttach", {
						-- 	buffer = bufnr,
						-- 	callback = function()
						-- 		vim.defer_fn(function()
						-- 			vim.cmd("TSBufEnable highlight")
						-- 		end, 1000)
						-- 	end,
						-- })
					end,
				},
			}
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("configs.gitsigns")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("configs.tree")
		end,
	},
	-- {
	--   "saecki/crates.nvim",
	--   event = { "BufRead Cargo.toml" },
	--   config = function()
	--     require("crates").setup({
	--       null_ls = {
	--         enabled = true,
	--         name = "crates.nvim",
	--       },
	--     })
	--   end,
	-- },
	{
		"otavioschwanck/arrow.nvim",
		config = function()
			require("configs.arrow")
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("configs.autopair")
		end,
	},
	-- {
	--   "L3MON4D3/LuaSnip",
	--   version = "v2.*",
	--   -- install jsregexp (optional!).
	--   build = "make install_jsregexp",
	-- },
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{

				"nvim-telescope/telescope-live-grep-args.nvim",
				-- This will not install any breaking changes.
				-- For major updates, this must be adjusted manually.
				version = "^1.0.0",
			},
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		config = function()
			require("configs.telescope")
		end,
	},
	{
		"b0o/schemastore.nvim",
	},
	-- {
	--   "nvimtools/none-ls.nvim",
	--   config = function()
	--     require("lsp.null")
	--   end,
	-- },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("configs.lualine")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup()
		end,
	},
	{ "HiPhish/rainbow-delimiters.nvim" },
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("configs.alpha")
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("configs.comment")
		end,
		dependencies = {
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
				dependencies = { "nvim-treesitter" },
			},
		},
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
	},
	{
		"ckipp01/stylua-nvim",
		build = "cargo install stylua",
	},
	{
		"mikesmithgh/kitty-scrollback.nvim",
		lazy = true,
		cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
		event = { "User KittyScrollbackLaunch" },
		version = "^4.0.0", -- pin major version, include fixes and features that do not have breaking changes
		config = function()
			require("kitty-scrollback").setup()
		end,
	},
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("configs.colorizer")
		end,
	},
	{
		"backdround/neowords.nvim",
	},
	-- {
	--   "nvim-neo-tree/neo-tree.nvim",
	--   branch = "v3.x",
	--   dependencies = {
	--     "nvim-lua/plenary.nvim",
	--     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	--     "MunifTanjim/nui.nvim",
	--     -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	--   },
	--   config = function()
	--     require("configs.neotree")
	--   end,
	-- },
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		config = function()
			require("configs.kanagawa")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesitter-context").setup({
				enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
				max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
				min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
				line_numbers = true,
				multiline_threshold = 10, -- Maximum number of lines to show for a single context
				trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
				mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
				-- Separator between context and content. Should be a single character string, like '-'.
				-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
				separator = nil,
				zindex = 20, -- The Z-index of the context window
				on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = { "windwp/nvim-ts-autotag", "HiPhish/rainbow-delimiters.nvim" },
		config = function()
			require("configs.treesitter")
		end,
	},
	{

		"folke/which-key.nvim",
		-- event = "VeryLazy",
		-- init = function()
		--   vim.o.timeout = true
		--   vim.o.timeoutlen = 300
		-- end,
		config = function()
			require("mappings")
		end,
	},
	{
		"gorbit99/codewindow.nvim",
		config = function()
			local codewindow = require("codewindow")
			codewindow.setup({ z_index = 50, auto_enable = false })
			codewindow.apply_default_keybinds()
		end,
	},
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({
				ignore_filetypes = { "markdown" },
				keymaps = {
					accept_suggestion = "<C-l>",
					accept_word = "<C-j>",
					clear_suggestion = "<C-h>",
				},
			})
		end,
	},
	{
		"nvim-pack/nvim-spectre",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("configs.spectre")
		end,
	},
	-- {
	-- 	"nosduco/remote-sshfs.nvim",
	-- 	dependencies = { "nvim-telescope/telescope.nvim" },
	-- 	config = function()
	-- 		require("remote-sshfs").setup()
	-- 		require("telescope").load_extension("remote-sshfs")
	-- 	end,
	-- },
	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("lsp.go")
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
	-- {
	-- 	"yetone/avante.nvim",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("avante").setup({
	-- 			mappings = {
	-- 				focus = "<leader>aF",
	-- 			},
	-- 			behaviour = {
	-- 				support_paste_from_clipboard = true,
	-- 			},
	-- 			provider = "claude-haiku",
	-- 			providers = {
	-- 				-- haiku = {
	-- 				-- 	__inherited_from = "claude",
	-- 				-- 	model = "claude-3-5-haiku-20241022",
	-- 				-- 	extra_request_body = {
	-- 				-- 		temperature = 0.75,
	-- 				-- 		max_tokens = 8192,
	-- 				-- 	},
	-- 				-- },
	-- 				-- claude = {
	-- 				-- 	model = "claude-3-5-sonnet-20241022",
	-- 				-- 	extra_request_body = {
	-- 				-- 		temperature = 0.75,
	-- 				-- 		max_tokens = 8192,
	-- 				-- 	},
	-- 				-- },
	-- 				lmstudio = {
	-- 					__inherited_from = "openai",
	-- 					endpoint = "http://192.168.0.8:1234/v1",
	-- 					api_key_name = "OPENAI_API_KEY",
	-- 					-- model = "mistralai/devstral-small-2507",
	-- 					model = "google/gemma-3-12b",
	-- 				},
	-- 				ollama = {
	-- 					endpoint = "http://192.168.0.8:11434",
	-- 					model = "qwen2.5-coder:7b-instruct-q5_0",
	-- 					extra = {
	-- 						num_ctx = 32768,
	-- 						think = false,
	-- 					},
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- 	-- version = false, -- Never set this value to "*"! Never!
	-- 	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	-- 	build = "make",
	-- 	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"MunifTanjim/nui.nvim",
	-- 		--- The below dependencies are optional,
	-- 		"echasnovski/mini.pick", -- for file_selector provider mini.pick
	-- 		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
	-- 		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
	-- 		"ibhagwan/fzf-lua", -- for file_selector provider fzf
	-- 		"stevearc/dressing.nvim", -- for input provider dressing
	-- 		"folke/snacks.nvim", -- for input provider snacks
	-- 		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
	-- 		"zbirenbaum/copilot.lua", -- for providers='copilot'
	-- 		{
	-- 			-- support for image pasting
	-- 			"HakonHarnes/img-clip.nvim",
	-- 			event = "VeryLazy",
	-- 			opts = {
	-- 				-- recommended settings
	-- 				default = {
	-- 					embed_image_as_base64 = false,
	-- 					prompt_for_file_name = false,
	-- 					drag_and_drop = {
	-- 						insert_mode = true,
	-- 					},
	-- 				},
	-- 			},
	-- 		},
	-- 		{
	-- 			-- Make sure to set this up properly if you have lazy=true
	-- 			"MeanderingProgrammer/render-markdown.nvim",
	-- 			opts = {
	-- 				file_types = { "markdown", "Avante" },
	--          heading = {
	--            -- enabled = false,
	--            backgrounds = {
	--              "NONE",
	--              "NONE",
	--              "NONE",
	--              "NONE",
	--              "NONE",
	--              "NONE",
	--            }
	--          }
	-- 			},
	-- 			ft = { "markdown", "Avante" },
	-- 		},
	-- 	},
	-- },
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("lsp.conform")
		end,
	},
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		config = function()
			require("oil").setup({
				keymaps = {
					["g?"] = { "actions.show_help", mode = "n" },
					["<CR>"] = "actions.select",
					-- ["<C-s>"] = { "actions.select", opts = { vertical = true } },
					-- ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
					["<C-t>"] = { "actions.select", opts = { tab = true } },
					["<C-p>"] = "actions.preview",
					["<C-c>"] = { "actions.close", mode = "n" },
					["<leader>r"] = "actions.refresh",
					["-"] = { "actions.parent", mode = "n" },
					["_"] = { "actions.open_cwd", mode = "n" },
					["`"] = { "actions.cd", mode = "n" },
					["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
					["gs"] = { "actions.change_sort", mode = "n" },
					["gx"] = "actions.open_external",
					["g."] = { "actions.toggle_hidden", mode = "n" },
					["g\\"] = { "actions.toggle_trash", mode = "n" },
				},
				use_default_keymaps = false,
			})
		end,
		-- Optional dependencies
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
	},
	{
		"benomahony/oil-git.nvim",
		dependencies = { "stevearc/oil.nvim" },
		-- No opts or config needed! Works automatically
	},
	{
		-- Make sure to set this up properly if you have lazy=true
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {
			file_types = { "markdown", "Avante" },
			heading = {
				-- enabled = false,
				backgrounds = {
					"NONE",
					"NONE",
					"NONE",
					"NONE",
					"NONE",
					"NONE",
				},
			},
		},
		ft = { "markdown", "Avante" },
	},
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },

		version = "1.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
			-- 'super-tab' for mappings similar to vscode (tab to accept)
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = { preset = "default" },
			cmdline = {
				keymap = { preset = "inherit" },
				completion = { menu = { auto_show = true } },
			},

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},
			-- accept = { auto_brackets = { enabled = false } },

			-- (Default) Only show the documentation popup when manually triggered
			completion = { documentation = { auto_show = true } },

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
	{
		"rachartier/tiny-code-action.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },

			-- optional picker via telescope
			{ "nvim-telescope/telescope.nvim" },
			-- optional picker via fzf-lua
			{ "ibhagwan/fzf-lua" },
			-- .. or via snacks
			-- {
			-- 	"folke/snacks.nvim",
			-- 	opts = {
			-- 		terminal = {},
			-- 	},
			-- },
		},
		event = "LspAttach",
		config = function()
			require("tiny-code-action").setup({
				picker = "fzf-lua",
			})
		end,
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
})
