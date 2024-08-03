require('helpers/globals')
require('helpers/keyboard')

local wk = require('which-key')

-- Global {{{
wk.register = {
    { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find in files" },
    { "<leader>o", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>p", "<cmd>Telescope oldfiles<cr>", desc = "Previous files" },
    { "K", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover information" },
    { "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Go to declaration" },
    { "gr", "<cmd>Telescope lsp_references<cr>", desc = "Go to references" },
}
-- }}}

-- LSP {{{
wk.register = {
    l = {
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code action" },
      name = "LSP",
      r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename symbol" }
    },
    prefix = "<leader>"
  }
-- }}}

-- Telescope {{{
wk.register= {
    { "<leader>t", group = "Telescope" },
    { "<leader>tb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>tf", group = "Live Grep" },
    { "<leader>tfg", desc = "<cmd>Telescope live_grep" },
    { "<leader>tg", group = "Git" },
    { "<leader>tgb", "<cmd>Telescope git_branches<cr>", desc = "Git branches" },
    { "<leader>tgo", "<cmd>Telescope git_files<cr>", desc = "Git files" },
    { "<leader>tj", "<cmd>Telescope jumplist<cr>", desc = "Jumplist" },
    { "<leader>to", "<cmd>Telescope find_files<CR>", desc = "Find files" },
    { "<leader>tp", "<cmd>Telescope oldfiles<cr>", desc = "Oldfiles" },
    { "<leader>tq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix list" },
    { "<leader>tr", "<cmd>Telescope resume<cr>", desc = "Previous Telescope window" },
    { "<leader>ts", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace symbols" },
    { "<leader>tt", "<cmd>Telescope<cr>", desc = "Open Telescope" },
  }
-- }}}

-- Nvim-Tree {{{
wk.register = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Show file explorer" },
  }
--- }}}

-- Trouble {{{
wk.register = {
    { "<leader>x", "<cmd>Trouble diagnostics toggle<cr>", desc = "Toggle trouble" },
  }
-- }}}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
