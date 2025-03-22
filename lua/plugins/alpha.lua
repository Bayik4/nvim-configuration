return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Teks ASCII Header
    dashboard.section.header.val = {
      "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
      "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
      "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
      "██║╚██╗██║██╔══╝  ██║   ██║██║   ██║██║██║╚██╔╝██║",
      "██║ ╚████║███████╗╚██████╔╝╚██████╔╝██║██║ ╚═╝ ██║",
      "╚═╝  ╚═══╝╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝     ╚═╝",
    }

    -- Tombol Pintasan
    dashboard.section.buttons.val = {
      dashboard.button("e", "📄  New File", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "🔍  Find File", ":Telescope find_files <CR>"),
      dashboard.button("r", "📜  Recent Files", ":Telescope oldfiles <CR>"),
      dashboard.button("q", "🚪  Quit", ":qa<CR>"),
    }

    -- Setup Tema Dashboard
    alpha.setup(dashboard.opts)
  end,
}
