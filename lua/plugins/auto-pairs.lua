return {  
{
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
      enable_check_bracket_line = false,
      map_cr = true,      -- Enter já pula pro próximo par
      map_bs = true,      -- backspace inteligente
    },
  },
}
