vim.g.mapleader = " "

require("config.lazy")
require("config.keymaps")
local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
        require('luasnip').lsp_expand(args.body)  
         end,
    },
    mapping = {
        ['<Up>'] = cmp.mapping.select_prev_item(),
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-space>'] = cmp.mapping.complete(),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'luasnip' },
    },
})
local lspconfig = require("lspconfig")

lspconfig.clangd.setup{
	cmd = { "clangd" }
}
require("lualine").setup{
	options = { theme = 'ayu_dark' }
}
