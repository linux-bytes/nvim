return {
	'nvim-lualine/lualine.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},
	--- enabled = true,
	config = function()
		require('lualine').setup({
			options = {
				-- 一个section内的component的分割符
				component_separators = { left = '|', right = '|' },
				-- ABC XYZ间的分隔符
				-- section_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
				-- 是否禁用图标
				icons_enabled = true,
				-- 主题
				theme = "gruvbox_dark",
			},
			sections = {
				lualine_a = { 'mode' },
				-- lualine_b = { 'diagnostics' },
				lualine_b = { 'diagnostics' },
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
