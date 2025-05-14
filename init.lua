-- Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
  {"ellisonleao/gruvbox.nvim", name="gruvbox", priority = 1000},
  {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
}
local opts = {}

vim.g.mapleader = " "


require("lazy").setup(plugins, opts)

-- telesecope
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader><leader>', builtin.find_files, {})
vim.keymap.set('n', '<leader>/', builtin.live_grep, {})

-- treesitter
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"lua", "java", "javascript", "python", "markdown", "cpp", "php"},
  highlight = { enable = true },
  indent = { enable = true},
})



require("gruvbox").setup()

vim.cmd.colorscheme("gruvbox")

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

