require("lualine").setup(
  {
    options = {
      theme = "auto",
      icons_enabled = true,
      refresh = {
        statusline = 200,
        tabline = 1000,
        winbar = 1000
      }
    },
    sections = {
      lualine_a = {"mode"},
      lualine_b = {"branch"},
      lualine_c = {"g:coc_status"},
      lualine_x = {"encoding", "fileformat", "filetype"},
      lualine_y = {"progress"},
      lualine_z = {"location"}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {"filename"},
      lualine_x = {"location"},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = {}
  }
)
