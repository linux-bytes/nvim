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
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				["c"] = { "clang_format" },
				["cpp"] = { "clang_format" },
				["c++"] = { "clang_format" },
				["py"] = { "autopep8" },
			},
			formatters = {
				clang_format = {
					prepend_args = {"-style=google"},
				},
			},
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		--- @module "ibl"
		--- @type ibl.config
		opts = {},
		config = function()
			local highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			}

			local hooks = require "ibl.hooks"
			-- create the highlight groups in the highlight setup hook, so they are reset
			-- every time the colorscheme changes
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
			end)

			-- require("ibl").setup({indent = { highlight = highlight }})
			require("ibl").setup()
		end
	},
	{
		"danymat/neogen",
		config = true,
		-- Uncomment next line if you want to follow only stable versions
		-- version = "*" 
	}
}
