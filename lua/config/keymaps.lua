-- Disable arrow keys in normal, insert, and visual modes
for _, mode in ipairs({ "n", "i", "v" }) do
  vim.keymap.set(mode, "<Up>", "<Nop>", { desc = "Disable Up Arrow" })
  vim.keymap.set(mode, "<Down>", "<Nop>", { desc = "Disable Down Arrow" })
  vim.keymap.set(mode, "<Left>", "<Nop>", { desc = "Disable Left Arrow" })
  vim.keymap.set(mode, "<Right>", "<Nop>", { desc = "Disable Right Arrow" })
end
