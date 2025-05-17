
-- Colorscheme
vim.cmd.colorscheme 'desert'

-- Set space as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("config.lazy")

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

vim.keymap.set({'i', 'c'}, '<C-f>', '<C-x><C-f>', {silent = true})



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
vim.keymap.set('n', '<leader>fq', '<Cmd>:bd!<CR>', {silent = true})

-- Treesitter
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- COQ Nvim
vim.keymap.set("n", "<leader>cr", "<cmd>:COQsnips compile<CR>", {})
vim.keymap.set("n", "<leader>ce", "<cmd>:COQsnips edit<CR>", {})

vim.keymap.set("n", "<leader>q", "<cmd>:w<CR>:bd<CR>", {})

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python", "bash", "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
