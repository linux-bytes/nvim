-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "h", "c++" },
	callback = function()
		vim.opt_local.wrap	= false
		vim.opt_local.spell	= true
		vim.opt_local.ts	= 8
	end,
})
