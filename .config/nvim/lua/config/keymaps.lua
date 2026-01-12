-- Keymaps for native nvim operations
-- Plugins should set their own keymaps

local map = vim.keymap.set

-- Session controls
map({'n', 'x'}, '<leader>q', '<Cmd>quit<CR>')
map({'n', 'x'}, '<leader>R', '<Cmd>restart<CR>')
map({'n'}, '<Esc>', '<Cmd>nohlsearch<CR>')
map({'n', 'x'}, '<leader>m', '<Cmd>make<CR>')
map({'n', 'x'}, '<leader>M', '<Cmd>set makeprg=')

map({'n', 'x'}, '<leader>q', '<Cmd>copen<CR>')

-- Buffer controls
map({'n', 'x'}, '<leader>bd', '<Cmd>bdelete<CR>')
map({'n', 'x'}, '<leader>bb', '<Cmd>edit #<CR>')

-- Window controls
map({'n', 'x'}, '<leader>wv', '<Cmd>vsplit<CR>')
map({'n', 'x'}, '<leader>ws', '<Cmd>split<CR>')
map({'n', 'x'}, '<leader>wq', '<C-w><C-q>')
map({'n', 'x'}, '<C-h>', '<C-w><C-h>')
map({'n', 'x'}, '<C-j>', '<C-w><C-j>')
map({'n', 'x'}, '<C-k>', '<C-w><C-k>')
map({'n', 'x'}, '<C-l>', '<C-w><C-l>')

-- Terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>')
