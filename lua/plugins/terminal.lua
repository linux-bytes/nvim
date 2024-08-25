-- 内置终端
return {
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		keys = {
			{ "<C-n>", '<cmd>ToggleTerm<CR>', desc = "Toggle Terminal" }
		},
		config = function()
			require("toggleterm").setup()
		end
	},
	{
		'numToStr/FTerm.nvim',
		keys = {
			--- C-/
			{ "<C-_>", '<cmd>lua require("FTerm").toggle()<CR>', desc = "Toggle Terminal"}
		},
		config = function()
			require('FTerm').setup({
				border     = 'double',
				dimensions = {
					height = 0.9,
					width = 0.9,
				},
			})
		end
	}
}
