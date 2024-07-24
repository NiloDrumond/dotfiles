require("typescript-tools").setup({
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
