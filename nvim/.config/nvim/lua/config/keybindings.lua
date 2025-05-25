-- ################################
-- Motion / Navigation
-- ################################

-- Keybinds to make split navigation easier.
-- Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })

vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })

vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })

vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })


-- Close buffer without saving
vim.keymap.set('n', '<leader>fq', '<Cmd>:bd!<CR>', {silent = true})

-- Close and save buffer
vim.keymap.set("n", "<leader>q", "<cmd>:w<CR>:bd<CR>", {})

-- Open next URL in current line
vim.keymap.set("n", "<leader>o", "<cmd>:URLOpenUnderCursor<CR>", {})

-- vim.keymap.set('i', '<Down>', function()
--   if vim.fn.pumvisible() == 1 then return vim.cmd('norm! j') end
--   return '<Down>'
-- end, {silent = true, expr = true})

-- ################################
-- Splits
-- ################################

-- Resize splits
vim.keymap.set('n', '<leader>i', '<C-w>+', { desc = 'Increase split size' })
vim.keymap.set('n', '<leader>d', '<C-w>-', { desc = 'Decrease split size' })



-- ################################
-- Commands
-- ################################

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')



-- ################################
-- LSP
-- ################################
--
-- Open diagnostics on current line
vim.keymap.set("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", {})

-- Open all diagnostics in a pane
vim.keymap.set('n', '<leader>p', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })



-- ################################
-- Terminal
-- ################################

-- Open terminal in current dir in a horizontal split
vim.keymap.set('n', '<leader>h', '<Cmd>:10 split term://%:p:h//bash<CR>:wincmd j<CR>:setlocal nonumber norelativenumber<CR>:startinsert<CR>', {silent = true})

-- Exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })



-- ################################
-- Telescope
-- ################################

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })

vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })

vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })

vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })



-- ################################
-- COQ Nvim
-- ################################

vim.keymap.set("n", "<leader>cr", "<cmd>:COQsnips compile<CR>", { desc = 'Recompile COQ snippets' })

vim.keymap.set("n", "<leader>ce", "<cmd>:COQsnips edit<CR>", { desc = 'Edit COQ snippets for current filetype' })



