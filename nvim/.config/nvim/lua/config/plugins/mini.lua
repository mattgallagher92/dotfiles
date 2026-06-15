return { 
  'nvim-mini/mini.nvim',
  config = function()
    local statusline = require 'mini.statusline'
    statusline.setup()
  end
}
