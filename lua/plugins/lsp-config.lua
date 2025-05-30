return {
	{
		"mason-org/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local on_attach = function(_, bufnr)
				local opts = { buffer = bufnr }
				vim.keymap.set("n", "K", vim.lsp.buf.hover, {}, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, {}, opts)
				vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {}, opts)
			end

			local lspconfig = require("lspconfig")
			local servers = {
				"lua_ls",
				"jdtls",
				"clangd",
				"ts_ls",
				"intelephense",
				"bashls",
				"html",
				"csharp_ls",

				-- Add as needed
			}

			for _, server in ipairs(servers) do
				lspconfig[server].setup({
					capabilities = capabilities,
					on_attach = on_attach,
				})
			end
		end,
	},
}
