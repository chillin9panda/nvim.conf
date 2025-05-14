vim.o.signcolumn = "yes"

return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({

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
		})
	end,
}
