return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        hover = {
          enabled = true,
          view = nil, -- when nil, use defaults from documentation
          opts = {
            -- limit the height of the hover window (for documentation)
            size = { max_width = 80, max_height = 20 },
          },
        },
      },
    },
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },
  -- active indent guide and indent text objects
  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        -- Disables animation
        -- animation = require("mini.indentscope").gen_animation.none(),
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>un",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Dismiss All Notifications",
      },
    },
    opts = {
      stages = "static",
      -- level = 4,
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    },
  },
}
