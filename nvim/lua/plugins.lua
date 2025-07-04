require("lazy").setup({
  {
    "gbprod/yanky.nvim",
    config = function()
      require("configs.yanky")
    end,
  },
  {
    "yujinyuz/gitpad.nvim",
    config = function()
      require("gitpad").setup({
        dir = "~/notes",
        default_text = "",
        on_attach = function(bufnr)
          vim.api.nvim_buf_set_keymap(bufnr, "n", "q", "<Cmd>wq<CR>", { noremap = true, silent = true })
        end,
      })
    end,
  },
  { "tpope/vim-abolish" },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("lsp.tstools")
    end,
  },
  {
    "dmmulroy/tsc.nvim",
    config = function()
      require("tsc").setup()
    end,
  },
  {
    "Bekaboo/dropbar.nvim",
    -- optional, but required for fuzzy finder support
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  },
  {
    "preservim/tagbar",
    config = function()
      vim.g.tagbar_sort = 0
      vim.g.tagbar_compact = 2
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
    },
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("configs.zen")
    end,
  },
  {
    "ggandor/flit.nvim",
    dependencies = { "tpope/vim-repeat" },
    config = function()
      require("flit").setup({
        keys = { f = "f", F = "F", t = "t", T = "T" },
        -- A string like "nv", "nvo", "o", etc.
        labeled_modes = "nv",
        clever_repeat = true,
        multiline = true,
        -- Like `leap`s similar argument (call-specific overrides).
        -- E.g.: opts = { equivalence_classes = {} }
        opts = {},
      })
    end,
  },
  {
    "ggandor/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
    config = function()
      vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
      vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
      -- require("leap").opts.special_keys.prev_target = "<s-cr>"
      -- require("leap").opts.special_keys.prev_group = "<s-cr>"
      -- require("leap.user").set_repeat_keys("<cr>", "<s-cr>")
    end,
  },
  { "akinsho/git-conflict.nvim", version = "*", config = true },
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("configs.crates")
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    ft = { "rust" },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("configs.gitsigns")
    end,
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
  -- {
  --   "L3MON4D3/LuaSnip",
  --   version = "v2.*",
  --   -- install jsregexp (optional!).
  --   build = "make install_jsregexp",
  -- },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {

        "nvim-telescope/telescope-live-grep-args.nvim",
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
      },
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
  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   lazy = false,
  -- },
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
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesitter-context").setup({
        enable = true,        -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0,        -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 10, -- Maximum number of lines to show for a single context
        trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = "cursor",      -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20, -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { "windwp/nvim-ts-autotag", "HiPhish/rainbow-delimiters.nvim" },
    config = function()
      require("configs.treesitter")
    end,
  },
  {

    "folke/which-key.nvim",
    -- event = "VeryLazy",
    -- init = function()
    --   vim.o.timeout = true
    --   vim.o.timeoutlen = 300
    -- end,
    config = function()
      require("mappings")
    end,
  },
  {
    "gorbit99/codewindow.nvim",
    config = function()
      local codewindow = require("codewindow")
      codewindow.setup({ z_index = 50, auto_enable = false })
      codewindow.apply_default_keybinds()
    end,
  },
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<C-l>",
          accept_word = "<C-j>",
          clear_suggestion = "<C-h>",
        },
      })
    end,
  },
  {
    "nvim-pack/nvim-spectre",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("configs.spectre")
    end,
  },
  {
    "nosduco/remote-sshfs.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("remote-sshfs").setup()
      require("telescope").load_extension("remote-sshfs")
    end,
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("lsp.go")
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    config = function()
      require("avante").setup({
        mappings = {
          focus = "<leader>aF",
        },
      })
    end,
    -- version = false, -- Never set this value to "*"! Never!
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick",      -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp",           -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua",           -- for file_selector provider fzf
      "stevearc/dressing.nvim",     -- for input provider dressing
      "folke/snacks.nvim",          -- for input provider snacks
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua",     -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    config = function()
      require("lsp.conform")
    end,
  },
})
