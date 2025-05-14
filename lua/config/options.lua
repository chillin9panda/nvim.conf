-- Line number
vim.opt.number = true

--Tab
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Clipboard sharing
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

