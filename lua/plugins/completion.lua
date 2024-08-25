-- 相关概念：
-- 补全引擎：nvim-cmp，提供代码补全核心功能
-- 补全源：来自language server提供的数据，补全数据的来源。如：cmp-nvim-lsp是lsp内置补全，cmp-buffer补全当前buffer的内容，cmp-cmdline是命令行的补全，cmp-path是用来补全路径
-- snippet引擎：自定义代码段

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp_setup = function()
	local cmp = require("cmp")
	return {
		-- 指定一个snippet引擎
		snippet = {
			expand = function(args)
				require('luasnip').lsp_expand(args.body) -- for `luasnip` users.
			end,
		},
		-- 绑定快捷键
		mapping = cmp.mapping.preset.insert({
			-- use <c-b/f> to scroll the docs
			-- ['<c-b>'] = cmp.mapping.scroll_docs( -4),
			-- ['<c-f>'] = cmp.mapping.scroll_docs(4),
			-- use <c-k/j> to switch in items
			['<c-k>'] = cmp.mapping.select_prev_item(),
			['<c-j>'] = cmp.mapping.select_next_item(),
			-- Use <CR>(Enter) to confirm selection
			-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			['<CR>'] = cmp.mapping.confirm({ select = true }),

			-- A super tab
			-- sourc: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
			["<Tab>"] = cmp.mapping(function(fallback)
				-- Hint: if the completion menu is visible select next one
				if cmp.visible() then
					cmp.select_next_item()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, { "i", "s" }), -- i - insert mode; s - select mode
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif require("luasnip").jumpable(-1) then
					require("luasnip").jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		}),

		-- Let's configure the item's appearance
		-- source: https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
		formatting = {
			-- Set order from left to right
			-- kind: single letter indicating the type of completion
			-- abbr: abbreviation of "word"; when not empty it is used in the menu instead of "word"
			-- menu: extra text for the popup menu, displayed after "word" or "abbr"
			fields = { 'abbr', 'menu' },

			-- customize the appearance of the completion menu
			format = function(entry, vim_item)
				vim_item.menu = ({
					nvim_lsp = '[Lsp]',
					luasnip = '[Luasnip]',
					buffer = '[File]',
					path = '[Path]',
				})[entry.source.name]
				return vim_item
			end,
		},

		-- 配置数据来源
		sources = cmp.config.sources({
			{ name = 'nvim_lsp' }, -- For nvim-lsp
			{ name = 'luasnip' }, -- For luasnip user
			{ name = 'buffer' }, -- For buffer word completion
			{ name = 'path' }, -- For path completion
		}),
	}
end

-- Auto-completion engine
return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"lspkind.nvim", -- 核心补全引擎
		"hrsh7th/cmp-nvim-lsp", -- lsp补全数据源
		"hrsh7th/cmp-buffer", -- buffer补全数据源
		"hrsh7th/cmp-path", -- 路径补全数据源
		"hrsh7th/cmp-cmdline", -- 命令行补全数据源
		"L3MON4D3/LuaSnip", -- 代码片段补全引擎
		"rafamadriz/friendly-snippets", -- 代码片段补全数据源，含大部分常用语言的代码片段
		"saadparwaiz1/cmp_luasnip", -- 作为nvim-cmp和LuaSnip的桥梁
		"onsails/lspkind.nvim", -- 在代码提示中，显示分类的小图标
	},
	enabled = true,
	config = function()
		local cmp = require("cmp")
		cmp.setup(cmp_setup())

		-- Set configuration for specific filetype.
		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
			}, {
				{ name = "buffer" },
			}),
		})

		-- 搜索时显示补全
		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- 在命令行中显示补全
		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})
	end,
}
