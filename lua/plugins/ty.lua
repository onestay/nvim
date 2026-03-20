return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = { enabled = false },
        basedpyright = { enabled = false },

        ty = {
          enabled = true,
          settings = {
            ty = {
              -- ty language server settings go here
            },
          },
        },
      },
    },
  },
}
