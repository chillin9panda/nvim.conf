-- switch to conform.nvim

return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },

  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.shfmt,
        -- null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.stylelint,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.phpcsfixer,
      },

      -- Auto format on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      }),

      vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {}),
    })
  end,
}
