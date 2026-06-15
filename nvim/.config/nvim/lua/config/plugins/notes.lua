return {
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    event = {
      'BufReadPre ' .. vim.fn.expand '~' .. '/obsidian/**/*.md',
      'BufNewFile ' .. vim.fn.expand '~' .. '/obsidian/**/*.md',
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      -- UI features require conceallevel, which I don't like.
      ui = { enable = false },
      workspaces = {
        {
          name = 'external-brain',
          path = '~/obsidian/external-brain',
        },
      },
    },
    keys = {
      { '<leader>ob', vim.cmd.ObsidianBacklinks, desc = '[O]bsidian [B]acklinks' },
      { '<leader>oc', vim.cmd.ObsidianCheck,     desc = '[O]bsidian [C]heck' },
      { '<leader>od', vim.cmd.ObsidianDailies,   desc = '[O]bsidian [D]ailies' },
      {
        '<leader>oe',
        function()
          local title = vim.fn.input 'New note title: '
          vim.cmd.ObsidianExtractNote(title)
        end,
        mode = 'v',
        desc = '[O]bsidian [E]xtractNote',
      },
      { '<leader>of', vim.cmd.ObsidianFollowLink,  desc = '[O]bsidian [F]ollowLink' },
      { '<leader>ot', vim.cmd.ObsidianTags,        desc = '[O]bsidian Ta[gs' },
      { '<leader>ol', vim.cmd.ObsidianLink,        desc = '[O]bsidian [L]ink' },
      { '<leader>on', vim.cmd.ObsidianNew,         desc = '[O]bsidian [N]ew' },
      { '<leader>oo', vim.cmd.ObsidianOpen,        desc = '[O]bsidian [O]pen' },
      { '<leader>op', vim.cmd.ObsidianPasteImg,    desc = '[O]bsidian [P]asteImg' },
      { '<leader>oq', vim.cmd.ObsidianQuickSwitch, desc = '[O]bsidian [Q]uickSwitch' },
      { '<leader>or', vim.cmd.ObsidianRename,      desc = '[O]bsidian [R]ename' },
      { '<leader>os', vim.cmd.ObsidianSearch,      desc = '[O]bsidian [S]earch' },
      { '<leader>ot', vim.cmd.ObsidianToday,       desc = '[O]bsidian [T]oday' },
      { '<leader>ow', vim.cmd.ObsidianWorkspace,   desc = '[O]bsidian [W]orkspace' },
      { '<leader>oy', vim.cmd.ObsidianYesterday,   desc = '[O]bsidian [Y]esterday' },
    },
  }
}
