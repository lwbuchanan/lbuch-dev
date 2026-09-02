-- ┌───────────────┐
-- │ Neovim Config │
-- └───────────────┘

-- Helper for autocommands
local gr = vim.api.nvim_create_augroup('custom-config', {})
new_autocmd = function(event, pattern, callback, desc)
  local opts = { group = gr, pattern = pattern, callback = callback, desc = desc }
  vim.api.nvim_create_autocmd(event, opts)
end

-- Helper for package install hooks
on_packchanged = function(plugin_name, kinds, callback, desc)
  local f = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if not (name == plugin_name and vim.tbl_contains(kinds, kind)) then return end
    if not ev.data.active then vim.cmd.packadd(plugin_name) end
    callback(ev.data)
  end
  new_autocmd('PackChanged', '*', f, desc)
end

-- Helper functions for setting load priority
vim.pack.add({ 'https://github.com/nvim-mini/mini.misc' })
local misc = require('mini.misc')
now = function(f) misc.safely('now', f) end
later = function(f) misc.safely('later', f) end
now_if_args = vim.fn.argc(-1) > 0 and now or later
on_event = function(ev, f) misc.safely('event:' .. ev, f) end
on_filetype = function(ft, f) misc.safely('filetype:' .. ft, f) end


-- ┌────────────────┐
-- │ Neovim Options │
-- └────────────────┘

vim.g.mapleader   = ' '            -- Use `<Space>` as <Leader> key
vim.o.mouse       = 'a'            -- Enable mouse
vim.o.switchbuf   = 'usetab'       -- Use already opened buffers when switching
vim.o.undofile    = true           -- Enable persistent undo
vim.o.swapfile    = false          -- Disable swapfiles (just remember to save)

-- UI =========================================================================
vim.o.cursorline     = true                -- Enable current line highlighting
vim.o.cursorlineopt  = 'screenline,number' -- Show cursor line per screen line
vim.o.number         = true                -- Show line numbers
vim.o.signcolumn     = 'yes'               -- Always show signcolumn (less flicker)
vim.o.splitbelow     = true                -- Horizontal splits will be below
vim.o.splitright     = true                -- Vertical splits will be to the right
vim.o.splitkeep      = 'screen'            -- Reduce scroll during window split
vim.o.wrap           = false               -- Don't visually wrap lines (toggle with \w)
vim.o.linebreak      = true                -- Wrap lines at 'breakat' (if 'wrap' is set)
vim.o.breakindent    = true                -- Indent wrapped lines to match line start
vim.o.list           = true                -- Show helpful text indicators
vim.o.listchars      = 'tab:> '

-- Editing ====================================================================
vim.o.autoindent    = true    -- Use auto indent
vim.o.cindent       = true    -- Make indenting smart
vim.o.ignorecase    = true    -- Ignore case during search
vim.o.incsearch     = true    -- Show search matches while typing
vim.o.smartcase     = true    -- Respect case if search pattern has upper case
vim.o.expandtab     = true    -- Convert tabs to spaces
vim.o.shiftwidth    = 2       -- Use this number of spaces for indentation
vim.o.tabstop       = 2       -- Show tab as this number of spaces
vim.o.spelloptions  = 'camel' -- Treat camelCase word parts as separate words
vim.o.virtualedit   = 'block' -- Allow going past end of line in blockwise mode
vim.o.formatoptions = 'rqnl1j'-- Improve comment editing

-- Autocommands ===============================================================

local f = function() vim.cmd('setlocal formatoptions-=c formatoptions-=o') end
new_autocmd('FileType', nil, f, "Proper 'formatoptions'")

-- Diagnostics ================================================================

local diagnostic_opts = {
  signs = { priority = 9999, severity = { min = 'WARN', max = 'ERROR' } },
  underline = { severity = { min = 'HINT', max = 'ERROR' } },
  virtual_lines = false,
  virtual_text = {
    current_line = true,
    severity = { min = 'ERROR', max = 'ERROR' },
  },
  update_in_insert = false,
}

later(function() vim.diagnostic.config(diagnostic_opts) end)

