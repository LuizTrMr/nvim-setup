require("oil").setup({
	default_file_explorer = true,
	view_options = {
    	show_hidden = true,
	},
	keymaps = {
		["<Space><Space>"] = "actions.select",
	}
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- local function my_toggle_float()
-- 	require("oil").toggle_float(".")
-- end
-- vim.keymap.set("n", "f-", my_toggle_float)
