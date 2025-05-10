-- Colorscheme
vim.cmd.colorscheme 'desert'

-- Set space as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Enable line numbers and relative line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
vim.opt.confirm = true

-- Highlight the line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- Share clipboard with system
-- schedule after 'UiEnter' to decrease startup time.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('my-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set tab to 2 spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.bo.softtabstop = 2
vim.opt.expandtab = true


-- ##############################
--  KEYMAPS
-- ##############################

-- Keybinds to make split navigation easier.
-- Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Autocomplete path
--[[
vim.keymap.set({'i', 'c'}, '/', function()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  local prevChar = vim.api.nvim_get_current_line():sub(col,col)

  if vim.fn.pumvisible() == 1 then
    return '/'
  end

  if prevChar ~= '/' then
    return '<C-x><C-f><C-p>'
  else
    return '/'
  end
end, {silent = true, expr = true})
--]]

vim.keymap.set({'i', 'c'}, '<C-f>', '<C-x><C-f><C-p>', {silent = true})



-- Navigate in autocomplete
-- down/next
vim.keymap.set('i', '<Tab>', function()
  if vim.fn.pumvisible() == 1 then return '<c-n>' end
  return '<Tab>'
end, {silent = true, expr = true})

-- up/previous
vim.keymap.set('i', '<S-Tab>', function()
  if vim.fn.pumvisible() == 1 then return '<c-p>' end
  return '<S-Tab>'
end, {silent = true, expr = true})

-- accept
vim.keymap.set('i', '<Enter>', function()
  if vim.fn.pumvisible() == 1 then return '<c-y><c-x><c-f><c-p>' end
  return '<Enter>'
end, {silent = true, expr = true})

-- reject
vim.keymap.set('i', '<Esc>', function()
  if vim.fn.pumvisible() == 1 then return '<c-e>' end
  return '<Esc>'
end, {silent = true, expr = true})


-- Resize splits
vim.keymap.set('n', '<leader>i', '<C-w>+', { desc = 'Increase split size' })
vim.keymap.set('n', '<leader>d', '<C-w>-', { desc = 'Decrease split size' })


-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Open diagnostics on current line
vim.keymap.set("n", "<leader>q", "<cmd>lua vim.diagnostic.open_float()<CR>", {})

-- Open all diagnostics in a pane
vim.keymap.set('n', '<leader>p', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Open terminal in current dir in a horizontal split
vim.keymap.set('n', '<leader>h', '<Cmd>:10 split term://%:p:h//bash<CR>:wincmd j<CR>:setlocal nonumber norelativenumber<CR>:startinsert<CR>', {silent = true})

-- Exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Close buffer
vim.keymap.set('n', '<leader>c', '<Cmd>:bd!<CR>', {silent = true})
