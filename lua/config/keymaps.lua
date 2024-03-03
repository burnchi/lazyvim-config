-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here


local keymap = vim.keymap
-- delete switch buffer
keymap.del('n', '<S-h>')
keymap.del("n", "<S-l>")
keymap.del("n", "[b")
keymap.del("n", "]b")

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
keymap.set("n", "<leader>ss", "<C-w>v")         -- 水平新增窗口
keymap.set("n", "<leader>sv", "<C-w>s")         -- 垂直新增窗口
keymap.set("n", "<C-s>", "<ESC>:w<CR>", opts()) -- save file
keymap.set("n", "<C-a>", "GVgg")                -- select all
-- quick move cursor
keymap.set("n", "H", "^")
keymap.set("n", "L", "$")
keymap.set("n", "dH", "d^")
keymap.set("n", "dL", "d$")
keymap.set("n", "<leader>nh", ":nohl<CR>") -- no highlight
keymap.set("n", "<leader>wd", "<C-w>c")    -- close window
-- 切换buffer
keymap.set("n", "<tab>", ":bnext<CR>", opts())
keymap.set("n", "<S-tab>", ":bprevious<CR>", opts())

-- ---------- 选择模式 ---------- ---
keymap.set("s", "<C-s>", "<ESC>:w<CR>", opts()) -- save file
