-- 定义替换函数
local function replace_patterns()
  -- 获取当前缓冲区
  local buf = vim.api.nvim_get_current_buf()
  
  -- 按顺序执行所有替换操作
  -- 1. 替换 reader 为 RRRRRRRRXXXXXXXX
  vim.cmd([[%s/reader/RRRRRRRRXXXXXXXX/g]])
  
  -- 2. 替换 r数字 为 RRXXRRXX数字
  vim.cmd([[%s/r\(\d\+\)/RRXXRRXX\1/g]])
  
  -- 3. 替换 writer 为 reader
  vim.cmd([[%s/writer/reader/g]])
  
  -- 4. 替换 w数字 为 r数字
  vim.cmd([[%s/w\(\d\+\)/r\1/g]])
  
  -- 5. 替换 RRXXRRXX数字 为 w数字
  vim.cmd([[%s/RRXXRRXX\(\d\+\)/w\1/g]])
  
  -- 6. 替换 RRRRRRRRXXXXXXXX 为 writer
  vim.cmd([[%s/RRRRRRRRXXXXXXXX/writer/g]])

  -- 7. 替换 writer_listener 为 reader_listener_RRRRRRR
  vim.cmd([[%s/writer_listener/reader_listener_RRRRRRR/g]])

  -- 8. 替换 reader_listener 为 writer_listener
  vim.cmd([[%s/reader_listener/writer_listener/g]])

  -- 9. 替换 reader_listener_RRRRRRR 为 reader_listener
  vim.cmd([[%s/reader_listener_RRRRRRR/reader_listener/g]])

end

-- 创建自动命令组
local augroup = vim.api.nvim_create_augroup("XmlQuickReplace", { clear = true })

-- 设置自动命令，仅对 XML 文件生效
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "xml",
  callback = function()
    -- 映射 Ctrl+t 到替换函数
    vim.keymap.set("n", "<C-t>", replace_patterns, { buffer = true, desc = "Execute XML pattern replacement" })
  end,
})

return {}
