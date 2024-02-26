-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
  end,
})

-- Disable diagnostics in node_modules (0 is current buffer only) vim.api.nvim_create_autocmd("BufRead", { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" }) vim.api.nvim_create_autocmd("BufNewFile", { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" })

-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.txt", "*.md", "*.tex" },
  command = "setlocal spell",
})

-- Update kitty tab title
local settings = require("settings")

if settings.kitty_tab_title then
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      local directory = vim.fn.substitute(vim.fn.getcwd(), "^.*/", "", "")
      -- TODO 0.10: change to vim.system
      vim.fn.system("kitty @ set-tab-title " .. "nvim: " .. directory)
    end,
  })

  vim.api.nvim_create_autocmd("VimLeave", {
    callback = function()
      -- TODO 0.10: change to vim.system
      -- https://github.com/neovim/neovim/issues/21856#issuecomment-1514723887
      vim.fn.jobstart("kitty @ set-tab-title", { detach = true })
    end,
  })
end

-- Insane autocmd to refresh neo-tree when closing arrow menu (which happens to be not modifiable)
-- Check arrow.nvim updates for hooks or something
vim.api.nvim_create_autocmd("WinClosed", {
  callback = function(args)
    local modifiable = vim.api.nvim_buf_get_option(args.buf, "modifiable")
    if not modifiable then
      -- require("neo-tree.sources.manager").refresh("arrow")
    end
  end,
})

-- Set filetype for rasi files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.rasi" }, command = "setfiletype rasi" })

-- Lazily add crates source to nvim-cmp
local cmp_ok, cmp = pcall(require, "cmp")
local crates_ok, crates_cmp = pcall(require, "crates.src.cmp")
if cmp_ok and crates_ok then
  crates_cmp.setup()
  vim.api.nvim_create_autocmd("BufRead", {
    group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
    pattern = "Cargo.toml",
    callback = function()
      cmp.setup.buffer({ sources = { { name = "crates" } } })
    end,
  })
end
