local bubble_separator = { left = "", right = "" }

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "modus-vivendi",
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { { "mode", separator = bubble_separator } },
      lualine_z = {
        {
          function()
            return " " .. os.date("%R")
          end,
          separator = bubble_separator,
        },
      },
    },
  },
}
