local status, nls = pcall(require, "null-ls")
if (not status) then return end

local fmt_group = vim.api.nvim_create_augroup('FORMATTING', { clear = true })

local fmt = nls.builtins.formatting
local dgn = nls.builtins.diagnostics
local cda = nls.builtins.code_actions

nls.setup {
    sources = {
        -- formatting
        fmt.trim_whitespace.with({
            filetypes = { 'text', 'zsh', 'toml', 'make', 'conf', 'tmux' },
        }),
        fmt.prettierd,
        fmt.eslint_d,
        fmt.rustfmt,
        fmt.stylua,
        fmt.gofmt,
        fmt.zigfmt,
        fmt.shfmt.with({
            extra_args = { '-i', 4, '-ci', 'sr' },
        }),

        -- diagnostics
        dgn.eslint_d,
        dgn.shellcheck,
        dgn.luacheck.with({
            extra_args = { '--globals', 'vim', '--std', 'luajit' },
        }),

        -- code actions
        cda.eslint_d,
        cda.shellcheck,
    },
    on_attach = function(client, buf)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = fmt_group,
                buffer = buf,
                callback = function()
                    vim.lsp.buf.format({
                        timeout_ms = 3000,
                        buffer = buf,
                    })
                end,
            })
        end
    end
}

