return {
  "windwp/nvim-autopairs",  -- Plugin yang digunakan
  event = "InsertEnter",    -- Memuat plugin saat mode insert dimulai (menghemat waktu startup)
  config = function()
    require("nvim-autopairs").setup() -- Menginisialisasi plugin dengan pengaturan default
  end
}

