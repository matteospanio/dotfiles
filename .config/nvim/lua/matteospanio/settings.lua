local o = vim.opt

-- general file encoding
vim.scriptencoding = 'utf-8'
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'

o.mouse = "a"

o.number = true
o.relativenumber = true
o.cursorline = true

o.smarttab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.listchars = {
    tab = "→ ",
    trail = "·",
    nbsp = "◇",
}
o.list = true

o.autoindent = true
o.smartindent = true

-- wrap the line if longer than the window
o.wrap = true

-- dont generate swapfile, use undodir instead
o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = "unnamedplus"

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- search preferences
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true

o.termguicolors = true

o.scrolloff = 8
o.signcolumn = "yes"

--o.cmdheight = 2
o.laststatus = 2

o.updatetime = 100

o.shortmess:append("c")
