return {
	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			-- 1. 查看器设置 (MuPDF)
			vim.g.vimtex_view_method = 'general'

			-- 2. 编译器设置 (latexmk)
			vim.g.vimtex_compiler_method = 'latexmk'

			-- 设置 VimTeX 编译引擎为 XeLaTeX
			vim.g.vimtex_compiler_latexmk_engines = {
				_ = '-xelatex'  -- 下划线 "_" 代表默认引擎
			}

			vim.g.vimtex_compiler_latexmk = {
				options = {
					'-synctex=1',
					'-file-line-error',
					'-interaction=nonstopmode',
				},
			}

			-- 3. 界面与交互优化
			vim.g.vimtex_quickfix_mode = 0 -- 不自动弹出QuickFix窗口
			vim.g.vimtex_syntax_conceal = { -- 精细控制“美化”显示
				accents = 1,
				cites = 1,
				fancy = 1,
				greek = 1,
				math_bounds = 0, -- 不隐藏数学公式的定界符
				math_delimiters = 0,
				math_fracs = 0,
				math_super_sub = 0,
				math_symbols = 0,
				sections = 0,
				styles = 0,
			}
			vim.g.vimtex_complete_enabled = 1 -- 启用补全
			vim.g.vimtex_indent_enabled = 1 -- 启用缩进
			vim.g.vimtex_imaps_enabled = 0 -- 禁用默认插入映射，可自定义

			-- 4. 定义一些有用的快捷键（可选）
			vim.keymap.set('n', '<leader>ll', '<plug>(vimtex-compile)', { desc = "编译LaTeX" })
			vim.keymap.set('n', '<leader>lv', '<plug>(vimtex-view)', { desc = "查看PDF" })
			vim.keymap.set('n', '<leader>lo', '<plug>(vimtex-compile-output)', { desc = "查看编译输出" })
		end,
		config = function()
			-- 可以在这里放置插件加载后需要执行的代码
		end,
	}
}
