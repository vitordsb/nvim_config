local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map("n", "<C-p>", "<cmd>Telescope find_files<cr>", opts) -- busca de arquivos
map("v", "<C-c>", "+y", opts) -- copiar visual
map("n", "<C-v>", "+p", opts) -- colar normal
map("v", "<C-v>", "+p", opts) -- colar visual
map("i", "<C-v>", "<C-r>+", opts) -- colar no insert
map("v", "<C-x>", "+d", opts) -- recortar visual
map("n", "<C-z>", "u", opts)
map("i", "<C-z>", "<C-o>u", opts)
map("n", "<C-S-z>", "<C-r>", opts)
map("i", "<C-S-z>", "<C-o><C-r>", opts)
map("v", "<Tab>", ">gv", opts)      -- indentação direita
map("v", "<S-Tab>", "<gv", opts)    -- indentação esquerda
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

