local is_cargo = vim.fn.expand("%:t") == "Cargo.toml"
local bufnr = vim.api.nvim_get_current_buf()

if is_cargo then
  local wk_ok, wk = pcall(require, "which-key")
  local crates_ok, crates = pcall(require, "crates")

  if not wk_ok or not crates_ok then
    return
  end

  wk.add({
    mode = "n",
    { "<leader>ct", crates.toggle,                             desc = "Toggle crates" },
    { "<leader>ct", crates.reload,                             desc = "Reload crates" },
    { "<leader>ct", crates.show_versions_popup,                desc = "Show versions popup" },
    { "<leader>ct", crates.show_features_popup,                desc = "Show features popup" },
    { "<leader>ct", crates.show_dependencies_popup,            desc = "Show dependencies popup" },
    { "<leader>ct", crates.update_crate,                       desc = "Update crate" },
    { "<leader>ct", crates.update_all_crates,                  desc = "Update all crates" },
    { "<leader>ct", crates.upgrade_crate,                      desc = "Upgrade crate" },
    { "<leader>ct", crates.upgrade_all_crates,                 desc = "Upgrade all crates" },
    { "<leader>ct", crates.expand_plain_crate_to_inline_table, desc = "Expand crate to inline table" },
    { "<leader>ct", crates.extract_crate_into_table,           desc = "Extract crate into table" },
    { "<leader>ct", crates.open_homepage,                      desc = "Open homepage" },
    { "<leader>ct", crates.open_repository,                    desc = "Open repository" },
    { "<leader>ct", crates.open_documentation,                 desc = "Open documentation" },
    { "<leader>ct", crates.open_crates_io,                     desc = "Open crates.io" },
  }, { bufnr = bufnr })
  wk.add({
    mode = "v",
    { "<leader>cu", crates.update_crates,  desc = "Update crates" },
    { "<leader>cU", crates.upgrade_crates, desc = "Upgrade crates" },
  }, { bufnr = bufnr })
end
