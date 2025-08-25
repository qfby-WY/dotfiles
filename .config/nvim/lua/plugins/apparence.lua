return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    opts = {
      transparent_background = true,
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ui = { border = "rounded" },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
      lsp = {
        signature = { enabled = false },
      },
    },
  },
  {
    "echasnovski/mini.icons",
    opts = {
      extension = {
        h = { glyph = "", hl = "MiniIconsPurple" },
      },
      filetype = {
        c = { glyph = "", hl = "MiniIconsBlue" },
      },
    },
  },
}
