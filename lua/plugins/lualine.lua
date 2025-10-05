return {
	'nvim-lualine/lualine.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},
	enabled = true,
	config = function()
		require('lualine').setup({
			options = {
				-- 一个section内的component的分割符
				component_separators = { left = '|', right = '|' },
				-- ABC XYZ间的分隔符
				-- section_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
				-- 是否禁用图标
				icons_enabled = false,
				always_show_tabline = true,
				-- 主题
				theme = "gruvbox_dark",
			},
			-- 顶栏
			tabline = {
				-- lualine_a = {
				-- 	{
				-- 		function()
				-- 			return vim.bo.filetype == 'NvimTree' and ' NvimTree' or ''
				-- 		end,
				-- 	}
				-- },
				lualine_b = {{
					'buffers',
					separator = { left = '',right = '' },
					-- show_bufnr = true,   -- 显示 buffer 编号
					-- show_filename_only = true, -- 显示完整路径（默认只显示文件名）

					filetype_names = {
						TelescopePrompt = 'Telescope',
						dashboard = 'Dashboard',
						packer = 'Packer',
						fzf = 'FZF',
						alpha = 'Alpha'
					}, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

					symbols = {
						modified = '[+]', -- 修改过的 buffer 标记
						alternate_file = '',
					},

					buffers_color = {
						active = {fg = "black", bg = "yellow"},
						inactive = {fg = "#CCCCCC", bg = "#5b605e"},
					},
					-- use_mode_colors = false,
				}},
				lualine_z = {"tabs"},
			},
			--- 底栏
			sections = {
				lualine_a = { 'mode' },
				-- lualine_b = { 'diagnostics' },
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = { { 'filename', path = 1 } },
				lualine_x = { 'filesize', 'encoding', 'fileformat' },
				lualine_y = { 'progress' },
				--- lualine_z = { 'location' },
				lualine_z = {
					function()
						local line = vim.fn.line('.')
						local col  = vim.fn.charcol('.')
						local vcol = vim.fn.virtcol('.')
						return string.format('%3d:%2d-%2d', line, col, vcol)
					end,
				},
			},
		})
	end,
}
