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
    "williamboman/mason.nvim",
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
}
