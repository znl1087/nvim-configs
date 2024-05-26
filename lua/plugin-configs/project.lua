require("project_nvim").setup(
  {
    detection_methods = {"lsp", "pattern"},
    silent_chdir = true
  }
)
require("telescope").load_extension("projects")
