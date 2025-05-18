return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    vim.api.nvim_set_hl(0, "IblIndentScope", { fg = "#7E9CD8", nocombine = true })
    require("ibl").setup({
      indent = {
        char = " ",       -- caractere em branco: não mostra nada
      },
      scope = {
        enabled    = true,  -- ativa highlight do escopo atual
        show_start = true,  -- marca também o começo do escopo
        char       = "│",   -- caractere usado para o escopo
        highlight  = "IblIndentScope",
      },
      exclude = {
        filetypes = {
          "help", "alpha", "neo-tree", "Trouble",
          "lazy", "mason", "toggleterm", "terminal",
        },
        buftypes = { "terminal", "nofile" },
      },
    })
  end,
}

