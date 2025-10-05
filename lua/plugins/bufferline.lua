return {
	'akinsho/bufferline.nvim',
	enabled=false,
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
		{ "<C-Left>",    "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev Buffer" },
		{ "<C-Right>",   "<cmd>BufferLineCycleNext<cr>",            desc = "Next Buffer" },
		{ "<A-PageUp>",  "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev Buffer" },
		{ "<A-PageDown>","<cmd>BufferLineCycleNext<cr>",            desc = "Next Buffer" },
		{ "FF",          "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev Buffer" },
		{ "ff",          "<cmd>BufferLineCycleNext<cr>",            desc = "Next Buffer" },
		{ "<S-Left>",    "<cmd>BufferLineMovePrev<cr>",             desc = "Move buffer prev" },
		{ "<S-Right>",   "<cmd>BufferLineMoveNext<cr>",             desc = "Move buffer next" },
	},
	config = function()
		vim.opt.termguicolors = true
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				mode = "buffers",
				-- 标签栏样式
				always_show_bufferline = true,
				separator_style = "thick", -- 标签分隔符样式（可选 "slant"|"thick"|"thin"）
				show_buffer_close_icons = false, -- 显示关闭按钮
				show_close_icon = false, -- 显示整体关闭按钮
				enforce_regular_tabs = false, -- 允许不同长度的标签

				offsets = {
					{
						filetype = "NvimTree",
						-- text = "File Explorer",
					} -- 适配文件树插件
				},

				custom_filter = function(buf)
					-- dont show help buffers in the bufferline
					if vim.bo[buf].filetype == "qf" then
						return false
					end

					return true
				end,

				style_preset = {
					bufferline.style_preset.no_italic,
					bufferline.style_preset.bold
				},
				--- indicator = {
				--- 	icon = '|', -- this should be omitted if indicator style is not 'icon'
				--- 	style = 'icon' | 'underline' | 'none',
				--- },
			},
			highlights = {
				background = {
					bg = "#005555", -- 标签栏背景（浅灰）
					fg = "#CCCCCC" -- 默认文字
				},
				buffer_selected = {
					bg = "#55FFFF", -- 当前标签背景（纯白）
					fg = "#000000", -- 深灰文字
					bold = true,
					italic = false
				},
				modified = {
					fg = "#ff8a65" -- 未保存提示（橙色）
				},
				modified_selected = {
					fg = "#ff7043" -- 高亮未保存（更亮橙）
				},
				separator_selected = {
					fg = "#90a4ae", -- 浅蓝灰分隔线
					bg = "#ffffff"
				},
				close_button_selected = {
					fg = "#e57373" -- 柔和红色关闭按钮
				},
				diagnostic_selected = {
					fg = "#ef5350", -- 错误红
					bold = false
				},
				hint_selected = {
					fg = "#4dd0e1" -- 提示青
				},
				info_selected = {
					fg = "#42a5f5" -- 信息蓝
				},
				buffer_visible = {
					bg = "#eeeeee", -- 悬停标签背景
					fg = "#555555"
				}
			},
		})
	end
}
