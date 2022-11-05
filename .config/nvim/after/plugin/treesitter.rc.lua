local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then
    return
end

ts.setup {
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    ensure_installed = {
        "tsx",
        "toml",
        "bash",
        "dart",
        "dockerfile",
        "rust",
        "c",
        "cpp",
        "php",
        "json",
        "latex",
        "yaml",
        "css",
        "html",
        "lua",
        "markdown",
        "python",
        "javascript",
        "typescript",
    },
    auto_install = true,
    autotag = {
        enable = true,
    },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
