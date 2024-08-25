-- Example for neo-tree.nvim
return {
	"nvim-neo-tree/neo-tree.nvim",
	keys = {
		{ "<F8>", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
	},
	config = function()
		require("neo-tree").setup()
	end,
}
