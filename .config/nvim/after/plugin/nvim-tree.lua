require("nvim-tree").setup()

local map = vim.keymap

-- toggle nvim-tree
map.set('n', '<leader>t', ':NvimTreeToggle<CR>')
