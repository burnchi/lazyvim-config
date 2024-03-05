return {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      local ls = require("luasnip") --{{{

      -- require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/LuaSnip" })
      require("luasnip").config.setup({ store_selection_keys = "<A-p>" })

      vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]]) --}}}

      -- Virtual Text{{{
      local types = require("luasnip.util.types")
      ls.config.set_config({
        history = true,                            --keep around last snippet local to jump back
        updateevents = "TextChanged,TextChangedI", --update changes as you type
        enable_autosnippets = true,
        ext_opts = {
          -- choiceNode will appear a hint
          [types.choiceNode] = {
            active = { virt_text = { { "●", "Orange" } }, hl_mode = "combine" }
          },
          -- [types.insertNode] = {
          -- 	active = {
          -- 		virt_text = { { "●", "GruvboxBlue" } },
          -- 	},
          -- },
        },
      })
      vim.keymap.set({ "i", "s" }, "<a-j>", function()
        if ls.jumpable(1) then
          ls.jump(1)
        end
      end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<a-k>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<a-l>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        else
          -- print current time
          local t = os.date("*t")
          local time = string.format("%02d:%02d:%02d", t.hour, t.min, t.sec)
          print(time)
        end
      end)
      vim.keymap.set({ "i", "s" }, "<a-h>", function()
        if ls.choice_active() then
          ls.change_choice(-1)
        end
      end) --}}}

      -- More Settings --

      vim.keymap.set("n", "<Leader><CR>", "<cmd>LuaSnipEdit<cr>", { silent = true, noremap = true })
      vim.cmd([[autocmd BufEnter */snippets/*.lua nnoremap <silent> <buffer> <CR> /-- End Refactoring --<CR>O<Esc>O]])
    end,
  },
}
