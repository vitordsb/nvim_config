return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 12,
        open_mapping = [[<C-j>]],
        direction = "horizontal",
          float_opts = {
          winblend = 3,
        },
        close_on_exit = true,
        persist_size = true,
      })

      vim.keymap.set("n", "<leader>jf", ":ToggleTerm direction=float<CR>", { desc = "Terminal Float" })
    end,
  },
}

