-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- vim-visual-multi keymap sheet
-- <c-n> -- select next match
-- q --skip next match
-- \\A select all match
-- https://github.com/mg979/vim-visual-multi
------------



local keymap = vim.keymap
-- delete switch buffer
keymap.del('n', '<S-h>')
keymap.del("n", "<S-l>")
keymap.del("n", "[b")
keymap.del("n", "]b")
------------------------
-- lspsaga need this word
keymap.del('n', "K")


-- ban command popup
function opts()
  return {
    silent = true
  }
end

-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>")
keymap.set("i", "<C-s>", "<ESC>:w<CR>", opts())

-- ---------- 视觉模式 ---------- ---
keymap.set("v", "<s-h>", "^")
keymap.set("v", "<s-l>", "$")

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<leader>ss", "<C-w>v", { desc = "verticle split window" }) -- 新增水平窗口
keymap.set("n", "<leader>sv", "<C-w>s", { desc = "horizon split window" })  -- 新增垂直窗口
keymap.set("n", "<C-a>", "GVgg")                                            -- select all
-- quick move cursor
keymap.set("n", "H", "^")
keymap.set("n", "L", "$")
keymap.set("n", "dH", "d^")
keymap.set("n", "dL", "d$")
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "cancel highlight", silent = true }) -- no highlight
keymap.set("n", "<leader>wd", "<C-w>c", { desc = "close window" })                       -- close window

-- ---------- 选择模式 ---------- ---
keymap.set("s", "<C-s>", "<ESC>:w<CR>", opts()) -- save file




keymap.set('t', '<esc>', [[<C-\><C-n>]], { buffer = 0 })
