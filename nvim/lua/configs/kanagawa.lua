-- Default options:
require("kanagawa").setup({
  compile = false,  -- enable compiling the colorscheme
  undercurl = true, -- enable undercurls
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  typeStyle = {},
  transparent = false,   -- do not set background color
  dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
  terminalColors = true, -- define vim.g.terminal_color_{0,17}
  colors = {             -- add/modify theme and palette colors
    palette = {},
    theme = {
      wave = {},
      lotus = {},
      dragon = {},
      all = {
        ui = { bg_gutter = "none" },
      },
    },
  },
  overrides = function(colors) -- add/modify highlights
    local theme = colors.theme
    local palette = colors.palette
    return {
      TelescopeTitle = { fg = theme.ui.special, bold = true },
      TelescopePromptNormal = { bg = theme.ui.bg_p1 },
      TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
      TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
      TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
      TelescopePreviewNormal = { bg = theme.ui.bg_dim },
      TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

      IblIndent = { fg = palette.sumiInk5 },
      IblWhitespace = { fg = palette.sumiInk5 },
      RainbowDelimiterRed = { fg = palette.autumnRed },
      RainbowDelimiterYellow = { fg = palette.roninYellow },
      RainbowDelimiterBlue = { fg = palette.crystalBlue },
      RainbowDelimiterOrange = { fg = palette.surimiOrange },
      RainbowDelimiterGreen = { fg = palette.autumnGreen },
      RainbowDelimiterViolet = { fg = palette.oniViolet },
      RainbowDelimiterCyan = { fg = palette.dragonBlue },
      -- NormalFloat = { bg = "none" },
      FloatBorder = { bg = "none" },
      FloatTitle = { bg = "none" },

      NeoTreeWinSeparator = { bg = theme.ui.float.bg, fg = theme.ui.float.bg },
      NeoTreeFloatBorder = { bg = theme.ui.float.bg, fg = theme.ui.float.bg },
      NeoTreeTitleBar = { fg = palette.crystalBlue, bold = true, underline = true },
      NeoTreeBorder = { bg = theme.ui.float.bg, fg = theme.ui.float.bg },
      NeoTreeNormal = { bg = theme.ui.float.bg },
      NeoTreeNormalNC = { bg = theme.ui.float.bg },
      NeoTreeSymbolicLinkTarget = { fg = palette.autumnRed },

      Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
      PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
      PmenuSbar = { bg = theme.ui.bg_m1 },
      PmenuThumb = { bg = theme.ui.bg_p2 },

      -- For Spectre
      DiffChange = { bg = palette.autumnGreen },


      -- Codewindow
      CodewindowBorder = { fg = theme.ui.float.bg },

      ArrowIcon = { fg = palette.peachRed, bg = "NONE" },
      LeapLabelPrimary = { bg = palette.peachRed, fg = palette.sumiInk2 }
    }
  end,
  theme = "wave",  -- Load "wave" theme when 'background' option is not set
  background = {   -- map the value of 'background' option to a theme
    dark = "wave", -- try "dragon" !
    light = "lotus",
  },
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")
