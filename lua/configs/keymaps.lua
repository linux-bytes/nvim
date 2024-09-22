-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- <leader>d 	Delete current buffer in normal mode
keymap.set("n", "<leader>d", ":bdelete<cr>")

-- <leader>o		close other windows
keymap.set("n", "<leader>o", "<c-w>o")

-- <leader>o		close current windows/tab
keymap.set("n", "<leader>c", ":confirm close<cr>")

keymap.set("n", "<leader>e", ":e <C-R>=expand(\"%:h\") . \"/\" <CR>")

--- <leader>p		Paste the content of external GUI clipboard to here
--- <leader>y		Copy the content selected to external GUI clipboard
--- <leader>k		Cut the content selected to external GUI clipboard
keymap.set("n", "<leader>p", '"+gP')
keymap.set("v", "<leader>y", '"+y')
keymap.set("v", "<leader>k", '"+x')

keymap.set("n", "<C-s>", ':w<cr>')
keymap.set("n", "<C-M>", 'o<Esc>k')		--- Ctrl + Enter

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

keymap.set("n", "<F4>", toggle_quickfix, {desc = "Toggle Quickfix Window"})

keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv")   --- Shift + Down:  move the text down
keymap.set("v", "<S-Up>",   ":m '<-2<CR>gv=gv")   --- Shift + Up  :  move the text up
