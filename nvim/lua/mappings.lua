local wk = require("which-key")


-- Configs

local normal_opts = {
  mode = "n",
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

local normal_leader_opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

local visual_opts = {
  mode = "v",
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

local operator_opts = {
  mode = "o",
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

local insert_opts = {
  mode = "i",
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

local visual_leader_opts = {
  mode = "v",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

-- Mappings

-- Neowords
local ok, neowords = pcall(require, "configs.neowords")
if ok then
  local subword_hops = neowords.hops
  local subword_movement_mappings = {
    ["w"] = { subword_hops.forward_start, "Next word" },
    ["e"] = { subword_hops.forward_end, "Next end of word" },
    ["b"] = { subword_hops.backward_start, "Previous word" },
    ["ge"] = { subword_hops.backward_end, "Previous end of word" },
  }

  wk.register(subword_movement_mappings, normal_opts)
  wk.register(subword_movement_mappings, visual_opts)
  wk.register(subword_movement_mappings, operator_opts)
end

-- LuaSnip
local ls_ok, ls = pcall(require, "luasnip")
if ls_ok then
  local ls_mappings = {
    ["<C-h>"] = {
      function()
        ls.jump(-1)
      end,
      "LuaSnip: jump backward",
    },
    ["<C-l>"] = {
      function()
        ls.jump(1)
      end,
      "LuaSnip: jump forward",
    },
    ["<C-k>"] = {
      function()
        ls.expand()
      end,
      "LuaSnip: expand",
    },
    ["<C-j>"] = {
      function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end,
      "LuaSnip: change active choice",
    },
  }

  wk.register(ls_mappings, insert_opts)
end

local normal_mappings = {
  ["<Enter>"] = { "<cmd>call append(line('.'), '')<CR>", "Add line below" },
  ["<S-Enter>"] = { "<cmd>call append(line('.') -1, '')<CR>", "Add line above" },
  ["<F1>"] = { "", "which_key_ignore" },
  ["gd"] = {
    function()
      vim.lsp.buf.definition()
    end,
    "Go to definition",
  },
  ["gD"] = {
    function()
      vim.lsp.buf.declaration()
    end,
    "Go to declaration",
  },
  ["gr"] = {
    function()
      vim.lsp.buf.references({ includeDeclaration = false })
    end,
    "See references",
  },

  ["[g"] = {
    function()
      vim.diagnostic.goto_prev({ float = { border = "rounded", max_width = 100 } })
    end,
    "Prev diagnostic",
  },
  ["]g"] = {
    function()
      vim.diagnostic.goto_next({ float = { border = "rounded", max_width = 100 } })
    end,
    "Next diagnostic",
  },
  ["gl"] = {
    function()
      vim.diagnostic.open_float({ border = "rounded", max_width = 100 })
    end,
    "Diagnostics",
  },
  ["K"] = {
    function()
      vim.lsp.buf.hover()
    end,
    "LSP Hover",
  },
  ["m"] = {
    function()
      vim.lsp.buf.signature_help()
    end,
    "Signature help",
  },
  ["gi"] = {
    function()
      vim.lsp.buf.implementations()
    end,
    "Go to implementation",
  },
  ["<BS>"] = {
    function()
      vim.cmd("noh")
      vim.api.nvim_input("<ESC>")
    end,
    "Clear highlights",
  },
  ["x"] = { '"_x', "which_key_ignore" },
  ["yA"] = { "ggVGy", "Yank buffer" },
  ["<C-s>"] = { ":w<CR>", "Save file" },
  ["<C-h>"] = { "<C-w>h", "Move to left window" },
  ["<C-j>"] = { "<C-w>j", "Move to bottom window" },
  ["<C-k>"] = { "<C-w>k", "Move to top window" },
  ["<C-l>"] = { "<C-w>l", "Move to right window" },
}

wk.register(normal_mappings, normal_opts)

local normal_leader_mappings = {
  ["g"] = {
    name = "Git",
    ["g"] = { "<cmd>LazyGit<CR>", "Lazygit" },
    -- ["s"] = { "<cmd>Neotree float git_status<CR>", "Git status" },
  },
  -- ["b"] = { "<cmd>Neotree float buffers<CR>", "Buffers" },
  ["<leader>"] = {
    function()
      vim.lsp.buf.format({ async = true })
    end,
    "Format",
  },
  ["y"] = { ":let @+=getreg()<CR>", 'Register " to clipboard' },
  -- ["Y"] = { '"+yg_', "Yank(Y) end to clipboard" },
  -- ["yA"] = { 'ggVG"+y', "Yank buffer to clipboard" },
  -- ["p"] = { ':normal! ""p<CR>', "Clipboard to register" },
  ["p"] = { '"+p', "Paste(p) from clipboard" },
  ["P"] = { '"+P', "Paste(P) from clipboard" },
  ["e"] = {
    "<cmd>NvimTreeToggle<cr>",
    "Toggle tree",
  },
  ["c"] = {
    name = "LSP",
    ["a"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "Code action",
    },
    ["d"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "Type definition",
    },
    ["r"] = {
      function()
        vim.lsp.buf.rename()
      end,
      "Rename",
    },
    ["f"] = {
      function()
        vim.lsp.buf.format({ async = true })
      end,
      "Format",
    },
  },
  ["a"] = {
    name = "Actions",
    ["f"] = {
      "<cmd>Neotree reveal<cr>",
      "Tree: Find file",
    },
    ["r"] = {
      "<cmd>set norelativenumber!<CR>",
      "Toggle relative numbers",
    },
  },
  ["f"] = {
    name = "Find",
    ["w"] = {
      function()
        require("configs.telescope").pickers.grep()
      end,
      "Find word",
    },
    ["f"] = {
      function()
        require("configs.telescope").pickers.fd()
      end,
      "Find file",
    },
  },
  ["/"] = {
    name = "Neovim",
    ["/"] = { "<cmd>Alpha<CR>", "Dashboard" },
    q = { "<cmd>qa<CR>", "Quit" },
  },
}

wk.register(normal_leader_mappings, normal_leader_opts)

local visual_mappings = {
  ["x"] = { '"_x', "which_key_ignore" },
  ["p"] = { '"_dp', "which_key_ignore" },
  ["<C-s>"] = { "<ESC> :w<CR>", "Save file" },
  ["<S-j>"] = { ":move '>+1<CR>gv-gv", "Move line down" },
  ["<S-k>"] = { ":move '<-2<CR>gv-gv", "Move line down" },
}

wk.register(visual_mappings, visual_opts)

local visual_leader_mappings = {
  ["p"] = { '"+p', "Paste(p) from clipboard" },
  ["P"] = { '"+P', "Paste(P) from clipboard" },
}

wk.register(visual_leader_mappings, visual_leader_opts)

local insert_mappings = {
  ["<C-s>"] = { "<ESC> :w<CR>", "Save file" },
  ["<C-p>"] = { "<C-r>", "Paste" },
}

wk.register(insert_mappings, insert_opts)
