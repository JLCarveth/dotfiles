local options = {
  ensure_installed = { "denols", "clangd", "html", "cssls", "sqlls", "rust_analyzer", "hydra_lsp", "yamlls" }
}

require("mason-lspconfig").setup(options)
