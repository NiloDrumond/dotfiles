require("lazy").setup({
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("configs.gitsigns")
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("configs.tree")
    end,
  },
  -- {
  --   "saecki/crates.nvim",
  --   event = { "BufRead Cargo.toml" },
  --   config = function()
  --     require("crates").setup({
  --       null_ls = {
  --         enabled = true,
  --         name = "crates.nvim",
  --       },
  --     })
  --   end,
  -- },
  {
    "otavioschwanck/arrow.nvim",
    config = function()
      require("configs.arrow")
    end,
  },
  {
    "David-Kunz/cmp-npm",
    dependencies = { "nvim-lua/plenary.nvim", "onsails/lspkind.nvim" },
    event = { "BufRead package.json" },
    config = function()
      require("cmp-npm").setup({})
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("configs.autopair")
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
  },
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("configs.toggleterm")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      require("configs.telescope")
    end,
  },
  {
    "b0o/schemastore.nvim",
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      require("lsp.null")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("configs.lualine")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup()
    end,
  },
  { "HiPhish/rainbow-delimiters.nvim" },
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("configs.alpha")
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("configs.comment")
    end,
    dependencies = {
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        dependencies = { "nvim-treesitter" },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
  },
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    dependencies = {
      { "hrsh7th/cmp-cmdline",                 lazy = false },
      { "hrsh7th/cmp-nvim-lsp",                lazy = false },
      { "hrsh7th/cmp-path",                    lazy = false },
      { "hrsh7th/cmp-nvim-lsp-signature-help", lazy = false },
    },
  },
  {
    "ckipp01/stylua-nvim",
    build = "cargo install stylua",
  },
  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup({})
    end,
  },
  {
    "mikesmithgh/kitty-scrollback.nvim",
    lazy = true,
    cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
    event = { "User KittyScrollbackLaunch" },
    version = "^4.0.0", -- pin major version, include fixes and features that do not have breaking changes
    config = function()
      require("kitty-scrollback").setup()
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("configs.colorizer")
    end,
  },
  {
    "backdround/neowords.nvim",
  },
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   branch = "v3.x",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  --     "MunifTanjim/nui.nvim",
  --     -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  --   },
  --   config = function()
  --     require("configs.neotree")
  --   end,
  -- },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = function()
      require("configs.kanagawa")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { "windwp/nvim-ts-autotag" },
    config = function()
      require("configs.treesitter")
    end,
  },
  {

    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      require("mappings")
    end,
  },
})
