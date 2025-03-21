return {
  -- 🔹 Plugin utama untuk LSP
  { "neovim/nvim-lspconfig" },

  -- 🔹 Plugin untuk mengelola dan menginstal server LSP
  {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim", "jay-babu/mason-null-ls.nvim" },
    config = function()
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "pyright", "html", "cssls" }, -- Sesuaikan dengan kebutuhan
        automatic_installation = true,
      })

      require("mason-null-ls").setup({
        ensure_installed = { "prettier", "eslint_d", "stylua", "black", "shfmt" }, -- Sesuaikan dengan kebutuhan
        automatic_installation = true,
      })
    end,
  },

  -- 🔹 Plugin untuk auto-completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "mason.nvim", "jay-babu/mason-null-ls.nvim" },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          -- 🔸 Formatters
          null_ls.builtins.formatting.prettier, -- JavaScript, TypeScript, HTML, CSS
          null_ls.builtins.formatting.stylua, -- Lua
          null_ls.builtins.formatting.black, -- Python
          null_ls.builtins.formatting.shfmt, -- Shell script

          -- 🔸 Linters
          null_ls.builtins.diagnostics.eslint_d, -- JavaScript/TypeScript
        },
      })

      -- Keybinding untuk format file
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end,
  },
}
