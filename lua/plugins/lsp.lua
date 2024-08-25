-- LSP配置插件
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		--- enabled = true,
		config = function()
			require('mason').setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗"
					}
				}
			})

			-- meson会自动下载相关的language server, 可能配置过一会儿下载完才生效
			require('mason-lspconfig').setup({
				-- 支持的语言可以在这里找：https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
				ensure_installed = {
					'pylsp',
					'lua_ls',
					'cmake',
					'clangd',
					'gopls',
				},
			})

			require("lspconfig").clangd.setup({
				cmd = {
					"clangd",
					-- "--query-driver=/usr/lib/llvm/17/bin/clang",
					"--background-index",
					"--background-index-priority=normal",
					"-j=8", -- 后台异步更新使用的worker数量
					"--compile-commands-dir=" .. vim.fn.getcwd(), -- 配置compile_commands.json路径
					"--all-scopes-completion", -- 全局补全
					-- "--header-insertion=iwyu", -- 插入建议时自动引入头文件
					-- "--log=verbose"
				},
				filetypes = { "c", "h", "cpp", "objc", "objcpp" },
			})

			-- 配置并启动lua语言服务器，lazydev.nvim这个插件可以更好使用lua
			require("lspconfig").lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = {"vim"},
						},
					},
				},
			})


			-- 代码格式化，依赖language server是否实现该功能
			-- vim.keymap.set("v", "=", "<cmd>lua vim.lsp.buf.format()<CR>", { silent = false })
			vim.keymap.set("v", "=", "<cmd>lua vim.lsp.buf.format()<CR>", { silent = false })

			-- 跳转到定义
			vim.keymap.set('n', 'fd', "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = false })

			-- Find the references
			vim.keymap.set('n', 'gr', "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = false })

			-- LSP Rename
			vim.keymap.set('n', '<leader>r', "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = false })
		end
	},
	{
		'nvimdev/lspsaga.nvim',
		dependencies = {
			'nvim-treesitter/nvim-treesitter', -- optional
			'nvim-tree/nvim-web-devicons', -- optional
		},
		keys = {
			{'fr', "<cmd>Lspsaga finder<CR>", desc="Find the references"}
		},
		config = function()
			require('lspsaga').setup({
				ui = {
					-- 是否使用devicon
					devicon = true,
					code_action = '',
					-- code_action = '',
					-- code_action = '',
				},
				code_action = {
					num_shortcut = false,
				},
			})
			-- 查找引用
			-- vim.keymap.set('n', '<C-r>', ":Lspsaga finder<CR>", { noremap = true, silent = false })
		end
	},
}

--- return {
--- 	-- lsp-zero 是一个已经配置好的基础 lsp 功能的合集插件
--- 	{
--- 		"VonHeikemen/lsp-zero.nvim",
--- 		branch = "v3.x",
--- 		lazy = true,
--- 		config = false,
--- 	},
--- 	-- 以下是 lsp-zero 的依赖插件
--- 	{
--- 		"neovim/nvim-lspconfig",
--- 		dependencies = {
--- 			{ 'hrsh7th/cmp-nvim-lsp' },
--- 		}
--- 	},
--- 	-- 提供 GUI 安装LSP的插件
--- 	{
--- 		"williamboman/mason.nvim",
--- 		build = function()
--- 			vim.cmd("MasonUpdate")
--- 		end,
--- 		config = function()
--- 			require("mason").setup()
--- 		end,
--- 
--- 	},
--- 	{ "williamboman/mason-lspconfig.nvim" },
--- 
--- 	-- 代码补全
--- 	{ "hrsh7th/nvim-cmp" },
--- 	{ "hrsh7th/cmp-buffer" },
--- 	{ "hrsh7th/cmp-path" },
--- 	{ 'saadparwaiz1/cmp_luasnip' },
--- 	{ "hrsh7th/cmp-nvim-lsp" },
--- 	{ "hrsh7th/cmp-nvim-lua" },
--- 	-- 提示窗口引擎插件
--- 	{
--- 		"L3MON4D3/LuaSnip",
--- 		-- follow latest release.
--- 		version = "v2.*",
--- 		dependencies = { "rafamadriz/friendly-snippets" },
--- 		config = function()
--- 			require("luasnip.loaders.from_vscode").lazy_load()
--- 		end,
--- 	},
--- 	-- 补全提示中 VScode 式样的图标
--- 	{ "onsails/lspkind-nvim" },
--- 	-- 利用 treesitter 自动补全 html tag
--- 	{
--- 		"windwp/nvim-ts-autotag",
--- 		config = function()
--- 			require("nvim-ts-autotag").setup()
--- 		end,
--- 	},
--- 
--- 	-- typescript LSP，替代 Mason 里的 tsserver，tsserver 相对比较卡顿，还有错误提示不够清楚
--- 	{
--- 		"pmizio/typescript-tools.nvim",
--- 		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
--- 		opts = {},
--- 		event = "VeryLazy",
--- 	},
--- 
--- 	-- 自动补全提示 tailwindcss 颜色
--- 	{
--- 		"roobert/tailwindcss-colorizer-cmp.nvim",
--- 		-- optionally, override the default options:
--- 		config = function()
--- 			require("tailwindcss-colorizer-cmp").setup({
--- 				color_square_width = 2,
--- 			})
--- 		end,
--- 	},
--- 
--- 	-- 提供用于显示诊断等信息的列表
--- 	{
--- 		"folke/trouble.nvim",
--- 		dependencies = { "nvim-tree/nvim-web-devicons" },
--- 		opts = {
--- 			-- your configuration comes here
--- 			-- or leave it empty to use the default settings
--- 			-- refer to the configuration section below
--- 		},
--- 	},
--- 
--- 	-- 高亮TODO和FIX等注释
--- 	{
--- 		"folke/todo-comments.nvim",
--- 		dependencies = { "nvim-lua/plenary.nvim" },
--- 		opts = {
--- 			-- your configuration comes here
--- 			-- or leave it empty to use the default settings
--- 		},
--- 	}
--- }
