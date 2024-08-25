-- 语法高亮、代码导航
return {
	'nvim-treesitter/nvim-treesitter',
	enabled = true,
	run = ':TSUpdate',
	config = function()
		-- 设置 foldmethod 和 foldexpr
		-- vim.o.foldmethod = 'expr'
		-- vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
	end
}
