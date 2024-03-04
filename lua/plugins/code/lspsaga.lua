return {
  'nvimdev/lspsaga.nvim',
  cmd = "Lspsaga",
  config = function()
    local keymap = vim.keymap

    require('lspsaga').setup {
      ui = {
        border = 'rounded',
      },
      lightbulb = {
        enable = false,
      },
    }

    keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>')
    keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<cr>')
    -- watch all symbal
    keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<cr>')

    vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<cr>')
    vim.keymap.set('n', '<space>r', vim.lsp.buf.rename)
    vim.keymap.set(
      { 'n', 'v' },
      '<space>ca',
      '<cmd>Lspsaga code_action<cr>',
      opts
    )
    vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<cr>')


    vim.keymap.set(
      'n',
      '<space>k',
      '<cmd>Lspsaga hover_doc<cr>',
      { silent = true }
    )

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
