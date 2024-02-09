require("toggleterm").setup()
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

vim.api.nvim_create_user_command("LazyGit", function()
  lazygit:toggle()
end, {})
