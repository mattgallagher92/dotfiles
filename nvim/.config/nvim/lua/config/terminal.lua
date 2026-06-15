vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

local job_id = 0
vim.keymap.set("n", "<leader>to", function()
  vim.cmd.new()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 20)

  job_id = vim.bo.channel
end)

local current_command = ""
vim.keymap.set("n", "<leader>te", function()
  current_command = vim.fn.input("Command: ")
end)

vim.keymap.set("n", "<leader>tr", function()
  if current_command == "" then
    current_command = vim.fn.input("Command: ")
  end

  vim.fn.chansend(job_id, { current_command, "" })
end)
