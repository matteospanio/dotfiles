local map = vim.keymap

vim.g.mapleader = " "

-- Increment/decrement
map.set('n', '+', '<C-a>')
map.set('n', '-', '<C-x>')

-- Select all
map.set('n', '<C-a>', 'gg<S-v>G')

-- Move between buffers
map.set('n', '<leader>l', ':bn<CR>')
map.set('n', '<leader>h', ':bp<CR>')

-- Close current buffer
map.set('n', '<leader>w', ':bd<CR>')
