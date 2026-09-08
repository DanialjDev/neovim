-- ~/.config/nvim/lua/plugins/colors-and-quality-of-life.lua
return {
  -- inline hex/tailwind color previews (complements lang.tailwind)
  {
    "brenoprata10/nvim-highlight-colors",
    event = "VeryLazy",
    opts = { enable_tailwind = true },
  },
  -- better TS/JS refactors: rename file + update imports, organize imports, etc.
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
}
