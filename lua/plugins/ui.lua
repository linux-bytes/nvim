-- 显示颜色
return {
	{
		'glepnir/nerdicons.nvim',
		cmd = 'NerdIcons',
		config = function()
			require('nerdicons').setup({})
		end
	},
	{
		'NvChad/nvim-colorizer.lua',
		config = function()
			require("colorizer").setup({
			})
		end,
	},
	{
		'echasnovski/mini.icons',
		version = '*',
	},
	{
		'VonHeikemen/fine-cmdline.nvim',
		dependencies = {
			{ 'MunifTanjim/nui.nvim' },
		},
		keys = {
			{ ":", "<cmd>FineCmdline<CR>", desc = "FineCmdline" }
		},
		config = function()
			require("fine-cmdline").setup({
				cmdline = {
					enable_keymaps = true,
					smart_history = true,
					prompt = ': '
				},
				popup = {
					position = {
						row = '10%',
						col = '50%',
					},
					size = {
						width = '60%',
					},
					border = {
						style = 'rounded',
					},
					win_options = {
						winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
					},
				},
				hooks = {
					before_mount = function(input)
						-- code
					end,
					after_mount = function(input)
						-- code
					end,
					set_keymaps = function(imap, feedkeys)
						-- code
					end
				}
			})
		end,
	},
	{
		'yamatsum/nvim-cursorline',
		config = function()
			require('nvim-cursorline').setup {
				cursorline = {
					enable	= true,
					timeout	= 1000,
					number	= true,
				},
				cursorword = {
					enable	   = false,
					min_length = 3,
					hl = { underline = true },
				}
			}
		end
	},
	{
		'Mr-LLLLL/interestingwords.nvim',

		config = function()
			require("interestingwords").setup {
				colors = { '#aeee00', '#ff0000', '#0000ff', '#b88823', '#ffa724', '#ff2c4b' },
				search_count = true,
				navigation = true,
				scroll_center = true,
				search_key = "<leader>m",
				cancel_search_key = "<leader>M",
				color_key = "<leader>k",
				cancel_color_key = "<leader>K",
				select_mode = "random", -- random or loop
			}
		end,
	},
	{
		'dvoytik/hi-my-words.nvim',
		config = function()
			require("hi-my-words").setup({
				silent = false,
				hl_grps = {
					{
						"HiMyWordsHLG0",
						{ ctermfg = 130, ctermbg = 21, fg = "#eea47f", bg = "#00539c", bold = true, italic = true },
					},
					{
						"HiMyWordsHLG1",
						{ ctermfg = 0, ctermbg = 11, fg = "#101820", bg = "#fee715", bold = true, italic = true },
					},
					{
						"HiMyWordsHLG2",
						{ ctermfg = 0, ctermbg = 11, fg = "#ccf381", bg = "#4831d4", bold = true, italic = true },
					},
					{
						"HiMyWordsHLG3",
						{ ctermfg = 0, ctermbg = 11, fg = "#e2d1f9", bg = "#317773", bold = true, italic = true },
					},
					{
						"HiMyWordsHLG4",
						{ ctermfg = 15, ctermbg = 1, fg = "#ffffff", bg = "#8aaae5", bold = true, italic = true },
					},
					{
						"HiMyWordsHLG5",
						{ ctermfg = 15, ctermbg = 1, fg = "#fcf6f5", bg = "#990011", bold = true, italic = true },
					},
					{
						"HiMyWordsHLG6",
						{ ctermfg = 0, ctermbg = 11, fg = "#2f3c7e", bg = "#fbeaeb", bold = true, italic = true },
					},
					{
						"HiMyWordsHLG7",
						{ ctermfg = 0, ctermbg = 11, fg = "#2c5f2d", bg = "#97bc62", bold = true, italic = true },
					},
					{
						"HiMyWordsHLG8",
						{ ctermfg = 0, ctermbg = 11, fg = "#408ec6", bg = "#1e2761", bold = true, italic = true },
					},
					{
						"HiMyWordsHLG9",
						{ ctermfg = 15, ctermbg = 1, fg = "#990011", bg = "#fcf6f5", bold = true, italic = true },
					},
				},
			})
		end,
	},
	{
		"azabiong/vim-highlighter",
		init = function()
			-- settings
		end,
	},
	{
		'b0o/incline.nvim',
		config = function()
			require('incline').setup()
		end,
	},
	{
		'kevinhwang91/nvim-bqf',
		ft = 'qf'
	},
}
