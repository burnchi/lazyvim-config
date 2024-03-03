return {
  "echasnovski/mini.indentscope",
  opts = {
    -- symbol = "▏",
    symbol = "│",
    options = { try_as_border = true },
    -- code block line no animation
    draw = {
      animation = require("mini.indentscope").gen_animation.none()
    }
  },
}
