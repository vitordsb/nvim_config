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
          adaptive_size = true,
          width = 25,
          side = "left",
        },
        renderer = {
          root_folder_label=false,
          indent_width =1,
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
    end,
  },
}

