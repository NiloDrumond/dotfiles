require("toggleterm").setup({
  direction = "float",
  open_mapping = [[<F10>]],
  highlights = {
    -- highlights which map to a highlight group name and a table of it's values
    -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
    Normal = {
      link = 'Normal'
    },
    NormalFloat = {
      link = 'Normal'
    },
    FloatBorder = {
      link = 'FloatBorder'
    },
  },
})
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

vim.api.nvim_create_user_command("LazyGit", function()
  lazygit:toggle()
end, {})
