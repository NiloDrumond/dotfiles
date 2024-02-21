local arrow_ok, statusline = pcall(require, "arrow.statusline")
local function arrow()
	if not arrow_ok then
		return
	end
	return statusline.text_for_statusline_with_icons()
end
local kanagawa_ok, kanagawa_colors = pcall(require, "kanagawa.colors")
local arrow_fg = nil
if kanagawa_ok then
	local colors = kanagawa_colors.setup()
	arrow_fg = colors.palette.peachRed
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { { "filename", separator = { left = "" } }, { arrow, color = { fg = arrow_fg } } },
		lualine_c = { "branch", "diff", "diagnostics" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = { "lazy", "mason", "neo-tree", "toggleterm" },
})
