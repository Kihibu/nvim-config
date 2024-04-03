return {
  "nvim-lua/plenary.nvim", -- Required dependency for many plugins. Super useful Lua functions
  {
    "mrjones2014/legendary.nvim", -- A command palette for keymaps, commands and autocmds
    lazy = false,
    priority = 900,
    dependencies = "kkharji/sqlite.lua",
    init = function()
      -- require("legendary").keymaps({
      --   {
      --     "<C-p>",
      --     require("legendary").find,
      --     hide = true,
      --     description = "Open Legendary",
      --     mode = { "n", "v" },
      --   },
      -- })
    end,
    config = function()
      require("legendary").setup({
        select_prompt = "Legendary",
        include_builtin = false,
        include_legendary_cmds = false,
        -- deprecated
        -- which_key = { auto_register = false },
      })
    end,
  },
  {
    "lmburns/lf.nvim",
    enabled = false,
    lazy = false,
    dependencies = "akinsho/toggleterm.nvim",
    init = function()
      -- This feature will not work if the plugin is lazy-loaded
      vim.g.lf_netrw = 1
      vim.g.floaterm_opener = "vsplit"

      require("lf").setup({
        escape_quit = false,
        border = "rounded",
        default_action = "drop",
      })

      vim.keymap.set("n", "<Space>r", [[:Lf<CR>]], { noremap = true, silent = true })
    end,
  },
  {
    "kevinhwang91/rnvimr",
    lazy = false,
    enabled = false,
    init = function()
      vim.keymap.set("n", "<Space>r", [[:RnvimrToggle<CR>]], { noremap = true, silent = true })
      vim.g.rnvimr_enable_picker = 1
    end,
  },
  {
    "kelly-lin/ranger.nvim",
    enabled = false,
    config = function()
      require("ranger-nvim").setup({ replace_netrw = true })
      vim.api.nvim_set_keymap("n", "<Space>r", "", {
        noremap = true,
        callback = function()
          require("ranger-nvim").open(true)
        end,
      })
    end,
  },
  {
    "kevinhwang91/nvim-bqf", -- Better quickfix window,
    ft = "qf",
  },
  { "github/copilot.vim", lazy = false, enabled = false },
  {
    "rafamadriz/friendly-snippets",
    enabled = false,
  },
  {
    "folke/flash.nvim",
    enabled = false,
  },
  {
    "chentoast/marks.nvim",
    config = function()
      require("marks").setup({})
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
  },
  {
    "ptzz/lf.vim",
    dependencies = "voldikss/vim-floaterm",
    lazy = false,
    config = function()
      vim.g.lf_command_override = "lf-fm"
      vim.g.floaterm_opener = "drop"
      vim.keymap.set("n", "<Space>r", [[:Lf<CR>]], { noremap = true, silent = true })
    end,
  },
}
