return {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			terminal_colors = true, -- add neovim terminal colors
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = true,
				emphasis = true,
				comments = true,
				operators = false,
				folds = true,
			},
			strikethrough = true,
			invert_selection = true,
			invert_signs = false,
			invert_tabline = true,
			invert_intend_guides = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			overrides = {
				LspReferenceText = { fg = "#40E0D0", bold = true, underline = true },
				LspReferenceRead = { fg = "#40E0D0", bold = true, underline = true },
				LspReferenceWrite = { fg = "#40E0D0", bold = true, underline = true },
			},
			dim_inactive = false,
			transparent_mode = false,
		})

		vim.o.background = "dark" -- or "light" for light mode

		vim.cmd([[colorscheme gruvbox]])
	end
}
