local wk_ok, wk = pcall(require, "which-key")

if not wk_ok then
	return
end

wk.add({
	mode = "n",
	{ "<A-j>", "/^#\\+ <CR>", desc = "Next heading" },
	{ "<A-k>", "?^#\\+ <CR>", desc = "Prev heading" },
})
