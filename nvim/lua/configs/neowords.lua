local neowords = require("neowords")
local p = neowords.pattern_presets

local M = {}
M.hops = neowords.get_word_hops(
  p.snake_case,
  p.camel_case,
  p.upper_case,
  p.number,
  p.hex_color
)

return M
