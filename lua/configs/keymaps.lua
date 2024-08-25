-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- <leader>d 	Delete current buffer in normal mode
vim.keymap.set("n", "<leader>d", ":bdelete<cr>")

-- <leader>o		close other windows
vim.keymap.set("n", "<leader>o", "<c-w>o")

-- <leader>o		close current windows/tab
vim.keymap.set("n", "<leader>c", ":confirm close<cr>")

vim.keymap.set("n", "<leader>e", ":e <C-R>=expand(\"%:h\") . \"/\" <CR>")

--- <leader>p		Paste the content of external GUI clipboard to here
--- <leader>y		Copy the content selected to external GUI clipboard
--- <leader>k		Cut the content selected to external GUI clipboard
vim.keymap.set("n", "<leader>p", '"+gP')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>k", '"+x')

local function toggle_quickfix()
  local windows = vim.fn.getwininfo()
  for _, win in pairs(windows) do
    if win["quickfix"] == 1 then
      vim.cmd.cclose()
      return
    end
  end
  vim.cmd.copen()
end

vim.keymap.set("n", "<F4>", toggle_quickfix, {desc = "Toggle Quickfix Window"})

local keymap = vim.keymap

keymap.set("v", "j", ":m '>+1<CR>gv=gv")
keymap.set("v", "k", ":m '<-2<CR>gv=gv")
