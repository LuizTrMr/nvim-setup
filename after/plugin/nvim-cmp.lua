local cmp   = require('cmp')
local lsnip = require('luasnip')

vim.keymap.set({ "i","s" }, "<C-l>", function()
	if lsnip.expand_or_jumpable() then
		lsnip.expand_or_jump()
	end
end, {silent = true})

vim.keymap.set({ "i","s" }, "<C-j>", function()
	if lsnip.jumpable(-1) then
		lsnip.jump(-1)
	end
end, {silent = true})

local s, i, t = lsnip.s, lsnip.insert_node, lsnip.text_node
local fmt = require("luasnip.extras.fmt").fmt

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<S-CR>']  = cmp.mapping.confirm({ select = true }),

		['<TAB>']   = cmp.mapping.select_next_item(),
		['<S-TAB>'] = cmp.mapping.select_prev_item(),

		['<Down>']  = cmp.mapping.select_next_item(),
		['<Up>']    = cmp.mapping.select_prev_item(),
	}),

	sources = {
		{ name = 'path' },
		{ name = 'buffer' },
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'nvim_lsp_signature_help' },
	},

	snippet = { -- Use luasnip for snippet expansion for nvim-cmp
		expand = function(args)
			lsnip.lsp_expand(args.body)
		end,
	},
})

lsnip.add_snippets("odin", {
	s("main", fmt(
		[[
			package main

			import "core:fmt"

			main :: proc() {{
				fmt.println("{}")
			}}
		]],
		{ i(0) })
	),
	s("core",   fmt("import \"core:{}\"", { i(0) })),
	s("gamers", fmt("import \"gamers:{}\"", { i(0) })),
	s("vendor", fmt("import {} \"vendor:{}\"", { i(0), i(1) })),
	s("switch", fmt(
		[[
			switch {} {{
				case {}:
				case: break
			}}
		]],
		{ i(1), i(0) })
	),
	s("for", fmt(
		[[
			for {} in {} {{
				{}
			}}
		]],
		{ i(1), i(2), i(0) })
	)
})

lsnip.add_snippets("html", {
	s("html", fmt(
		[[
			<!DOCTYPE html>
			<html lang="pt" >
			<head>
				<meta charset="UTF-8">
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<title>{}</title>
				<link rel="stylesheet" href="style.css">
				<script src="{}"></script>
			</head>
			<body>
			</body>
			</html>
		]],
		{ i(1), i(0) })
	)
})

lsnip.add_snippets("javascript", {
	s("dom", fmt(
		[[
			document.addEventListener("DOMContentLoaded", () => {{
				{}
			}});
		]],
		{ i(0) })
	)
})
