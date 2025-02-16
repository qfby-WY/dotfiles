return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      menu = {
        border = "rounded",
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
      },
      documentation = {
        window = {
          border = "rounded",
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,EndOfBuffer:BlinkCmpDoc",
        },
      },
    },
    signature = {
      enabled = true,
      window = {
        border = "rounded",
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
      },
    },
    cmdline = {
      enabled = true,
      sources = function()
        local type = vim.fn.getcmdtype()
        -- Search forward and backward
        -- stylua: ignore
        if type == "/" or type == "?" then return { "buffer" } end
        -- Commands
        -- stylua: ignore
        if type == ":" or type == "@" then return { "cmdline" } end
        return {}
      end,
    },
    keymap = {
      preset = "default",
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
    },
  },
}
