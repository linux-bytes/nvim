return {
	-- {
	-- 	"github/copilot.vim",
	-- 	-- 可选的延迟加载配置，例如在插入模式或首次进入缓冲区时加载
	-- 	event = "InsertEnter",
	-- 	-- 确保 opts 存在，lazy.nvim 会自动调用 setup()
	-- 	opts = {},
	-- 	-- 如果你需要覆盖或设置快捷键，也可以使用 config 函数
	-- 	-- config = function()
	-- 	--   vim.g.copilot_assume_mapped = true
	-- 	--   -- 你的其他快捷键映射...
	-- 	-- end,
	-- },
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter", -- 插入模式时加载
		config = function()
			require("copilot").setup({
				-- 建议配置
				suggestion = {
					enabled = true,
					auto_trigger = true, -- 输入时自动触发建议
					debounce = 75, -- 触发延迟（毫秒）
					keymap = {
						accept = "<C-y>", -- 接受当前建议
						accept_word = "<Right>", -- 可选：接受当前单词
						accept_line = "<Down>", -- 可选：接受当前行
						next = "<PageDown>", -- 切换到下一条建议
						prev = "<PageUp>", -- 切换到上一条建议
						dismiss = "<C-x>", -- 拒绝当前建议
					},
				},
				-- 面板配置 (用于预览多条建议)
				panel = {
					enabled = false,
					auto_refresh = true,
					keymap = {
						open = "<M-CR>", -- 打开面板
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>", -- 在面板中接受选中建议
						refresh = "gr",
					},
					layout = {
						position = "bottom", -- 面板位置
						ratio = 0.4, -- 面板高度占窗口比例
					},
				},
				-- 文件类型控制：可禁用特定文件类型的补全
				filetypes = {
					["*"] = true, -- 默认开启所有文件类型
					-- markdown = false, -- 例如，在markdown中禁用
				},
			})
		end,
	},
	{
		-- 2. 连接 Copilot 与 nvim-cmp 的适配器
		"zbirenbaum/copilot-cmp",
		event = "InsertEnter",
		dependencies = { "zbirenbaum/copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	}
}
