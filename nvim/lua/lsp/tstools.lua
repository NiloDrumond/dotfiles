local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

local function get_workspace_root()
  local cwd = vim.fn.getcwd()
  local root_files = { "pnpm-workspace.yaml", "package.json", "tsconfig.json", ".git" }
  for _, file in ipairs(root_files) do
    if vim.fn.filereadable(cwd .. "/" .. file) == 1 then
      return cwd
    end
  end
  return nil
end

require("typescript-tools").setup({
  root_dir = get_workspace_root,
  tsserver = {
    init_options = {
      maxTsServerMemory = 4096,
    }
    ,
    sourceMaps = true,
    sourceMapPathOverrides = {
      ["/turbopack/[project]/*"] = "${webRoot}/*",
    },
  },
  -- root_dir = function(fname)
  --   local root_files = {
  --     "pnpm-workspace.yaml", -- Ensures it works with pnpm monorepos
  --     "package.json",
  --     "tsconfig.json",
  --     ".git",
  --   }
  --   return lspconfig.util.root_pattern(unpack(root_files))(fname)
  -- end,
  on_attach = function(client, bufnr)
    local wk_ok, wk = pcall(require, "which-key")
    if wk_ok then
      wk.add({
        mode = "n",
        { "gD",         "<cmd>TSToolsGoToSourceDefinition<CR>", desc = "TS go to source definition" },
        { "gR",         "<cmd>TSToolsFileReferences<CR>",       desc = "TS file references" },
        { "<leader>cf", "<cmd>TSToolsFixAll<CR>",               desc = "TS fix all" },
        { "<leader>ci", "<cmd>TSToolsAddMissingImports<CR>",    desc = "TS add missing imports" },
        { "<leader>cR", "<cmd>TSToolsRenameFile<CR>",           desc = "TS rename file" },
        { "<leader>cu", "<cmd>TSToolsRemoveUnusedImports<CR>",  desc = "TS remove unused imports" },
        { "<leader>cU", "<cmd>TSToolsRemoveUnused<CR>",         desc = "TS remove unused statements" },
      }, { bufnr = bufnr })
    end
  end,
})
