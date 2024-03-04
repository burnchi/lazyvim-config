return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    require('mason').setup {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    }

    require('mason-lspconfig').setup {}
    -- auto install formater
    require('mason-tool-installer').setup {
      ensure_installed = {
        'lua-language-server',
        'eslint_d',
        'prettierd',
        'prisma-language-server',
      },
    }
  end,
}
