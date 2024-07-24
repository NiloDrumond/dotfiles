local configs = require("nvim-treesitter.configs")

configs.setup({
  ensure_installed = { "lua", "javascript", "html", "typescript", "rust", "json", "toml", "tsx", "rasi" },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
})

require("nvim-ts-autotag").setup({
  opts = {
    -- Defaults
    enable_close = true,         -- Auto close tags
    enable_rename = true,        -- Auto rename pairs of tags
    enable_close_on_slash = false, -- Auto close on trailing </
  },
})
