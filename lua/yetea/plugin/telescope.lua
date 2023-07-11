local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<C-f>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})

require('telescope').setup({
	defaults={ file_ignore_patterns = { ".git/", "node_modules" },}
})
