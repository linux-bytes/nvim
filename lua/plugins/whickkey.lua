return {
	{
		"folke/which-key.nvim",
		opts = {
			spec = {
				{ "<BS>",      desc = "Decrement Selection", mode = "x" },
				{ "<c-space>", desc = "Increment Selection", mode = { "x", "n" } },
			},
		},
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		-- 可选：通过 `opts` 覆盖默认设置
		opts = {
			-- 你可以在这里添加自定义选项
			-- 例如：modes = { char = { enabled = false } }, -- 禁用字符跳转模式
		},
		keys = {
			-- 核心快捷键：使用 "s" 进入Flash跳转模式 [citation:3]
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					-- 默认行为：跳转到当前窗口内的任何匹配项
					require("flash").jump()
				end,
				desc = "Flash",
			},
			-- 可选：使用 "S" 进入远程模式（可跨窗口跳转）
			{
				"S",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			-- 在 visual 模式下使用 "r" 进行选择范围的快速跳转
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
		},
	}
}

--- return {
--- 	"folke/which-key.nvim",
--- 	--- event = "VeryLazy",
--- 	opts_extend = { "spec" },
--- 	opts = {
--- 		defaults = {},
--- 		spec = {
--- 			{
--- 				mode = { "n", "v" },
--- 				{ "<leader><tab>", group = "tabs" },
--- 				{ "<leader>c", group = "code" },
--- 				{ "<leader>f", group = "file/find" },
--- 				{ "<leader>g", group = "git" },
--- 				{ "<leader>gh", group = "hunks" },
--- 				{ "<leader>q", group = "quit/session" },
--- 				{ "<leader>s", group = "search" },
--- 				{ "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
--- 				{ "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
--- 				{ "[", group = "prev" },
--- 				{ "]", group = "next" },
--- 				{ "g", group = "goto" },
--- 				{ "gs", group = "surround" },
--- 				{ "z", group = "fold" },
--- 				{
--- 					"<leader>b",
--- 					group = "buffer",
--- 					expand = function()
--- 						return require("which-key.extras").expand.buf()
--- 					end,
--- 				},
--- 				{
--- 					"<leader>w",
--- 					group = "windows",
--- 					proxy = "<c-w>",
--- 					expand = function()
--- 						return require("which-key.extras").expand.win()
--- 					end,
--- 				},
--- 				-- better descriptions
--- 				{ "gx", desc = "Open with system app" },
--- 			},
--- 		},
--- 	},
--- 	keys = {
--- 		{
--- 			"<leader>?",
--- 			function()
--- 				require("which-key").show({ global = false })
--- 			end,
--- 			desc = "Buffer Keymaps (which-key)",
--- 		},
--- 		{
--- 			"<c-w><space>",
--- 			function()
--- 				require("which-key").show({ keys = "<c-w>", loop = true })
--- 			end,
--- 			desc = "Window Hydra Mode (which-key)",
--- 		},
--- 	},
--- 	config = function(_, opts)
--- 		local wk = require("which-key")
--- 		wk.setup(opts)
--- 		if not vim.tbl_isempty(opts.defaults) then
--- 			--- LazyVim.warn("which-key: opts.defaults is deprecated. Please use opts.spec instead.")
--- 			wk.register(opts.defaults)
--- 		end
--- 	end,
--- } 
