return {
  'nvimdev/lspsaga.nvim',
  keys = {
    {
      '[d',
      ':Lspsaga diagnostic_jump_prev<CR>',
      {

        silent = true,
        desc = 'diagnostic_jump_prev'
      }
    },
    {
      ']d',
      ':Lspsaga diagnostic_jump_next<CR>',
      {
        silent = true,
        desc = 'diagnostic_jump_next'
      }
    },
    -- {
    --   'gd',
    --   '<cmd>Lspsaga goto_definition<cr>',
    --   desc = 'goto_definition'
    -- },
    -- {
    --   '<leader>o',
    --   '<cmd>Lspsaga outline<cr>',
    --   desc = 'symbol outline'
    -- },
    {
      '<leader>r',
      ':Lspsaga rename<cr>',
      desc = 'Global Rename'
    },
    -- {
    --   '<leader>ca',
    --   '<cmd>Lspsaga code_action<cr>',
    --   desc = 'Code Action'
    -- },
    {
      'K',
      '<cmd>Lspsaga hover_doc<cr>',
      desc = 'show Doc'
    },
  },
  config = function()
    -- local keymap = vim.keymap
    -- local builtin = require 'telescope.builtin'

    require('lspsaga').setup({})

    -- error lens
    vim.fn.sign_define {
      {
        name = 'DiagnosticSignError',
        text = '',
        texthl = 'DiagnosticSignError',
        linehl = 'ErrorLine',
      },
      {
        name = 'DiagnosticSignWarn',
        text = '',
        texthl = 'DiagnosticSignWarn',
        linehl = 'WarningLine',
      },
      {
        name = 'DiagnosticSignInfo',
        text = '',
        texthl = 'DiagnosticSignInfo',
        linehl = 'InfoLine',
      },
      {
        name = 'DiagnosticSignHint',
        text = '',
        texthl = 'DiagnosticSignHint',
        linehl = 'HintLine',
      },
    }
  end,
}
