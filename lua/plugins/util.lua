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
    "CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      window = {
        layout = 'float', -- 'vertical', 'horizontal', 'float', 'replace'
        width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
        height = 0.5, -- fractional height of parent, or absolute height in rows when > 1
        -- Options below only apply to floating windows
        relative = 'editor', -- 'editor', 'win', 'cursor', 'mouse'
        border = 'single', -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
        row = nil, -- row position of the window, default is centered
        col = nil, -- column position of the window, default is centered
        title = 'Copilot Chat', -- title of chat window
        footer = nil, -- footer of chat window
        zindex = 1, -- determines if window is on top or below other floating windows
      },
    },
    dev = true
  },
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
    "voldikss/vim-floaterm",
    lazy = false,
    config = function()
      vim.keymap.set("n", "<Space>tt", [[:FloatermToggle!<CR>]], { noremap = true, silent = true })
      vim.g.floaterm_shell = "/opt/homebrew/bin/xonsh"
    end,
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
