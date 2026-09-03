return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")

    ts.setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    ts.install({
      "python", "bash", "cpp", "c_sharp", "css", "javascript", "typescript", "jsx", "tsx",
      "ini", "ssh_config", "git_config", "gitcommit", "properties", "gitignore",
      "sql", "php", "java", "kotlin", "lua", "cmake", "scss",
      "xml", "html", "yaml", "json", "markdown", "markdown_inline",
      "vim", "vimdoc", "query", "regex",
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local bufnr = args.buf
        if vim.bo[bufnr].buftype ~= "" then return end

        local ft = vim.bo[bufnr].filetype
        local lang = vim.treesitter.language.get_lang(ft) or ft

        if pcall(vim.treesitter.language.add, lang) then
          pcall(vim.treesitter.start, bufnr, lang)

          if ft == "cs" or ft == "c_sharp" then
            vim.bo[bufnr].indentexpr = ""
            vim.bo[bufnr].cindent = true
            vim.bo[bufnr].cinoptions = "g0,:0,(0,U1"
          else
            vim.bo[bufnr].indentexpr = "v:lua.vim.treesitter.indent.get_indent()"
          end
        end
      end,
    })
  end,
}
