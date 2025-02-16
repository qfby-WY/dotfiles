return {
  "folke/snacks.nvim",
  opts = {
    indent = {
      indent = {
        only_scope = true,
      },
      scope = {
        enabled = false,
        underline = true,
        only_current = false,
      },
      chunk = {
        enabled = true,
        only_current = true,
        char = {
          corner_top = "╭",
          corner_bottom = "╰",
        },
      },
    },
    -- win = {
    --   enabled = true,
    --   border = "rounded",
    -- },
    scroll = { enabled = true },
  },
}
