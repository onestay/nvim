return {
  "f-person/git-blame.nvim",
  config = function (_, opts)
    vim.g.gitblame_display_virtual_text = 0
    vim.g.gitblame_date_format = '%r'
    vim.g.gitblame_message_template = '<author> (<date>)'
  end
}
