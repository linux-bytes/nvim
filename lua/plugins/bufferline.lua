return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	keys = {
		{ "<leader>bd",  "<Cmd>BufferLinePickClose<CR>",            desc = "close a Buffer" },
		{ "<leader>bt",  "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle Pin" },
		{ "<leader>bP",  "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
		{ "<leader>bo",  "<Cmd>BufferLineCloseOthers<CR>",          desc = "Delete Other Buffers" },
		{ "<leader>br",  "<Cmd>BufferLineCloseRight<CR>",           desc = "Delete Buffers to the Right" },
		{ "<leader>bl",  "<Cmd>BufferLineCloseLeft<CR>",            desc = "Delete Buffers to the Left" },
		{ "<S-h>",       "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev Buffer" },
		{ "<S-l>",       "<cmd>BufferLineCycleNext<cr>",            desc = "Next Buffer" },
		{ "FF",          "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev Buffer" },
		{ "ff",          "<cmd>BufferLineCycleNext<cr>",            desc = "Next Buffer" },
		{ "<C-S-Left>",  "<cmd>BufferLineMovePrev<cr>",             desc = "Move buffer prev" },
		{ "<C-S-Right>", "<cmd>BufferLineMoveNext<cr>",             desc = "Move buffer next" },
	},
	config = function()
		vim.opt.termguicolors = true
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				-- or you can combine these e.g.
				style_preset = {
					bufferline.style_preset.no_italic,
					bufferline.style_preset.bold
				},
				--- indicator = {
				--- 	icon = '|', -- this should be omitted if indicator style is not 'icon'
				--- 	style = 'icon' | 'underline' | 'none',
				--- },
			},
		})
	end
}
