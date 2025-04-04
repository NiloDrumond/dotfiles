local wk = require("which-key")

wk.setup({})

-- Neowords
local ok, neowords = pcall(require, "configs.neowords")
if ok then
  local subword_hops = neowords.hops
  wk.add({
    mode = { "n", "v", "o" },
    { "w",  subword_hops.forward_start,  desc = "Next word" },
    { "e",  subword_hops.forward_end,    desc = "Next end of word" },
    { "b",  subword_hops.backward_start, desc = "Previous word" },
    { "ge", subword_hops.backward_end,   desc = "Previous end of word" },
  })
end

-- LuaSnip
local ls_ok, ls = pcall(require, "luasnip")
if ls_ok then
  wk.add({
    mode = "i",
    {
      "<C-h>",
      function()
        ls.jump(-1)
      end,
      desc = "LuaSnip: jump backward",
    },
    {
      "<C-l>",
      function()
        ls.jump(1)
      end,
      desc = "LuaSnip: jump forward",
    },
    {
      "<C-h>",
      function()
        ls.expand()
      end,
      desc = "LuaSnip: expand",
    },
    {
      "<C-h>",
      function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end,
      desc = "LuaSnip: change active choice",
    },
  })
end

-- Normal mappings
wk.add({
  mode = "n",
  { "<C-Enter>", "<cmd>call append(line('.'), '')<cr>",   desc = "Add line below" },
  { "<S-Enter>", "<cmd>call append(line('.')-1, '')<cr>", desc = "Add line above" },
  { "<F1>",      "",                                      hidden = true },
  { "<F8>",      "<cmd>TagbarToggle<CR>",                 desc = "Tagbar" },
  {
    "gd",
    function()
      vim.lsp.buf.definition()
    end,
    desc = "Go to definition",
  },
  {
    "gr",
    function()
      vim.lsp.buf.references({ includeDeclaration = false })
    end,
    desc = "Go to references",
  },
  {
    "gD",
    function()
      vim.lsp.buf.declaration()
    end,
    desc = "Go to declaration",
  },
  { "]c", "<cmd>Gitsigns next_hunk<CR>", desc = "Next git hunk" },
  { "[c", "<cmd>Gitsigns prev_hunk<CR>", desc = "Prev git hunk" },
  {
    "[w",
    function()
      vim.diagnostic.goto_prev({
        float = { border = "rounded", max_width = 100 },
        severity = {
          vim.diagnostic.severity.WARN,
          vim.diagnostic.severity.INFO,
          vim.diagnostic.severity.HINT,
        },
      })
    end,
    desc = "Prev non-error diagnostic",
  },
  {
    "]w",
    function()
      vim.diagnostic.goto_next({
        float = { border = "rounded", max_width = 100 },
        severity = {
          vim.diagnostic.severity.WARN,
          vim.diagnostic.severity.INFO,
          vim.diagnostic.severity.HINT,
        },
      })
    end,
    desc = "Next non-error diagnostic",
  },
  {
    "[g",
    function()
      vim.diagnostic.goto_prev({
        float = { border = "rounded", max_width = 100 },
        severity = vim.diagnostic.severity.ERROR,
      })
    end,
    desc = "Prev error",
  },
  {
    "]g",
    function()
      vim.diagnostic.goto_next({
        float = { border = "rounded", max_width = 100 },
        severity = vim.diagnostic.severity.ERROR,
      })
    end,
    desc = "Next error",
  },
  {
    "gl",
    function()
      vim.diagnostic.open_float({ border = "rounded", max_width = 100 })
    end,
    desc = "Diagnostics",
  },
  {
    "K",
    function()
      vim.lsp.buf.hover()
    end,
    desc = "LSP Hover",
  },
  {
    "M",
    function()
      vim.lsp.buf.signature_help()
    end,
    desc = "Signature help",
  },
  {
    "gi",
    function()
      vim.lsp.buf.implementations()
    end,
    desc = "Go to implementation",
  },
  {
    "<BS>",
    function()
      vim.cmd("noh")
      vim.api.nvim_input("<ESC>")
    end,
    desc = "Clear highlights",
  },
  { "yA",    "ggVGy",  desc = "Yank buffer" },
  { "<C-s>", ":w<CR>", desc = "Save file" },
  { "<C-h>", "<C-w>h", desc = "Move to left window" },
  { "<C-j>", "<C-w>j", desc = "Move to bottom window" },
  { "<C-k>", "<C-w>k", desc = "Move to top window" },
  { "<C-l>", "<C-w>l", desc = "Move to right window" },
})

-- Leader Mappings

