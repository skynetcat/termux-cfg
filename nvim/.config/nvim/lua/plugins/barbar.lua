return {
  {'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = function()
	    local map = vim.api.nvim_set_keymap
	    local opts = { noremap = true, silent = true }

	    -- Move to previous/next
	    map('n', '<C-,>', '<Cmd>BufferPrevious<CR>', opts)
	    map('n', '<C-.>', '<Cmd>BufferNext<CR>', opts)

	    -- Re-order to previous/next
	    map('n', '<leader><', '<Cmd>BufferMovePrevious<CR>', opts)
	    map('n', '<leader>>', '<Cmd>BufferMoveNext<CR>', opts)

	    -- Goto buffer in position...
	    map('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', opts)
	    map('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', opts)
	    map('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', opts)
	    map('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', opts)
	    map('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', opts)
	    map('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', opts)
	    map('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', opts)
	    map('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', opts)
	    map('n', '<leader>9', '<Cmd>BufferGoto 9<CR>', opts)
	    map('n', '<leader>0', '<Cmd>BufferLast<CR>', opts)

	    -- Pin/unpin buffer
	    map('n', '<leader>p', '<Cmd>BufferPin<CR>', opts)

	    -- Goto pinned/unpinned buffer
	    --                 :BufferGotoPinned
	    --                 :BufferGotoUnpinned

	    -- Close buffer
	    map('n', '<leader>q', '<Cmd>w<CR> <Cmd>BufferClose<CR>', opts)

	    -- Wipeout buffer
	    --                 :BufferWipeout

	    -- Close commands
	    --                 :BufferCloseAllButCurrent
	    --                 :BufferCloseAllButPinned
	    --                 :BufferCloseAllButCurrentOrPinned
	    --                 :BufferCloseBuffersLeft
	    --                 :BufferCloseBuffersRight

	    -- Magic buffer-picking mode
	    map('n', '<leader>bp',   '<Cmd>BufferPick<CR>', opts)
	    map('n', '<leader>sp', '<Cmd>BufferPickDelete<CR>', opts)

	    -- Sort automatically by...
	    map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
	    map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
	    map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
	    map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
	    map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

	    -- Other:
	    -- :BarbarEnable - enables barbar (enabled by default)
	    -- :BarbarDisable - very bad command, should never be used
      end,
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
}
