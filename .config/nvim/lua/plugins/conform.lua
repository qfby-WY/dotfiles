local is_win = os.getenv("OS") == "Windows_NT"
local HOME = is_win and os.getenv("USERPROFILE") or os.getenv("HOME")

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
          "--style=file:" .. HOME .. "/.config/.clang-format",
          "--sort-includes",
        },
      },
    },
  },
}
