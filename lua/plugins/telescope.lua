return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
    })

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<C-P>", builtin.find_files, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep,    { noremap = true, silent = true })
    vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, { noremap = true, silent = true })
  end,
}
