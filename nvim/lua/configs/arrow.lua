local arrow = require("arrow")
arrow.setup({
  always_show_path = true,
  show_icons = true,
  buffer_leader_key = "m", -- Per Buffer Mappings
  leader_key = "U",       -- Recommended to be a single key
  separate_save_and_remove = true,
  -- index_keys = "123456789zxcbnmZXVBNM,afghjklAFGHJKLwrtyuiopWRTYUIOP", -- keys mapped to bookmark index, i.e. 1st bookmark will be accessible by 1, and 12th - by c
  index_keys = "12345zc6789bnmZXVBNM,afghjklAFGHJKLwrtyuiopWRTYUIOP", -- keys mapped to bookmark index, i.e. 1st bookmark will be accessible by 1, and 12th - by c
})
