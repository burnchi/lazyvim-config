return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "vim", "bash", "javascript", "json", "lua", "python", "typescript", "tsx", "css", "markdown", "markdown_inline" }, -- one of "all" or a list of languages

    -- big file dont use highlight
    highlight = {
      enable = true,
      disable = function(_, buf)
        local max_filesize = 100000 * 1024
        local ok, stats = pcall(vim.loop.fs_stat, vim.opi.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          vim.notify("Tree sitter disabled")
          return true
        end
      end
    },
    indent = { enable = true },
  }
}
