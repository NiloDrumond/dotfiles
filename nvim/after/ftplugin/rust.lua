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

-- wk.add({
--   mode = "n",
--   { "gp",         "<cmd>RustLsp openCargo<CR>",  desc = "Open Cargo.toml" },
--   { "<leader>aj", "<cmd>RustLsp joinLines<CR>",  desc = "Rust: join lines" },
--   { "<leader>ca", "<cmd>RustLsp codeAction<CR>", desc = "Rust: code action" },
-- }, { bufnr = bufnr })
