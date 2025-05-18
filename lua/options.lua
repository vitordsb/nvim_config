vim.cmd([[filetype plugin indent on]])  -- habilita detecção de filetype
local o = vim.o     -- opções globais
o.number          = true   -- mostra número da linha
o.signcolumn      = "yes"  -- coluna de sinais sempre visível
o.cursorline      = true   -- destaca linha atual
o.relativenumber  = true   -- mostra números relativos
o.expandtab       = true   -- usa espaços em vez de tabs
o.shiftwidth      = 2      -- número de espaços ao indentar
o.softtabstop     = 2      -- tabulações “virtuais” ao inserir
o.tabstop         = 2      -- largura de tab para arquivos
o.ignorecase      = true   -- pesquisa case-insensitive...
o.smartcase       = true   -- ...exceto se conter maiúsculas
o.fileencoding    = "utf-8" -- encoding=utf-8
o.mouse           = "a"
o.hlsearch        = true   -- destaca resultados da busca
o.incsearch       = true   -- busca incremental
o.swapfile        = false  -- desabilita swap files
o.backup          = false  -- desabilita backups
o.undofile        = true   -- habilita histórico de undo
o.wrap            = true  -- não quebra linhas automaticamente
o.linebreak  = true    -- quebra em palavras
o.breakindent = true   -- herda indent da linha original
o.breakindentopt = "shift:2,min:20"  -- opcional, desloca 2 espaços no mínimo
o.laststatus      = 0
o.scrolloff       = 10      -- mantém 8 linhas de margem ao rolar
o.updatetime      = 300    -- tempo de atualização (ms) p/ CursorHold e swap
o.clipboard       = "unnamedplus"  -- usa clipboard do sistema
o.completeopt     = "menu,menuone,noselect"  -- melhor UX p/ LSP/completes
vim.diagnostic.config({
  virtual_text = {
    prefix = "✖ ",                             -- prefixo antes da mensagem
    severity = { min = vim.diagnostic.severity.ERROR },
  },
  signs = false,                               -- desliga signos de warning/info
  underline = false,                            -- sublinha o erro
  update_in_insert = true,                     -- atualiza enquanto você digita
  severity_sort = true,                        -- mostra primeiro erros mais graves
})
