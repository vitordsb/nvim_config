return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons", 
    },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 30,
          side = "right",
        },
        renderer = {
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
            },
          },
        },
        actions = {
          open_file = {
            resize_window = true,
          },
        },
      })
      vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
      vim.keymap.set("n", "<leader>bf", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Find File in NvimTree" })
    end,
  },
}

