-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local themes = {
  "tokyonight",
  "catppuccin-mocha",
  "gruvbox",
  "kanagawa",
  "cyberdream",
  "everforest",
  "onedark",
  "nord",
  "bamboo",
  "rose-pine",
  -- "oxocarbon",
  -- "nightfox",
  -- "sonokai",
  -- "github_dark_dimmed",
  "vscode",
  "dracula",
  "eldritch",
  "night-owl",
}
local theme_idx = 1
vim.keymap.set("n", "<leader>ut", function()
  theme_idx = (theme_idx % #themes) + 1
  vim.cmd.colorscheme(themes[theme_idx])
  vim.notify("Theme: " .. themes[theme_idx])
end, { desc = "Cycle Theme" })

local map = vim.keymap.set
map("n", "<leader>ff", function()
  Snacks.picker.files()
end, { desc = "Find Files" })
map("n", "<leader>fg", function()
  Snacks.picker.grep()
end, { desc = "Live Grep" })
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
