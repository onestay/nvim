-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = false
vim.opt.ignorecase = true

vim.g.snacks_animate = false
vim.opt.list = true
vim.opt.listchars = {
  tab = " •>", -- Shows tabs as > followed by middle dots
  -- or use this for just > followed by spaces:
  -- tab = "> ",
  lead = "•",
  trail = "•",
}

-- vim.g.lazyvim_python_lsp = "basedpyright"
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 4
