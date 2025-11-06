vim.opt.updatetime = 200
vim.opt.timeoutlen = 300

vim.opt.hlsearch = true

-- Line number
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.fillchars:append({ eob = " " })

--Tab
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Clipboard sharing
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

vim.opt.undofile = true

-- Disable mouse
vim.o.mouse = ""
