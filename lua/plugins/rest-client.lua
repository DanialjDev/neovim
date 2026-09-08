-- ~/.config/nvim/lua/plugins/rest-client.lua
return {
  "mistweaverco/kulala.nvim",
  ft = "http",
  opts = {},
  keys = {
    { "<leader>rr", "<cmd>lua require('kulala').run()<cr>", desc = "Run HTTP request" },
    { "<leader>rt", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Toggle request/response view" },
  },
}
