local wk = require("which-key")

-- Configs

local normal_opts = {
	mode = "n", -- NORMAL mode
	prefix = "",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

local normal_leader_opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

local visual_opts = {
	mode = "v",
	prefix = "",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

-- Mappings

local ok, neowords = pcall(require, "configs.neowords")
if ok then
	local subword_hops = neowords.hops
	local subword_movement_mappings = {
		["w"] = { subword_hops.forward_start, "Next word" },
		["e"] = { subword_hops.forward_end, "Next end of word" },
		["b"] = { subword_hops.backward_start, "Previous word" },
		["ge"] = { subword_hops.backward_end, "Previous end of word" },
	}

	wk.register(subword_movement_mappings, normal_opts)
	wk.register(subword_movement_mappings, visual_opts)
end

local normal_mode_mappings = {
	["<C-h>"] = { "<C-w>h", "Move to left window" },
	["<C-j>"] = { "<C-w>j", "Move to bottom window" },
	["<C-k>"] = { "<C-w>k", "Move to top window" },
	["<C-l>"] = { "<C-w>l", "Move to right window" },
}

wk.register(normal_mode_mappings, normal_opts)

local normal_mode_leader_mappings = {
	["e"] = {
		"<cmd>NvimTreeToggle<cr>",
		"Toggle tree",
	},
	["a"] = {
		name = "actions",
		["f"] = {
			"<cmd>NvimTreeFindFile<cr>",
			"Find file",
		},
	},
	["f"] = {
		name = "Find",
	},
	["/"] = {
		name = "Neovim",
		q = { "<cmd>qa<CR>", "Quit" },
	},
}

wk.register(normal_mode_leader_mappings, normal_leader_opts)
