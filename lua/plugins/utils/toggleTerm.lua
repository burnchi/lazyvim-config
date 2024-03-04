return {
  'akinsho/toggleterm.nvim',
  version = "*",
  cmd = "ToggleTerm",
  -- 1C-\ open first terminal
  keys = {
    {
      [[<C-t>]],
      function()
        local count = vim.v.count1
        require("toggleterm").toggle(count, 15, vim.loop.cwd(), "horizontal")
      end,
      desc = "ToggleTerm (horizontal)",
    }
  },
  opts = {
    size = 15,
    open_mapping = [[<C-t>]],
    direction = "horizontal",
    insert_mappings = true,
    terminal_mappings = true,
    start_in_insert = true,
    close_on_exit = false,
  }
}
