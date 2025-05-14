return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed={
          "lua_ls",
          "ts_ls",
          "clangd",
          "bashls",
          "jdtls",
          "intelephense",
          -- Add as needed
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.jdtls.setup({})
      lspconfig.clangd.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.intelephense.setup({})
      lspconfig.bashls.setup({})
      -- Add as needed

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
