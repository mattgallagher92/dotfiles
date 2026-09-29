vim.keymap.set("n", "<M-n>", "<cmd>cnext<CR>zz", { desc = "Next quickfix item" })
vim.keymap.set("n", "<M-p>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix item" })

vim.keymap.set("n", "<leader>co", "<cmd>copen<CR>", { desc = "Open quickfix list" })
vim.keymap.set("n", "<leader>cc", "<cmd>cclose<CR>", { desc = "Close quickfix list" })

vim.keymap.set("n", "<leader>cf", "<cmd>cfirst<CR>", { desc = "First quickfix item" })
vim.keymap.set("n", "<leader>cl", "<cmd>clast<CR>", { desc = "Last quickfix item" })

vim.keymap.set("n", "<leader>cp", "<cmd>colder<CR>", { desc = "Open older quickfix list" })
vim.keymap.set("n", "<leader>cn", "<cmd>cnewer<CR>", { desc = "Open newer quickfix list" })
