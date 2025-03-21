return {
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "eslint", "biome", "ast_grep", "vaccum", "intelephense", "sqlls", "vuels", "angular", "csharp_ls", "dockerls" }
    })
  end
}
