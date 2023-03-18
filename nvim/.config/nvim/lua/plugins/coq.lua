-- Coq autocompletion plugin
--
-- Autostart must be set before package is loaded.
vim.g.coq_settings = {
  auto_start = "shut-up"
}

return {
  {
    "ms-jpq/coq_nvim",
    branch = "coq",
    enabled = false,
  },
}
