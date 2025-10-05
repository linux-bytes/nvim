-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "h", "cpp" },
	callback = function()
		vim.opt_local.tabstop	  = 8
		vim.opt_local.softtabstop = 8
		vim.opt_local.shiftwidth  = 8
		vim.opt_local.textwidth   = 80
		vim.opt_local.expandtab	  = false
		vim.opt_local.autoindent  = true
		vim.opt_local.wrap	  = false
		vim.opt_local.spell	  = true

		vim.opt_local.formatoptions="mMcroql"
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "make" },
	callback = function()
		vim.opt_local.iskeyword:append({'-'})
	end,
})

local function plantuml_2_pdf()
	local filename = vim.fn.expand('%:p')
	local basename = vim.fn.expand('%:p:r')

	-- 生成 SVG
	vim.cmd('!plantuml -tsvg ' .. vim.fn.shellescape(filename))

	-- 转换为 PDF
	vim.cmd('!rsvg-convert -f pdf -o ' .. vim.fn.shellescape(basename .. '.pdf') .. ' ' .. vim.fn.shellescape(basename .. '.svg'))

	-- 删除临时 SVG 文件
	vim.cmd('!rm ' .. vim.fn.shellescape(basename .. '.svg'))
end


vim.api.nvim_create_autocmd('FileType', {
	pattern = 'plantuml',
	callback = function()
		-- F5 映射到 :make
		vim.keymap.set('n', '<F5>', ':make<CR>', {
			buffer = true,
			silent = true,
			noremap = true,
			desc = 'Execute PlantUML compilation'
		})

		-- F6 映射到 PDF 生成函数
		vim.keymap.set('n', '<F6>', function() plantuml_2_pdf() end, {
			buffer = true,
			silent = true,
			noremap = true,
			desc = 'Generate PlantUML PDF'
		})
	end
})
