require('plugins')
require('mappings')
require('settings')
require('options')
require('lualine_config')

-- https://github.com/OmniSharp/omnisharp-roslyn/issues/2483#issuecomment-1539809155
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		local function toSnakeCase(str)
			return string.gsub(str, "%s*[- ]%s*", "_")
		end

		if client.name == 'omnisharp' then
			local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
			for i, v in ipairs(tokenModifiers) do
				tokenModifiers[i] = toSnakeCase(v)
			end
			local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
			for i, v in ipairs(tokenTypes) do
				tokenTypes[i] = toSnakeCase(v)
			end
		end
	end,
})

local lspconfig = require('lspconfig')

on_attach = function(client, bufnr)
	if pcall(function() return vim.api.nvim_buf_get_var(bufnr, 'UserLspAttached') == 1 end) then
		return
	end
	vim.api.nvim_buf_set_var(bufnr, 'UserLspAttached', 1)

	-- require('user.lsp.navic').try_attach(client, bufnr)

	-- require('user.settings.keymaps').lsp_setup(client, bufnr)
end

capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if cmp_ok then
	capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)
else
	print("Couldn't load 'cmp_nvim_lsp' nor update capabilities")
end

capabilities.offsetEncoding = { 'utf-16' }

local user_default = {
	on_attach    = on_attach,
	capabilities = capabilities,
}

-- require('user.lsp.custom')(user_default)

lspconfig.gdscript.setup(user_default)
