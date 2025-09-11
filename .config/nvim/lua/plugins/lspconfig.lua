local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").denols.setup {
  single_file_support = true,
  settings = {
    deno = {
      enable = true,
      fmt = {
        enable = true,
        options = {
          markdown = true,
          json = true
        }
      }
    },
  },
}
require("lspconfig").clangd.setup {}
require("lspconfig").html.setup {}
require("lspconfig").sqlls.setup {}
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").yamlls.setup {
  filetypes = { "yaml", "yml" },
  settings = {
    yaml = {
      format = {
        enable = true,
      },
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.{yml,yaml}",
        ["https://json.schemastore.org/github-action.json"] = "action.{yml,yaml}",
      },
      validate = true,
      completion = true,
    },
  },
  capabilities = capabilities,
}

require("lspconfig").cssls.setup {
  capabilities = capabilities,
}
