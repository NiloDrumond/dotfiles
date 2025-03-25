local bufnr = vim.api.nvim_get_current_buf()

local ok, wk = pcall(require, "which-key")

if not ok then
  return
end

-- local visual_mappings = {
--   ["<S-j>"] = {
--     "<cmd>RustLsp moveItem down<CR>",
--     "Move line down",
--   },
--   ["<S-k>"] = {
--     "<cmd>RustLsp moveItem up<CR>",
--     "Move line up",
--   },
-- }

wk.add({
  mode = "n",
}, { bufnr = bufnr })
