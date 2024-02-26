local is_cargo = vim.fn.expand("%:t") == "Cargo.toml"
local bufnr = vim.api.nvim_get_current_buf()

if is_cargo then
  local wk_ok, wk = pcall(require, "which-key")
  local crates_ok, crates = pcall(require, "crates")
  local WK = require("utils").WK

  if not wk_ok or not crates_ok then
    return
  end

  local normal_leader_mappings = {
    ["c"] = {
      ["t"] = { crates.toggle, "Toggle crates" },
      ["r"] = { crates.reload, "Reload crates" },
      ["v"] = { crates.show_versions_popup, "Show versions popup" },
      ["f"] = { crates.show_features_popup, "Show features popup" },
      ["d"] = { crates.show_dependencies_popup, "Show dependencies popup" },
      ["u"] = { crates.update_crate, "Update crate" },
      ["a"] = { crates.update_all_crates, "Update all crates" },
      ["U"] = { crates.upgrade_crate, "Upgrade crate" },
      ["A"] = { crates.upgrade_all_crates, "Upgrade all crates" },
      ["x"] = { crates.expand_plain_crate_to_inline_table, "Expand crate to inline table" },
      ["X"] = { crates.extract_crate_into_table, "Extract crate into table" },
      ["H"] = { crates.open_homepage, "Open homepage" },
      ["R"] = { crates.open_repository, "Open repository" },
      ["D"] = { crates.open_documentation, "Open documentation" },
      ["C"] = { crates.open_crates_io, "Open crates.io" },
    },
  }

  local visual_leader_mappings = {
    ["c"] = {
      ["U"] = { crates.upgrade_crates, "Upgrade crates" },
      ["u"] = { crates.update_crates, "Update crates" },
    },
  }

  wk.register(normal_leader_mappings, WK.make_opts(WK.Normal, WK.leader, bufnr))
  wk.register(visual_leader_mappings, WK.make_opts(WK.Visual, WK.leader, bufnr))
end
