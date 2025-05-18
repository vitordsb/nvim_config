return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      local hour = tonumber(os.date("%H"))
      if hour >= 7 and hour <= 18 then
        vim.cmd.colorscheme("catppuccin-latte")
      else
        vim.cmd.colorscheme("catppuccin-mocha")
      end
    end
  }
}
