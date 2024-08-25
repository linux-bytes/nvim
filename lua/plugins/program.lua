return {
	{
		'simrat39/symbols-outline.nvim',
		keys = {
			{ '<F8>', "<cmd>SymbolsOutline<CR>", desc = "NvimTreeToggle" }
		},
		config = function()
			require("symbols-outline").setup({
				position = "left",
			})
		end
	},
	{ 
		"danymat/neogen", 
		config = true,
		-- Uncomment next line if you want to follow only stable versions
		-- version = "*" 
	}
}
