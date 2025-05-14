return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
     ensure_installed = {"lua", "java", "javascript", "python", "markdown", "cpp", "php"},
     highlight = { enable = true },
     indent = { enable = true},
    })
  end
}
