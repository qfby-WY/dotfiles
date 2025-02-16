-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local is_win = os.getenv("OS") == "Windows_NT"
if is_win then
  LazyVim.terminal.setup("pwsh")
end

local opt = vim.opt
opt.spelllang = { "en", "cjk" }
opt.listchars = { space = "·", tab = "|->" }
