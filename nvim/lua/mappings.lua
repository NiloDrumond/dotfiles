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
end

local normal_mappings = {
  ["gd"] = { function()
    vim.lsp.buf.definition()
  end, "Go to definition" },
  ["gD"] = { function()
    vim.lsp.buf.declaration()
  end, "Go to declaration" },
  ["gr"] = { function()
    vim.lsp.buf.references({ includeDeclaration = false })
  end, "See references" },

  ["[g"] = {
    function()
      vim.diagnostic.goto_prev({ float = { border = 'rounded', max_width = 100 }})
    end, "Prev diagnostic" },
  ["]g"] = {
    function()
      vim.diagnostic.goto_next({ float = { border = 'rounded', max_width = 100 }})
    end, "Next diagnostic" },
  ["gl"] = {
    function()
      vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })
    end, "Diagnostics" },
  ["K"] = {
    function() vim.lsp.buf.hover() end,
    "LSP Hover"
  },
  ["m"] = {
    function() vim.lsp.buf.signature_help() end,
    "Signature help"
  },
  ["gi"] = {
    function()
      vim.lsp.buf.implementations()
    end,
    "Go to implementation"
  },
  ["<leader>"] = {
    function()
      vim.lsp.buf.format({ async = true })
    end,
    "Format"
  },
  ["<BS>"] = {
    function()
      vim.cmd("noh")
      vim.api.nvim_input("<ESC>")
    end,
    "Clear highlights"
  },
  ["x"] = { '"_x', "which_key_ignore" },
  ["yA"] = { 'ggVGy', "Yank buffer" },
  ["<C-s>"] = { ":w<CR>", "Save file" },
  ["<C-h>"] = { "<C-w>h", "Move to left window" },
  ["<C-j>"] = { "<C-w>j", "Move to bottom window" },
  ["<C-k>"] = { "<C-w>k", "Move to top window" },
  ["<C-l>"] = { "<C-w>l", "Move to right window" },
}

wk.register(normal_mappings, normal_opts)

local normal_leader_mappings = {
  ["y"] = { '"+y', "Yank(y) to clipboard" },
  ["Y"] = { '"+yg_', "Yank(Y) end to clipboard" },
  ["yA"] = { 'ggVG"+y', "Yank buffer to clipboard" },
  ["p"] = { '"+p', "Paste(p) from clipboard" },
  ["P"] = { '"+P', "Paste(P) from clipboard" },
  ["e"] = {
    "<cmd>NvimTreeToggle<cr>",
    "Toggle tree",
  },
  ["c"] = {
    name = "LSP",
    ["a"] = {
      function() vim.lsp.buf.code_action() end, "Code action"
    },
    ["d"] = { function() vim.lsp.buf.type_definition() end, "Type definition" },
    ["r"] = { function() vim.lsp.buf.rename() end, "Rename" },
    ["f"] = {
      function()
        vim.lsp.buf.format({ async = true })
      end,
      "Format"
    }
  },
  ["a"] = {
    name = "Actions",
    ["f"] = {
      "<cmd>NvimTreeFindFile<cr>",
      "Find file",
    },
  },
  ["f"] = {
    name = "Find",
  },
  ["/"] = {
    name = "Neovim",
    q = { "<cmd>qa<CR>", "Quit" },
  },
}

wk.register(normal_leader_mappings, normal_leader_opts)

local visual_mappings = {
  ["x"] = { '"_x', "which_key_ignore" },
  ["p"] = { '"_dp', "which_key_ignore" },
  ["<C-s>"] = { "<ESC> :w<CR>", "Save file" },
}

wk.register(visual_mappings, visual_opts)

local visual_leader_mappings = {
  ["y"] = { '"+y', "Yank to clipboard" },
  ["p"] = { '"+p', "Paste(p) from clipboard" },
  ["P"] = { '"+P', "Paste(P) from clipboard" },
}

wk.register(visual_leader_mappings, visual_leader_opts)
wk.register(visual_leader_mappings, visual_leader_opts)
