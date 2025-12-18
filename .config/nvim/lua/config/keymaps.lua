-- Keymaps for native nvim operations
-- Plugins should set their own keymaps

local map = vim.keymap.set

-- Session controls
map('n', '<leader>q', '<Cmd>quit<CR>')
map('n', '<leader>R', '<Cmd>restart<CR>')
map('n', '<Esc>', '<Cmd>nohlsearch<CR>')

-- Buffer controls
map('n', '<leader>bd', '<Cmd>bdelete<CR>')
map('n', '<leader>bb', '<Cmd>edit #<CR>')

-- Window controls
map('n', '<leader>wv', '<Cmd>vsplit<CR>')
map('n', '<leader>ws', '<Cmd>split<CR>')
map('n', '<leader>wq', '<C-w><C-q>')
map('n', '<C-h>', '<C-w><C-h>')
map('n', '<C-j>', '<C-w><C-j>')
map('n', '<C-k>', '<C-w><C-k>')
map('n', '<C-l>', '<C-w><C-l>')

-- Terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>')
