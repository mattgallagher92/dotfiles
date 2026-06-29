-- Must be set before loading plugins so that key maps use correct leader keys.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.shiftwidth = 4
vim.opt.undofile = true

vim.keymap.set("n", "<leader>X", "<cmd>source %<CR>", { desc = "Source file (lua)" })
vim.keymap.set("n", "<leader>x", ":.lua<CR>", { desc = "Source line (lua)" })
vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "Source line (lua)" })

vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write file" })

vim.keymap.set("n", "<M-n>", "<cmd>cnext<CR>", { desc = "Next quickfix item" })
vim.keymap.set("n", "<M-p>", "<cmd>cprev<CR>", { desc = "Previous quickfix item" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight after yanking text",
  group = vim.api.nvim_create_augroup("mattg-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

require("config.lazy")
require("config.treesitter")
require("config.lsp")
require("config.terminal")
