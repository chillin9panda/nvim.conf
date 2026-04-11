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
      "tsx", "jsx", "ini", "ssh_config", "git_config",
      "php", "java", "kotlin", "lua", "cmake", "scss",
      "xml", "html", "yaml", "json", "markdown", "markdown_inline",
      -- Neovim internal essentials
      "vim", "vimdoc", "query", "regex", "lua"
    })

    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        local bufnr = args.buf

        if vim.bo[bufnr].buftype ~= "" then
          return
        end

        local ft = vim.bo[bufnr].filetype
        local lang = vim.treesitter.language.get_lang(ft) or ft

        local has_lang = pcall(vim.treesitter.language.add, lang)

        if has_lang then
          local ok, _ = pcall(vim.treesitter.get_parser, bufnr, lang)
          if ok then
            vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end
      end,
    })
  end,
}
