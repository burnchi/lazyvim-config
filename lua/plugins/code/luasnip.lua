return {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip").config.set_config({
        enable_autosnippets = true,
        store_selection_keys = "`",
      })
      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/LuaSnip" })
      local auto_expand = require("luasnip").expand_auto
      require("luasnip").expand_auto = function(...)
        vim.o.undolevels = vim.o.undolevels
        auto_expand(...)
      end
    end,
    -- 覆盖原本的keymap
    keys = function()
      return {
        -- jump to next slug (insert mode)
        {
          "<A-j>",
          function()
            return require("luasnip").expand_or_locally_jumpable() and "<Plug>luasnip-jump-next"
          end,
          expr = true,
          silent = true,
          mode = "i",
        },
        -- jump to next slug (select mode)
        {
          "<A-j>",
          function()
            return require("luasnip").jump(1)
          end,
          mode = "s",
        },
        -- jump to last slug
        {
          "<A-k>",
          function()
            require("luasnip").jump(-1)
          end,
          mode = { "i", "s" },
        },
        -- select_node select next word
        {
          "<c-h>",
          "<Plug>luasnip-next-choice",
          mode = { "i", "s" },
        },
        -- select_node select last word
        {
          "<c-p>",
          "<Plug>luasnip-prev-choice",
          mode = { "i", "s" },
        },
        -- {
        --   "<tab>",
        --   function()
        --     if require("luasnip").expand_or_jumpable() then
        --       require("luasnip").expand_or_jump()
        --     else
        --       return "<tab>"
        --     end
        --   end,
        --   mode = { "i", "s" },
        -- },
      }
    end,
  },
}
