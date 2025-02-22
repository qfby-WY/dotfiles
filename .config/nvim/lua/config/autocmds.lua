-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- local function augroup(name)
--     return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
-- end

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "c", "cpp", "python" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})
