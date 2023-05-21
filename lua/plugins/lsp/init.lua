return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      {
        "SmiteshP/nvim-navic",
        opts = {
          lsp = {
            auto_attach = true,
          },
        },
      },
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
          -- prefix = "icons",
        },
        severity_sort = true,
      },
      autoformat = true,
    },
    config = function(_, opts)
      local Util = require("util")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      require("mason-lspconfig").setup()
      require("lspconfig").lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = {
                "vim",
              },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
          },
        },
      })
      require("lspconfig").pyright.setup({
        capabilities = capabilities,
      })
      require("lspconfig").bashls.setup({})

      Util.on_attach(function(client, buffer)
        require("plugins.lsp.keymaps").on_attach(client, buffer)
      end)
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function(_, opts)
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      local null_ls = require("null-ls")
      null_ls.setup({
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
                --vim.lsp.buf.formatting_sync()
              end,
            })
          end
        end,
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", ".git", "pyproject.toml"),
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.diagnostics.ruff.with({ extra_args = { "--ignore=F401" } }),
          -- null_ls.builtins.formatting.ruff,
          null_ls.builtins.formatting.rustfmt,
          null_ls.builtins.diagnostics.flake8.with({ extra_args = { "--select=E3" } }),
          null_ls.builtins.formatting.isort,
          null_ls.builtins.formatting.black,
          -- null_ls.builtins.diagnostics.mypy,
        },
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function(_, opts)
      require("mason").setup(opts)
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    opts = {
      on_initialized = function(status)
        require("notify")("Workspace setup: " + status)
      end,
    },
  },
}
