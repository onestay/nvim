-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = false
vim.opt.ignorecase = true
-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.lazyvim_python_ruff = "ruff_lsp"
vim.g.tabstop = 4
vim.g.softtabstop = -1
vim.g.shiftwidth = 0
local space = " "
vim.opt.listchars:append {
  tab = "> ",
  space = space,
  nbsp = space,
  multispace = space,
  lead = space,
  trail = space
}
vim.g.snacks_animate = false

vim.g.root_spec = { "cwd" }
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 4
