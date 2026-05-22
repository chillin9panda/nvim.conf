return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")

    ts.setup({
      install_dir = vim.fn.stdpath('data') .. '/site'
    })

    ts.install({
      "python", "bash", "cpp", "c_sharp", "css", "javascript", "typescript",
      "jsx", "tsx", "ini", "ssh_config", "git_config", "gitcommit", "properties", "sql",
      "php", "java", "kotlin", "lua", "cmake", "scss",
      "xml", "html", "yaml", "json", "markdown", "markdown_inline",
      "vim", "vimdoc", "query", "regex"
    })

    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        local bufnr = args.buf

        if vim.bo[bufnr].buftype ~= "" then
          return
        end

        local ft = vim.bo[bufnr].filetype
        local lang = vim.treesitter.language.get_lang(ft) or ft

        local ok, _ = pcall(vim.treesitter.get_parser, bufnr, lang)
        if ok then
          vim.treesitter.start(bufnr)
        end
      end,
    })

    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        local bufnr = args.buf
        if vim.bo[bufnr].buftype == "" then
          local ft = vim.bo[bufnr].filetype
          local lang = vim.treesitter.language.get_lang(ft) or ft
          if pcall(vim.treesitter.get_parser, bufnr, lang) then
            vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end
      end,
    })
  end,
}
