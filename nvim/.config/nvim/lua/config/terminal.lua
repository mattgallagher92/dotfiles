vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

local job_id = 0
local open_term = function()
  vim.cmd.new()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 20)

  job_id = vim.bo.channel
end
vim.keymap.set("n", "<leader>to", open_term, { desc = "[T]erminal [o]pen" })

local current_command = ""
local edit_term_command = function()
  current_command = vim.fn.input("Command: ")
end
vim.keymap.set("n", "<leader>te", edit_term_command, { desc = "[T]erminal [e]dit command" })

local run_term_command = function()
  if current_command == "" then
    current_command = vim.fn.input("Command: ")
  end

  vim.fn.chansend(job_id, { current_command, "" })
end
vim.keymap.set("n", "<leader>tr", run_term_command, { desc = "[T]erminal [r]un command" })
