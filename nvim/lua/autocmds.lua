-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost",
  { callback = function() vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 100 }) end })

-- Disable diagnostics in node_modules (0 is current buffer only)
vim.api.nvim_create_autocmd("BufRead", { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" })
vim.api.nvim_create_autocmd("BufNewFile", { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" })

-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.txt", "*.md", "*.tex" },
  command = "setlocal spell"
})

local on_exit = function(obj)
  print(obj.code)
  print(obj.signal)
  print(obj.stdout)
  print(obj.stderr)
end
-- Update kitty tab title
vim.api.nvim_create_autocmd("VimEnter",
  {
    callback = function()
      local directory = vim.fn.substitute(vim.fn.getcwd(), '^.*/', '', '')
      -- TODO 0.10: change to vim.system
      vim.fn.system("kitty @ set-tab-title " .. "nvim: " .. directory)
    end
  })

vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    -- TODO 0.10: change to vim.system
    -- https://github.com/neovim/neovim/issues/21856#issuecomment-1514723887
    vim.fn.jobstart("kitty @ set-tab-title", { detach = true })
  end
})
