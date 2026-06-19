return {
  {
    -- blink.cmp  Rust fuzzy matcher not available, falling back to Lua implementation.
    -- blink.cmp  V2 uses a new build/download system for the native library. Please add  build = function() require('blink.cmp').build():pwait() end  to your lazy.nvim config. See  :h blink-cmp-installation  for more information.
    "saghen/blink.cmp",
    dependencies = {
      "saghen/blink.lib",
      -- optional: provides snippets for the snippet source
      -- 'rafamadriz/friendly-snippets',
    },
    build = function()
      -- build the fuzzy matcher, optionally add a timeout to `pwait(timeout_ms)`
      -- you can use `gb` in `:Lazy` to rebuild the plugin as needed
      require("blink.cmp").build():pwait()
    end,

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = "default" },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        per_filetype = {
          sql = { "snippets", "dadbod", "buffer" },
        },
        -- add vim-dadbod-completion to your completion providers
        providers = {
          dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
        },
      },
    },
  },
}
