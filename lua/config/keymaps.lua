local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap("n", "<leader>e", ":Neotree<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>s", ":w<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>rrst", ":!cargo run<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>brst", ":!cargo build<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>rbrst", ":!cargo build --release <CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>crst", ":!cargo check<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>l", ":Lazy<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>p", ":Lazy profile<CR>", opts)
