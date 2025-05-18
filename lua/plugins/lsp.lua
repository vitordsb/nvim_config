return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local mason   = require("mason")
    local mlsp    = require("mason-lspconfig")
    local lspcfg  = require("lspconfig")
    local caps    = require("cmp_nvim_lsp").default_capabilities()

    mason.setup()

    mlsp.setup({
      ensure_installed = {
        "html",    -- html language server
        "cssls",   -- css language server
        "emmet_ls" -- emmet snippets
      },
    })

    lspcfg.html.setup({ capabilities = caps })
    lspcfg.cssls.setup({
      capabilities = caps,
      cmd = { "css-languageserver", "--stdio" },
    })
    lspcfg.emmet_ls.setup({
      capabilities = caps,
      filetypes = { "html", "javascriptreact", "typescriptreact" },
    })
    end,
}

