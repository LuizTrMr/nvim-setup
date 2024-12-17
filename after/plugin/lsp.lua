require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"gopls",
	}
})

local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
	if pcall(function() return vim.api.nvim_buf_get_var(bufnr, 'UserLspAttached') == 1 end) then
		return
	end

	local opts = { noremap = true, buffer = bufnr }

	local gd = function()
		if vim.fn.bufnr() == bufnr then
			require("telescope.builtin").lsp_definitions()
		else
			vim.cmd("normal! gd")
		end
	end

	opts.desc = "Go to definition"
	vim.keymap.set("n", "gd", gd, opts)
	vim.keymap.set("v", "gd", gd, opts)

	opts.desc = "Show documentation"
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

	opts.desc = "Rename"
	vim.keymap.set("n", "grn", vim.lsp.buf.rename, opts)
	vim.keymap.set("v", "grn", vim.lsp.buf.rename, opts)

	opts.desc = "References"
	vim.keymap.set("n", "grr", require("telescope.builtin").lsp_references, opts)
	vim.keymap.set("v", "grr", require("telescope.builtin").lsp_references, opts)

	opts.desc = "Go to next error"
	vim.keymap.set("n", "gen", vim.diagnostic.goto_next, opts)

	opts.desc = "Go to prev error"
	vim.keymap.set("n", "geN", vim.diagnostic.goto_prev, opts)

	opts.desc = "Show all errors"
	vim.keymap.set("n", "gea", require('telescope.builtin').diagnostics, opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if cmp_ok then
	capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

lspconfig.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "gopls" },
	settings = {
		gopls = {
			completeUnimported = true,
		}
	}
})

lspconfig.gdscript.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.ols.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "ols" },
	init_options = {
		enable_format            = false,
		enable_snippets          = true,
		enable_procedure_snippet = true,
		enable_hover             = true,
		enable_references        = true,
		enable_procedure_context = true,
		enable_document_symbols  = true,
	},
})
