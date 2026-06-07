return {
	{
		'dhruvasagar/vim-table-mode',
		ft = 'markdown',
		init = function()
			vim.g.table_mode_corner = '|'
			vim.g.table_mode_cell_text_object_i_map = 'i|'
			vim.g.table_mode_cell_text_object_a_map = 'a|'
		end,
		config = function()
			local group = vim.api.nvim_create_augroup('TableModeKeymap', { clear = true })
			vim.api.nvim_create_autocmd('FileType', {
				group = group,
				pattern = 'markdown',
				callback = function(args)
					vim.keymap.set('n', '<Tab>', '<Cmd>TableModeRealign<CR>', {
						buffer = args.buf,
						desc = 'Align Table',
					})
				end,
			})
			if vim.bo.filetype == 'markdown' then
				vim.keymap.set('n', '<Tab>', '<Cmd>TableModeRealign<CR>', {
					buffer = true,
					desc = 'Align Table',
				})
			end
		end,
	},
}
