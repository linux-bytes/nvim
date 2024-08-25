--- It's not compatible with vi
vim.opt.compatible	= false

--- Set the max number instructions recorded in last vim running.
--- vim.opt.viminfo='20,\"50
vim.opt.history=200

--- Make the Time is in English
-- vim.opt.language.time = "en_US.UTF8"

--	filetype plugin on
--	filetype indent on

vim.opt.hidden		= true	--- 缓冲区即便有修改，也可以切换
vim.opt.updatetime	= 1000	--- 文件交互区中的内容 1000ms 之后就会写入文件

vim.opt.backup		= false
vim.opt.wb		= false
vim.opt.swapfile	= false

vim.opt.showcmd		= true

vim.opt.laststatus	= 2
vim.opt.ruler		= true

vim.opt.hlsearch	= true

vim.opt.number		= true

--- vim.g.lazyvim_picker	= "fzf"
vim.g.lazyvim_picker    = "telescope"

vim.opt.cursorline	= true
vim.opt.termguicolors	= true
vim.opt.completeopt	= {"menu", "menuone", "noselect"}


vim.cmd([[set nu]])
vim.cmd([[set colorcolumn=80]])

vim.g.some_gloabal_variable = {
	username	= "Jerry Zhou",
	email		= "uulinux@gmail.com"
}

-- vim.opt.username	="Jerry Zhou"
-- vim.opt.email	="uulinux@gmail.com"
