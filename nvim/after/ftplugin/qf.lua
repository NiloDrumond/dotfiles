local bufnr = vim.api.nvim_get_current_buf()

local function remove_quickfix_item()
  local qflist = vim.fn.getqflist()
  local idx = vim.fn.line(".") -- get the current line number in the quickfix window
  table.remove(qflist, idx)
  vim.fn.setqflist(qflist, "r") -- replace the quickfix list with the updated list
end

local ok, wk = pcall(require, "which-key")

if not ok then
  return
end

-- TODO: ver como fazer esse caralho funcionar
-- wk.add({ mode = "n", { "x", remove_quickfix_item, desc = "Remove QuickFix item" } }, { bufnr = bufnr })