wk.add({
  mode = "n",

  { "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', desc = "Toggle Spectre" },
  { "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', desc = "Spectre current word" },
  { "<leader>0", "<cmd>vertical resize -5<CR>",              desc = "Resize -5" },
  { "<leader>-", "<cmd>vertical resize +5<CR>",              desc = "Resize +5" },
  { "<leader>x", ":q<CR>",                                   desc = "Close" },
  { "<leader>n", group = "Notes" },
  {
    "<leader>pn",
    function()
      require("gitpad").toggle_gitpad({ title = "Project notes" })
    end,
    desc = "Project notes",
  },
  {
    "<leader>pd",
    function()
      local date_filename = "daily-" .. os.date("%Y-%m-%d.md")
      require("gitpad").toggle_gitpad({ filename = date_filename, title = "Daily notes" })
    end,
    desc = "Daily notes",
  },
  { "<leader>b",  "<cmd>Telescope buffers<CR>",      desc = "Buffer" },
  {
    "<leader><leader>",
    function()
      vim.lsp.buf.format({ async = true })
    end,
    desc = "Format",
  },
  { "<leader>Y",  ":let @+=getreg()<CR>",            desc = 'Register " to clipboard' },
  { "<leader>y",  "<cmd>Telescope yank_history<CR>", desc = "Yank history" },
  { "<leader>p",  '"+p',                             desc = "Paste(p) from clipboard" },
  { "<leader>P",  'o<ESC>"+p',                       desc = "Paste(P) from clipboard" },
  { "<leader>af", "<cmd>NvimTreeToggle<cr>",         desc = "Toggle tree" },
  { "<leader>a",  group = "Actions" },
  { "<leader>az", "<cmd>ZenMode<cr>",                desc = "Zen mode" },
  { "<leader>ae", "<cmd>ene<cr>",                    desc = "New buffer" },
  { "<leader>e",  "<cmd>NvimTreeFindFile<CR>",       desc = "Tree: Find file" },
  { "<leader>ar", "<cmd>set norelativenumber!<CR>",  desc = "Toggle relative numbers" },
  { "<leader>f",  group = "Find" },
  {
    "<leader>fc",
    function()
      local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
      live_grep_args_shortcuts.grep_word_under_cursor()
    end,
    desc = "Grep word under cursor",
  },
  {
    "<leader>fw",
    function()
      require("configs.telescope").pickers.grep()
    end,
    desc = "Find word",
  },
  {
    "<leader>ff",
    function()
      require("configs.telescope").pickers.fd()
    end,
    desc = "Find file",
  },
  {
    "<leader>fr",
    "<cmd>Telescope resume<CR>",
    desc = "Resume Telescope",
  },
  { "<leader>/",  group = "Neovim" },
  { "<leader>//", "<cmd>Alpha<CR>",     desc = "Dashboard" },
  { "<leader>/u", "<cmd>Lazy sync<CR>", desc = "Update Lazy" },
  { "<leader>/q", "<cmd>qa<CR>",        desc = "Quit" },
})

-- Lsp Normal Mappings

wk.add({
  mode = "n",
  { "<leader>c", group = "LSP" },
  {
    "<leader>ca",
    function()
      vim.lsp.buf.code_action()
    end,
    desc = "Code action",
  },
  {
    "<leader>cr",
    function()
      vim.lsp.buf.rename()
    end,
    desc = "Rename",
  },
  {
    "<leader>cf",
    function()
      vim.lsp.buf.format({ async = true })
    end,
    desc = "Format",
  },
})

-- Git Normal Mappings

wk.add({
  mode = "n",
  { "<leader>g",  group = "Git" },
  { "<leader>gg", "<cmd>LazyGit<CR>",              desc = "Lazygit" },
  { "<leader>gb", "<cmd>Gitsigns blame_line<CR>",  desc = "Blame line" },
  { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Git status" },
  { "<leader>gl", group = "Log" },
  {
    "<leader>glA",
    function()
      require("configs.telescope").pickers.git_commits()
    end,
    desc = "commits (Telescope)",
  },
  {
    "<leader>glC",
    function()
      require("configs.telescope").pickers.git_buffer_commits()
    end,
    desc = "buffer commits (Telescope)",
  },
  {
    "<leader>gla",
    "<cmd>LazyGitFilter<CR>",
    desc = "commits (Lazygit)",
  },
  {
    "<leader>glc",
    "<cmd>LazyGitFilterCurrentFile<CR>",
    desc = "buffer commits (Lazygit)",
  },
})

-- Visual and Normal mappings
wk.add({
  mode = { "n", "v" },
  { "x",     '"_x',    hidden = true },
  { "<C-s>", ":w<CR>", desc = "Save file" },
})

-- Visual mappings
wk.add({
  mode = "v",
  { "p",     '"_dp',                hidden = true },
  { "<S-j>", ":move '>+1<CR>gv-gv", desc = "Move line down" },
  { "<S-k>", ":move '<-2<CR>gv-gv", desc = "Move line up" },
})

-- Visual leader mappings

wk.add({
  mode = "v",
  { "<leader>s", ":Subvert/", desc = "Subvert inside selection" },
  { "<leader>sw", '<cmd>lua require("spectre").open_visual()<CR>', desc = "Spectre current word" },
  { "<leader>S", ":s/\\%V",   desc = "Replace inside selection" },
  {
    "<leader>p",
    '"+p',
    desc = "Paste(p) from clipboard",
  },
  {
    "<leader>P",
    '"+P',
    desc = "Paste(P) from clipboard",
  },
  {
    "<leader>c",
    function()
      vim.lsp.buf.code_action()
    end,
    desc = "Code action",
  },
})

-- local insert_mappings = {
--   ["<C-s>"] = { "<ESC> :w<CR>", "Save file" },
--   ["<C-p>"] = { "<C-r>", "Paste" },
-- }

-- Insert mappings
wk.add({
  mode = "i",
  {
    { "<C-s>", "<ESC> :w<cr>", desc = "Save file" },
  },
})
