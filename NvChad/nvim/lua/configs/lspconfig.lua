-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "elixirls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.elixirls.setup {
  cmd = { "/Users/genronnewimac/.local/share/nvim/mason/packages/elixir-ls/language_server.sh" };
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
