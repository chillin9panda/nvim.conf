-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.del("n", "<leader>e")
vim.keymap.del("n", "<leader>E")

-- Disable arrow keys in normal, insert, and visual modes
for _, mode in ipairs({ "n", "i", "v" }) do
  vim.keymap.set(mode, "<Up>", "<Nop>", { desc = "Disable Up Arrow" })
  vim.keymap.set(mode, "<Down>", "<Nop>", { desc = "Disable Down Arrow" })
  vim.keymap.set(mode, "<Left>", "<Nop>", { desc = "Disable Left Arrow" })
  vim.keymap.set(mode, "<Right>", "<Nop>", { desc = "Disable Right Arrow" })
end

-- Disable mouse
vim.o.mouse = ""

-- Swap caps-lock and esc
