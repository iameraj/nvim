--[[
--      All of the plugins and their configs go here
--]]
return {
    -- Treesitter --
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { "cpp", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python" },
                sync_install = false,
                auto_install = false,
                -- ignore_install = { "javascript", "typescript" },

                highlight = {
                    enable = true,

                    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
                    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
                    -- the name of the parser)
                    -- list of language that will be disabled
                    -- disable = { "c", "rust" },
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
                }
            }
        end
    },

    ---  nordic.lua ---
    {
        'AlexvZyl/nordic.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('nordic').load()
            require('nordic').setup({
                -- This callback can be used to override the colors used in the base palette.
                on_palette = function(palette) end,
                -- This callback can be used to override the colors used in the extended palette.
                after_palette = function(palette) end,
                -- This callback can be used to override highlights before they are applied.
                on_highlight = function(highlights, palette) end,
                -- Enable bold keywords.
                bold_keywords = false,
                -- Enable italic comments.
                italic_comments = true,
                -- Enable editor background transparency.
                transparent = {
                    -- Enable transparent background.
                    bg = true,
                    -- Enable transparent background for floating windows.
                    float = true,
                },
                -- Enable brighter float border.
                bright_border = false,
                -- Reduce the overall amount of blue in the theme (diverges from base Nord).
                reduced_blue = true,
                -- Swap the dark background with the normal one.
                swap_backgrounds = false,
                -- Cursorline options.  Also includes visual/selection.
                cursorline = {
                    -- Bold font in cursorline.
                    bold = false,
                    -- Bold cursorline number.
                    bold_number = true,
                    -- Available styles: 'dark', 'light'.
                    theme = 'dark',
                    -- Blending the cursorline bg with the buffer bg.
                    blend = 0.85,
                },
                noice = {
                    -- Available styles: `classic`, `flat`.
                    style = 'classic',
                },
                telescope = {
                    -- Available styles: `classic`, `flat`.
                    style = 'flat',
                },
                leap = {
                    -- Dims the backdrop when using leap.
                    dim_backdrop = false,
                },
                ts_context = {
                    -- Enables dark background for treesitter-context window
                    dark_background = true,
                }
            })
        end
    },


    ---  tokyonight.lua ---
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("tokyonight").setup {
                transparent = false,
                -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1
                day_brightness = 0.05,
                styles = {
                    keyword = { italic = false },
                },
            }
        end
    },


    ---  dap.lua ---
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            require("dapui").setup()
        end
    },


    ---  lualine.lua.bak ---
    --[[
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    --]]


    ---  indent_blankline.lua ---
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("ibl").setup {
                indent = {
                    char = "┊", -- ┆┋, check :help ibl.config.indent.char
                },
                scope = {
                    show_start = false,
                    show_end = false,
                    enabled = true,
                }
            }
        end
    },



    ---  tokyodark.lua ---
    {
        "tiagovla/tokyodark.nvim",
        opts = {
            terminal_colors = false, -- enable terminal colors
        },
        config = function(_, opts)
            require("tokyodark").setup(opts)
        end,
    },


    ---  gitsigns.lua ---
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup {
                signs                        = {
                    add          = { text = '+' },
                    change       = { text = '*' },
                    delete       = { text = '_' },
                    topdelete    = { text = '‾' },
                    changedelete = { text = '~' },
                    untracked    = { text = '┆' },
                },
                signs_staged                 = {
                    add          = { text = '┃' },
                    change       = { text = '┃' },
                    delete       = { text = '┃' },
                    topdelete    = { text = '┃' },
                    changedelete = { text = '┃' },
                    untracked    = { text = '┃' },
                },
                signs_staged_enable          = true,
                signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
                numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
                linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
                word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
                watch_gitdir                 = {
                    follow_files = true
                },
                auto_attach                  = true,
                attach_to_untracked          = false,
                current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts      = {
                    virt_text = true,
                    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                    delay = 1000,
                    ignore_whitespace = false,
                    virt_text_priority = 100,
                    use_focus = true,
                },
                current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
                sign_priority                = 6,
                update_debounce              = 100,
                status_formatter             = nil, -- Use default
                max_file_length              = 40000, -- Disable if file is longer than this (in lines)
                preview_config               = {
                    -- Options passed to nvim_open_win
                    border = 'single',
                    style = 'minimal',
                    relative = 'cursor',
                    row = 0,
                    col = 1
                },
            }
        end
    },


    ---  ayu.lua ---
    {
        "Shatur/neovim-ayu",
        config = function()
            require('ayu').setup({
                overrides = {
                    Normal = { bg = "None" },
                    ColorColumn = { bg = "None" },
                    SignColumn = { bg = "None" },
                    Folded = { bg = "None" },
                    FoldColumn = { bg = "None" },
                    CursorLine = { bg = "None" },
                    CursorColumn = { bg = "None" },
                    WhichKeyFloat = { bg = "None" },
                    VertSplit = { bg = "None" }
                }
            })
        end
    },


    ---  onedarkpro.lua ---
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000, -- Ensure it loads first
    },


    ---  telescope.lua ---
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },


    ---  rustaceanvim.lua ---
    {
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
        lazy = false,   -- This plugin is already lazy
    },


    ---  lsp-zero.lua ---
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/nvim-cmp'
        }
    },
}
