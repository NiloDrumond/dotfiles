require("neo-tree").setup({
  popup_border_style = "NC",
  filesystem = {
    components = {
      symlink = function(_, node, _)
        if node.is_link then
          return {
            text = " -> " .. node.link_to,
          }
        end
        return {}
      end,
      arrow = function(_, node, _)
        local arrow_ok, _ = pcall(require, "arrow")
        if arrow_ok then
          local persist = require("arrow.persist")
          local cwd = vim.fn.getcwd()
          local escaped_cwd = cwd:gsub("[%(%)%.%%%+%-%*%?%[%]%^%$]", "%%%1")
          local relative_path = node.path:gsub("^" .. escaped_cwd .. "/", "")
          local index = persist.is_saved(relative_path)
          if index then
            return {
              text = "󱡁 " .. index,
              highlight = "ArrowIcon",
            }
          end
          return {}
        end
      end,
    },
    renderers = {
      directory = {
        { "icon" },
        { "name",       use_git_status_colors = true },
        { "symlink" },
        { "diagnostics" },
        { "git_status" },
      },
      file = {
        { "icon" },
        { "name",       use_git_status_colors = true },
        { "arrow" },
        { "symlink" },
        { "diagnostics" },
        { "git_status" },
      },
    },
    filtered_items = {
      hide_dotfiles = false,
    },
  },
})
