return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      c = { "clang-format" },
      cpp = { "clang-format" },
    },
    formatters = {
      ["clang-format"] = {
        append_args = {
          "--style=file:" .. os.getenv("HOME") .. "/.config/.clang-format",
          "--sort-includes",
        },
      },
    },
  },
}
