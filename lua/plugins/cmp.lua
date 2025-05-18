return {
  {"mason-org/mason.nvim"},
  "hrsh7th/nvim-cmp",
  dependencies = {
    "neovim/nvim-lspconfig",        -- LSP client
    "hrsh7th/cmp-nvim-lsp",         -- LSP completions
    "hrsh7th/cmp-buffer",           -- buffer words
    "hrsh7th/cmp-path",             -- filesystem paths
    "saadparwaiz1/cmp_luasnip",     -- LuaSnip source
    "L3MON4D3/LuaSnip",             -- snippet engine
    "rafamadriz/friendly-snippets", -- VSCode-style snippets
    "zbirenbaum/copilot-cmp",       -- Copilot completions
  },
  config = function()
    local cmp       = require("cmp")
    local luasnip   = require("luasnip")
    local lspconfig = require("lspconfig")

    require("luasnip.loaders.from_vscode").lazy_load()

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    for _, server in ipairs({ "html", "cssls", "ts_ls", "emmet_ls" }) do
      local opts = { capabilities = capabilities }
      if server == "cssls" then
        opts.cmd = { "css-languageserver", "--stdio" }
      elseif server == "ts_ls" then
        opts.cmd = { "typescript-language-server", "--stdio" }
        opts.filetypes = { 
          "javascript", 
          "typescript", 
          "javascriptreact", 
          "typescriptreact" 
        }
      elseif server == "emmet_ls" then
        opts.filetypes = { 
          "html",
          "javascriptreact", 
          "typescriptreact" 
        }
      end
      lspconfig[server].setup(opts)
    end

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true })
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        -- Enter também confirma
        ["<CR>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true })
          else
            fallback()
          end
        end, { "i", "s" }),

        -- Left/Right para pular placeholders de snippet
        ["<Right>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<Left>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),

        -- Ctrl+Space: abre/completa e, se menu aberto, seleciona próximo item
        ["<C-Space>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            cmp.complete()
          end
        end, { "i", "s" }),
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip"  },
        { name = "buffer"   },
        { name = "path"     },
        { name = "codeium"  },
        { name = "copilot"  },
      },
      experimental = {
        ghost_text = true, -- ghost text como no VSCode
      },
    })
  end,
}

