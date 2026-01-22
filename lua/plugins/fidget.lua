return {
  "j-hui/fidget.nvim",
  opts = {
    notification = {
      window = {
        winblend = 0,
      },
    },
  },
  config = function(_, opts)
    require("fidget").setup(opts)

    -- Force the highlight groups to have no background color
    vim.api.nvim_set_hl(0, "FidgetTitle", { bg = "NONE", ctermbg = "NONE" })
    vim.api.nvim_set_hl(0, "FidgetTask", { bg = "NONE", ctermbg = "NONE" })
  end,
}
