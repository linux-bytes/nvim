-- 显示颜色
return {
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
	--- {
	--- 	'ojroques/nvim-hardline',
	--- 	config = function ()
	--- 		require('hardline').setup({})
	--- 	end
	--- },
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
					number	= false,
				},
				cursorword = {
					enable	   = true,
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

			--- require('lualine').setup {
			--- 	lualine_x = {
			--- 		...
			--- 		{
			--- 			require("interestingwords").lualine_get,
			--- 			cond = require("interestingwords").lualine_has,
			--- 			color = { fg = "#ff9e64" },
			--- 		},
			--- 		...
			--- 	}
			--- }
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
