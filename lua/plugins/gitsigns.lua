return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gitsigns = require("gitsigns")

    gitsigns.setup({
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "-" },
        topdelete = { text = "_" },
        changedelete = { text = "~" },
      },

      preview_config = {
        border = "none",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },

      current_line_blame_opts = {
        delay = 0,
        virt_text = true,
        virt_text_pos = "eol",
      },
      current_line_blame_formatter = " <author> • <summary>",
    })

    --Keymap
    vim.keymap.set("n", "<leader>gb", gitsigns.toggle_current_line_blame, {
      desc = ""
    })
  end,
}