-- ┌─────────────────┐
-- │ Keymap settings │
-- └─────────────────┘
-- Mostly native with a few shortcuts for ':' commands

-- Some helpers
local nmap = function(lhs, rhs, desc)
  vim.keymap.set('n', lhs, rhs, { desc = desc })
end
local xmap = function(lhs, rhs, desc)
  vim.keymap.set('x', lhs, rhs, { desc = desc })
end
local nmap_leader = function(suffix, rhs, desc)
  vim.keymap.set('n', '<Leader>' .. suffix, rhs, { desc = desc })
end
local xmap_leader = function(suffix, rhs, desc)
  vim.keymap.set('x', '<Leader>' .. suffix, rhs, { desc = desc })
end

-- Buffer management
nmap_leader('ba', '<Cmd>b#<CR>',                       'Switch to alternate buffer')
nmap_leader('bd', '<Cmd>bdelete<CR>',                  'Delete current buffer')
nmap_leader('bw', '<Cmd>bwipeout<CR>',                 'Wipeout current buffer')

-- Quickfix/Location list
local toggle_quickfix = function()
  vim.cmd(vim.fn.getqflist({ winid = true }).winid ~= 0 and 'cclose' or 'copen')
end
local toggle_location = function()
  vim.cmd(vim.fn.getloclist({ winid = true }).winid ~= 0 and 'lclose' or 'lopen')
end
nmap_leader('qq', '<Cmd>clist<CR>',                    'Open quickfix list')
nmap_leader('qt', toggle_quickfix,                     'Toggle quickfix list')
nmap_leader('qp', '<Cmd>colder<CR>',                   'Previous/older quickfix list')
nmap_leader('qn', '<Cmd>cnewer<CR>',                   'Next/newer quickfix list')
nmap_leader('lq', '<Cmd>llist<CR>',                    'Open location list')
nmap_leader('lt', toggle_location,                     'Toggle location list')
nmap_leader('lp', '<Cmd>lolder<CR>',                   'Previous/older location list')
nmap_leader('ln', '<Cmd>lnewer<CR>',                   'Next/newer location list')

-- LSP
-- TODO: Only add these if a language server is attached
nmap('gd', '<Cmd>lua vim.lsp.buf.definition()<CR>',    'Goto definition')
nmap('gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>',   'Goto declaration')

-- Terminal
nmap_leader('tt', '<Cmd>vertical term<CR>',            'Open terminal')

-- ┌─────────┐
-- │ Plugins │
-- └─────────┘

-- Colorscheme
now(function()
  vim.pack.add({
    'https://github.com/vague-theme/vague.nvim'
    -- 'https://github.com/ellisonleao/gruvbox.nvim',
    -- 'https://github.com/edeneast/nightfox.nvim',
  })
  vim.cmd("colorscheme vague")
end)

-- Treesitter for better syntax highlighting
now_if_args(function()
  vim.pack.add({
    'https://github.com/nvim-treesitter/nvim-treesitter',
  })

  local languages = {
    'lua',
    'vimdoc',
    'markdown',
    'c',
    'cpp',
    'odin',
  }

  local isnt_installed = function(lang)
    return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0
  end
  local to_install = vim.tbl_filter(isnt_installed, languages)
  if #to_install > 0 then require('nvim-treesitter').install(to_install) end

  -- Enable tree-sitter after opening a file for a target language
  local filetypes = {}
  for _, lang in ipairs(languages) do
    for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
      table.insert(filetypes, ft)
    end
  end
  local ts_start = function(ev) vim.treesitter.start(ev.buf) end
  new_autocmd('FileType', filetypes, ts_start, 'Start tree-sitter')
end)

-- LSP support
now_if_args(function()
  vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })

  vim.lsp.enable({
    clangd,
    ols,
  })
end)

-- Task runner
later(function()
  vim.pack.add({ 'https://github.com/stevearc/overseer.nvim' })
  require("overseer").setup()
end)

-- Picker
later(function()
  vim.pack.add({ 'https://github.com/ibhagwan/fzf-lua' })
  require("fzf-lua").setup()
  require("fzf-lua").register_ui_select()
end)


