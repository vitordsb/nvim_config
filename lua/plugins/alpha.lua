return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha     = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
    }

    dashboard.section.footer.val = {
      "Programador que não faz engenharia é pedreiro de CRUD"
    }

    for _, sect in ipairs({ "header", "buttons", "footer" }) do
      if dashboard.section[sect] then
        dashboard.section[sect].opts = { position = "center" }
      end
    end

    local total_lines = #dashboard.section.header.val
                      + #dashboard.section.buttons.val
                      + #dashboard.section.footer.val
                      + 4 -- espaçamentos extras
    local win_h = vim.fn.winheight(0)
    local top_pad = math.max(0, math.floor((win_h - total_lines) / 2))

    dashboard.config.layout = {
      { type = "padding", val = top_pad },
      { type = "text",    val = dashboard.section.header.val,  opts = dashboard.section.header.opts  },
      { type = "padding", val = 2 },
      { type = "group",   val = dashboard.section.buttons.val, opts = dashboard.section.buttons.opts },
      { type = "padding", val = 1 },
      { type = "text",    val = dashboard.section.footer.val,  opts = dashboard.section.footer.opts  },
    }

    alpha.setup(dashboard.config)
  end,
}

