pcall(require, "impatient")
vim.env.PATH = vim.env.PATH .. ":" .. os.getenv("HOME") .. "/go/bin"
vim.opt.number = true
vim.g.mapleader = " "
vim.env.PATH = vim.env.PATH .. ':' .. os.getenv("HOME") .. '/.local/bin'

require("config.lazy")
require("config.keymaps")

local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
    },
})

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "pylsp", "gopls" },
    automatic_installation = false,
})


vim.lsp.config("clangd", {
    cmd = { "clangd" },
})

vim.lsp.config("pylsp", {})
vim.lsp.config("gopls", {
    cmd = { "gopls" },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
})

vim.lsp.enable({ "clangd", "pylsp", "gopls" })

require("lualine").setup({
    options = { theme = "ayu_dark" },
})

