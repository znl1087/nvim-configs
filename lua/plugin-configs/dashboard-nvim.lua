require("dashboard").setup {
  config = {
    "NULLSPACE",
    week_header = {
      enable = true
    },
    shortcut = {
      {desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u"},
      {
        icon = " ",
        icon_hl = "@variable",
        desc = "Files",
        group = "Label",
        action = "Telescope find_files",
        key = "f"
      },
      {
        desc = " dotfiles",
        group = "Number",
        action = "Telescope dotfiles",
        key = "d"
      }
    }
  }
}
