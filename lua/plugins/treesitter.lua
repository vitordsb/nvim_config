return {
{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
        ensure_installed = {
      "bash","comment","css","html", "javascript", "jsdoc", "jsonc", "lua", "markdown", "regex", "scss", "toml", "typescript", "yaml", "gdscript" },
      highlight = {enable = true},
      indent = { enable = true },
    })
  end,
},
}
