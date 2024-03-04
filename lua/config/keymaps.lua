-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
-- delete switch buffer
keymap.del('n', '<S-h>')
keymap.del("n", "<S-l>")
keymap.del("n", "[b")
keymap.del("n", "]b")
-- delete move line
keymap.del("n", "<A-j>")
keymap.del("n", "<A-k>")
keymap.del("i", "<A-j>")
keymap.del("i", "<A-k>")
keymap.del("v", "<A-j>")
keymap.del("v", "<A-k>")

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
keymap.set("n", "<leader>ws", "<C-w>v", { desc = "verticle split window" }) -- 水平新增窗口
keymap.set("n", "<leader>wv", "<C-w>s", { desc = "horizon split window" })  -- 垂直新增窗口
keymap.set("n", "<C-s>", "<ESC>:w<CR>", opts())                             -- save file
keymap.set("n", "<C-a>", "GVgg")                                            -- select all
-- quick move cursor
keymap.set("n", "H", "^")
keymap.set("n", "L", "$")
keymap.set("n", "dH", "d^")
keymap.set("n", "dL", "d$")
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "cancel highlight", silent = true }) -- no highlight
keymap.set("n", "<leader>wd", "<C-w>c", { desc = "close window" })                       -- close window
-- 切换buffer bufferline插件有
-- keymap.set("n", "<tab>", ":bnext<CR>", opts())
-- keymap.set("n", "<S-tab>", ":bprevious<CR>", opts())

-- ---------- 选择模式 ---------- ---
keymap.set("s", "<C-s>", "<ESC>:w<CR>", opts()) -- save file


-- move line
-- keymap.set("n", "J", "<cmd>m .+1<cr>==", { desc = "Move down" })
-- keymap.set("n", "K", "<cmd>m .-2<cr>==", { desc = "Move up" })
keymap.set("i", "J", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
keymap.set("i", "K", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move down" })
keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move up" })
