return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require('gitsigns').setup()
		end,
	},
	{
		"sindrets/diffview.nvim",
		config = function()
			require('diffview').setup()
		end,
	}
}
