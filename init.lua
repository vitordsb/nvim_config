
vim.g.mapleader     = " "
vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- use a branch estável
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.api.nvim_create_autocmd({ "InsertLeave", "FocusLost" }, {
  pattern = "*",
  callback = function()
    if vim.bo.modifiable and vim.bo.modified then
      vim.cmd("silent! update")  -- salva sem mensagem
    end
  end,
})

require("lazy").setup({
  { import = "plugins" },
}, {
  change_detection = {
    enabled = false,  -- desliga totalmente o monitoramento e avisos do lazy.nvim
  },
})

require("options")
require("keymaps")

