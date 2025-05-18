-- ################################
-- Treesitter
-- ################################

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
    disable = { "" },
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



-- ################################
-- Url-open
-- ################################

-- default values
require("url-open").setup({
    -- default will open url with default browser of your system or you can choose your browser like this
    -- open_app = "micorsoft-edge-stable",
    -- google-chrome, firefox, micorsoft-edge-stable, opera, brave, vivaldi
    open_app = "default",
    -- If true, only open the URL when the cursor is in the middle of the URL.
    -- If false, open the next URL found from the cursor position,
    -- which means you can open a URL even when the cursor is in front of the URL or in the middle of the URL.
    open_only_when_cursor_on_url = false,
    highlight_url = {
        all_urls = {
            enabled = true,
            -- fg #21d5ff
            fg = "#7daea3", -- "text" or "#rrggbb"
            -- fg = "text", -- text will set underline same color with text
            bg = nil, -- nil or "#rrggbb"
            underline = true,
        },
        cursor_move = {
            enabled = true,
            fg = "#282828", -- "text" or "#rrggbb"
            -- fg = "text", -- text will set underline same color with text
            bg = "#7daea3", -- nil or "#rrggbb"
            underline = true,
        },
    },
    deep_pattern = true,
    -- a list of patterns to open url under cursor
    extra_patterns = {
        -- {
        -- 	  pattern = '["]([^%s]*)["]:%s*"[^"]*%d[%d%.]*"',
        -- 	  prefix = "https://www.npmjs.com/package/",
        -- 	  suffix = "",
        -- 	  file_patterns = { "package%.json" },
        -- 	  excluded_file_patterns = nil,
        -- 	  extra_condition = function(pattern_found)
        -- 	    return not vim.tbl_contains({ "version", "proxy" }, pattern_found)
        -- 	  end,
        -- },
		-- so the url will be https://www.npmjs.com/package/[pattern_found]


        -- {
        -- 	  pattern = '["]([^%s]*)["]:%s*"[^"]*%d[%d%.]*"',
        -- 	  prefix = "https://www.npmjs.com/package/",
        -- 	  suffix = "/issues",
        -- 	  file_patterns = { "package%.json" },
        -- 	  excluded_file_patterns = nil,
        -- 	  extra_condition = function(pattern_found)
        -- 	    return not vim.tbl_contains({ "version", "proxy" }, pattern_found)
        -- 	  end,
        -- },
		--
		-- so the url will be https://www.npmjs.com/package/[pattern_found]/issues
    },
})
