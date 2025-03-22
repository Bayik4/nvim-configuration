vim.api.nvim_create_autocmd("WinResized", {
  group = vim.api.nvim_create_augroup("AlphaResize", { clear = true }),
  pattern = "*",
  callback = function()
    if vim.fn.empty(vim.fn.bufname()) == 1 then
      return
    end
    local ok, alpha = pcall(require, "alpha")
    if ok then
      alpha.redraw()
    end
  end,
})
