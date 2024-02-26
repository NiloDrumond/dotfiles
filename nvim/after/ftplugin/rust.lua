local bufnr = vim.api.nvim_get_current_buf()

local ok, wk = pcall(require, "which-key")

if not ok then
  return
end

local WK = require("utils").WK

local visual_mappings = {
  ["<S-j>"] = {
    "<cmd>RustLsp moveItem down<CR>",
    "Move line down",
  },
  ["<S-k>"] = {
    "<cmd>RustLsp moveItem up<CR>",
    "Move line up",
  },
}

local normal_leader_mappings = {
  ["a"] = {
    ["j"] = { "<cmd>RustLsp joinLines<CR>", "Join lines" },
  },
  ["c"] = {
    ["a"] = {
      "<cmd>RustLsp codeAction<CR>",
      "Code action",
    },
  },
}

local normal_mappings = {
  ["gp"] = { "<cmd>RustLsp openCargo<CR>", "Open Cargo.toml" },
}

-- wk.register(visual_mappings, WK.make_opts(WK.Visual, "", bufnr))
wk.register(normal_leader_mappings, WK.make_opts(WK.Normal, "<leader>", bufnr))
wk.register(normal_mappings, WK.make_opts(WK.Normal, "", bufnr))
