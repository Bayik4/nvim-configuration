return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    -- fill any relevant options here
  },
  config = function()
    vim.keymap.set('n', '<C-b>', ':Neotree filesystem reveal right<CR>')

    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true, -- Tampilkan file tersembunyi seperti .env dan .gitignore
          hide_dotfiles = false,
          hide_gitignored = false,
        }
      }
    })
  end
}
