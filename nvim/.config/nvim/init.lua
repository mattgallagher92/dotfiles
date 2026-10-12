-- Must be set before loading plugins so that key maps use correct leader keys.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.clipboard = "unnamedplus"

vim.opt.undofile = true

vim.opt.number = true
vim.opt.relativenumber = true

-- Always show the sign column to prevent 'jumping' when the it is added.
vim.opt.signcolumn = "yes"

vim.opt.shiftwidth = 4
-- Use shiftwidth value as softtabstop value
vim.opt.softtabstop = -1

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.keymap.set("n", "<leader>X", "<cmd>source %<CR>", { desc = "Source file (lua)" })
vim.keymap.set("n", "<leader>x", ":.lua<CR>", { desc = "Source line (lua)" })
vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "Source line (lua)" })

vim.keymap.set("n", "<leader>ww", ":w<CR>", { desc = "Write current buffer" })
vim.keymap.set("n", "<leader>wa", ":wa<CR>", { desc = "Write all buffers" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight after yanking text",
  group = vim.api.nvim_create_augroup("mattg-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.hl_op()
  end,
})

require("config.quickfix")
require("config.lazy")
require("config.treesitter")
require("config.lsp")
require("config.terminal")
