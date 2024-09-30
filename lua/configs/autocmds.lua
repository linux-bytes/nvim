-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "h", "c++" },
	callback = function()
		vim.opt_local.tabstop	  = 8
		vim.opt_local.softtabstop = 8
		vim.opt_local.shiftwidth  = 8
		vim.opt_local.textwidth   = 80
		vim.opt_local.expandtab	  = false
		vim.opt_local.autoindent  = true
		vim.opt_local.wrap	  = false
		vim.opt_local.spell	  = true
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "make" },
	callback = function()
		vim.opt_local.iskeyword:append({'-'})
	end,
})
