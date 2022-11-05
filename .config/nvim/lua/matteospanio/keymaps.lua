local map = vim.keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--  normal_mode = "n"
--  insert_mode = "i"
--  visual_mode = "v"
--  visual_block_mode = "x"
--  term_mode = "t"
--  command_mode = "c"

-- Normal
-- Window navigation
map.set('n', '<C-h>', '<C-w>h')
map.set('n', '<C-j>', '<C-w>j')
map.set('n', '<C-k>', '<C-w>k')
map.set('n', '<C-l>', '<C-w>l')

-- Resize with arrow
map.set('n', '<C-Up>', ':resize -2<CR>')
map.set('n', '<C-Down>', ':resize +2<CR>')
map.set('n', '<C-Left>', ':vertical resize -2<CR>')
map.set('n', '<C-Up>', ':vertical resize +2<CR>')

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

-- Markdown
map.set('n', '<leader>m', ':MarkdownPreviewToggle<CR>')
