local actions = require("telescope.actions")

require("telescope").setup({
  defaults = {
    layout_config = {
      prompt_position = "top",
    },
    sorting_strategy = "ascending",
    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<C-s>"] = actions.cycle_previewers_next,
        ["<C-a>"] = actions.cycle_previewers_prev,
        ["<C-h>"] = "which_key",
        ["<ESC>"] = actions.close,
      },
      n = {
        ["<C-s>"] = actions.cycle_previewers_next,
        ["<C-a>"] = actions.cycle_previewers_prev,
      },
    },
  },
})

require("telescope").load_extension("fzf")

local M = { pickers = {} }

M.pickers.fd = function(state)
  vim.print(state)
  require("telescope.builtin").find_files({
    find_command = { "fd", "-H", "--type", "f", "-E", ".git" },
  })
end

M.pickers.grep = function()
  require("telescope.builtin").live_grep()
end

return M
