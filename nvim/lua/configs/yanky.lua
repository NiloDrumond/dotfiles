require("telescope").load_extension("yank_history")
local utils = require("yanky.utils")
local mapping = require("yanky.telescope.mapping")

require("yanky").setup({
  picker = {
    select = {
      action = mapping.set_register(utils.get_default_register()),
    },
    telescope = {
      mappings = nil,
    },
  },
})
