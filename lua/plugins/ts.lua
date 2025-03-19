return {
  {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      vtsls = {
        settings = {
          typescript = {
            inlayHints = {
              variableTypes = { enabled = true },
            },
          },
        },
      },
    },
  }
  }
}
