-- Highlight definitions instantly via Treesitter
local ts_ok, ts_configs = pcall(require, "nvim-treesitter.configs")
if ts_ok then
  ts_configs.setup({
    refactor = {
      highlight_definitions = { enable = true },
      highlight_current_scope = { enable = true },
    },
  })
end

-- Async LSP highlight
local augroup = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = augroup,
  callback = function()
    vim.lsp.buf.clear_references()
    vim.lsp.buf.document_highlight()
  end,
})
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
  group = augroup,
  callback = function()
    vim.lsp.buf.clear_references()
  end,
})
