return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      "p00f/clangd_extensions.nvim",
    },
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = true,
        virtual_text = false,
        severity_sort = true,
      },
    },
    init = function()
      vim.g.autoformat = false

      require("legendary").keymaps({
        {
          "<leader>cm",
          ":Mason",
          description = "Open Mason",
          mode = { "n" },
        },
      })

      vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
          local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            source = "always",
            prefix = " ",
            scope = "cursor",
          }
          vim.diagnostic.open_float(nil, opts)
        end,
      })

      local client_capabilities = vim.lsp.protocol.make_client_capabilities()
      client_capabilities = require("cmp_nvim_lsp").default_capabilities(client_capabilities)
      client_capabilities.offsetEncoding = { "utf-16" }

      require'lspconfig'.tsserver.setup{
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
              languages = {"javascript", "typescript", "vue"},
            },
          },
        },
        filetypes = {
          "javascript",
          "typescript",
          "vue",
        },
      }

      require("typescript").setup({})
      require("lspconfig").eslint.setup({})
      -- require'lspconfig'.volar.setup{
      --   settings = {}
      -- }
      require'lspconfig'.pyright.setup{
        filetypes = {
          "python",
        },
        settings = {
          python = {
            analysis = {
              ignore = { "**/*.xsh" },
              typeCheckingMode = "standard",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "openFilesOnly",
            },
          },
        },
      }

      require("clangd_extensions").setup({
        server = {
          -- on_attach = prefer_null_ls_fmt,
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--completion-style=bundled",
            "--header-insertion=iwyu",
            "--cross-file-rename",
          },
          init_options = {
            clangdFileStatus = true,
            usePlaceholders = true,
            completeUnimported = true,
            semanticHighlighting = true,
          },
          capabilities = client_capabilities,
        },
        extensions = { inlay_hints = { only_current_line = false, show_variable_name = true } },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "help",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "vue",
      },
    },
  },
}
