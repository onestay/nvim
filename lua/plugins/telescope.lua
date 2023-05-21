return {
  "nvim-telescope/telescope.nvim",
  version = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader><space>", "<cmd>Telescope find_files<cr>",                desc = "Find Files" },
    { "<leader>ff",      "<cmd>Telescope find_files<cr>",                desc = "Find Files" },
    { "<leader>fb",      "<cmd>Telescope buffers<cr>",                   desc = "Buffers" },
    { "<leader>/",       "<cmd>Telescope live_grep<cr>",                 desc = "Live Grep" },
    { "<leader>gc",      "<cmd>Telescope git_commits<CR>",               desc = "commits" },
    { "<leader>gs",      "<cmd>Telescope git_status<CR>",                desc = "status" },
    { "<leader>:",       "<cmd>Telescope command_history<cr>",           desc = "Command History" },
    { "<leader>sa",      "<cmd>Telescope autocommands<cr>",              desc = "Auto Commands" },
    { "<leader>sb",      "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
    { "<leader>sc",      "<cmd>Telescope command_history<cr>",           desc = "Command History" },
    { "<leader>sC",      "<cmd>Telescope commands<cr>",                  desc = "Commands" },
    { "<leader>sd",      "<cmd>Telescope diagnostics bufnr=0<cr>",       desc = "Document diagnostics" },
    { "<leader>sD",      "<cmd>Telescope diagnostics<cr>",               desc = "Workspace diagnostics" },
    { "<leader>sh",      "<cmd>Telescope help_tags<cr>",                 desc = "Help Pages" },
    { "<leader>sH",      "<cmd>Telescope highlights<cr>",                desc = "Search Highlight Groups" },
    { "<leader>sk",      "<cmd>Telescope keymaps<cr>",                   desc = "Key Maps" },
    { "<leader>sM",      "<cmd>Telescope man_pages<cr>",                 desc = "Man Pages" },
    { "<leader>sm",      "<cmd>Telescope marks<cr>",                     desc = "Jump to Mark" },
    { "<leader>so",      "<cmd>Telescope vim_options<cr>",               desc = "Options" },
    { "<leader>sR",      "<cmd>Telescope resume<cr>",                    desc = "Resume" },
  },
  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      mappings = {
        i = {
          ["<c-t>"] = function(...)
            return require("trouble.providers.telescope").open_with_trouble(...)
          end,
          ["<a-t>"] = function(...)
            return require("trouble.providers.telescope").open_selected_with_trouble(...)
          end,
          ["<a-i>"] = function()
            local action_state = require("telescope.actions.state")
            local line = action_state.get_current_line()
            Util.telescope("find_files", { no_ignore = true, default_text = line })()
          end,
          ["<a-h>"] = function()
            local action_state = require("telescope.actions.state")
            local line = action_state.get_current_line()
            Util.telescope("find_files", { hidden = true, default_text = line })()
          end,
          ["<C-Down>"] = function(...)
            return require("telescope.actions").cycle_history_next(...)
          end,
          ["<C-Up>"] = function(...)
            return require("telescope.actions").cycle_history_prev(...)
          end,
          ["<C-f>"] = function(...)
            return require("telescope.actions").preview_scrolling_down(...)
          end,
          ["<C-b>"] = function(...)
            return require("telescope.actions").preview_scrolling_up(...)
          end,
        },
        n = {
          ["q"] = function(...)
            return require("telescope.actions").close(...)
          end,
        },
      },
    },
  },
}
