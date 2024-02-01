-- set spacebar as <leader>
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.keymap.set("v", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

local options = {
	cmdheight      = 1,
	cursorline     = true,
	expandtab      = true, --- Use spaces instead of tabs
	-- https://stackoverflow.com/a/2288438
	ignorecase     = true,
	smartcase      = true,
	laststatus     = 3,                 --- Have a global statusline at the bottom instead of one for each window
	lazyredraw     = true,              --- Makes macros faster & prevent errors in complicated mappings
	number         = true,              --- Shows current line number
	relativenumber = true,              --- Enables relative number

	scrolloff      = 8,                 --- Always keep space when scrolling to bottom/top edge
	shiftwidth     = 2,                 --- Change a number of space characeters inseted for indentation
	showtabline    = 2,                 --- Always show tabs
	swapfile       = false,             --- Swap not needed
	signcolumn     = "yes:1",           --- Add extra sign column next to line number
	smartindent    = true,              --- Makes indenting smart
	smarttab       = true,              --- Makes tabbing smarter will realize you have 2 vs 4
	softtabstop    = 2,                 --- Insert 2 spaces for a tab
	tabstop        = 2,                 --- Insert 2 spaces for a tab
	splitright     = true,              --- Vertical splits will automatically be to the right
	termguicolors  = true,              --- Correct terminal colors
	timeoutlen     = 200,               --- Faster completion (cannot be lower than 200 because then commenting doesn't work)
	updatetime     = 100,               --- Faster completion
	viminfo        = "'1000",           --- Increase the size of file history
	undofile       = true,              --- Sets undo to file
	wrap           = true,              --- Display long lines as just one line
	-- Neovim defaults
	autoindent     = true,              --- Good auto indent
	backspace      = "indent,eol,start", --- Making sure backspace works
	backup         = false,             --- Recommended by coc
	conceallevel   = 0,                 --- Show `` in markdown files
	encoding       = "utf-8",           --- The encoding displayed
	errorbells     = false,             --- Disables sound effect for errors
	fileencoding   = "utf-8",           --- The encoding written to file
	incsearch      = true,              --- Start searching before pressing enter
	showmode       = false,             --- Don't show things like -- INSERT -- anymore
	-- ?
	emoji          = false,

}

for k, v in pairs(options) do
	vim.opt[k] = v
end
