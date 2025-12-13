-- A 'native' nvim config
-- Uses the native nvim package manager from 0.12 rather than lazy.nvim
-- Prioritizes utilizing built-in nvim features rather than plugins

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'options'
require 'keymaps'
require 'autocmds'

require 'plugins'
