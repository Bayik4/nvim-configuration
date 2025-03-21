local lspconfig = require("lspconfig")

-- Daftar LSP Server yang ingin digunakan
local servers = { "lua_ls", "ts_ls", "pyright", "html", "cssls" }

-- Konfigurasi untuk setiap server LSP
for _, server in ipairs(servers) do
  lspconfig[server].setup({
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  })
end

-- Keybindings untuk LSP
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  end,
})

