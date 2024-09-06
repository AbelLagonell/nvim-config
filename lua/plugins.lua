local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- LSP manager
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",

    -- Vscode-like pictograms
    {
        "onsails/lspkind.nvim",
        event = { "VimEnter" },
    },
    -- Auto-completion engine
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "lspkind.nvim",
            "hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
            "hrsh7th/cmp-buffer",   -- buffer auto-completion
            "hrsh7th/cmp-path",     -- path auto-completion
            "hrsh7th/cmp-cmdline",  -- cmdline auto-completion
        },
        config = function()
            require("config.nvim-cmp")
        end,
    },
    -- Code snippet engine
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
    },

    --Colorscheme
    "tanvirtin/monokai.nvim",
    'folke/tokyonight.nvim',


    --Thing at Bottom
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("config.lualine")
        end,
    },

    --File Explorer
    {
        'nvim-tree/nvim-tree.lua',
        lazy = true,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require("nvim-tree").setup()
        end
    },

    --Tabs
    {
        'akinsho/bufferline.nvim',
        lazy = false,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            "echasnovski/mini.nvim",
        },
        config = function()
            require("config.bufferline")
        end
    },

    "tiagovla/scope.nvim",

    --Pairing
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },

    {
        "windwp/nvim-ts-autotag",
        config = function()
            require('nvim-ts-autotag').setup({
                opts = {
                    -- Defaults
                    enable_close = true,         -- Auto close tags
                    enable_rename = true,        -- Auto rename pairs of tags
                    enable_close_on_slash = true -- Auto close on trailing </
                },
            })
        end
    },

    --Folding
    {
        'anuvyklack/pretty-fold.nvim',
        config = function()
            require('pretty-fold').setup()
        end,
        lazy = false
    },

    --Terminal
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true
    },

    --Commenting
    {
        'numToStr/Comment.nvim',
        lazy = false,
    },

    --Looking for files
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    --Remembering the keybinds
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
    },

    --Auto Format
    {
        "stevearc/conform.nvim",
        event = 'BufWritePre',
        config = function()
            require("config.conform")
        end
    },

    --GIT
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration

            "nvim-telescope/telescope.nvim", -- optional
        },
        config = true
    },

    {
        "lewis6991/gitsigns.nvim",
        event = "User Filepost",
        config = function(_, opts)
            dofile(vim.g.base46_cache .. "git")
            require("gitsigns").setup(opts)
        end
    },

    --Colors
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end
    },

    --Icons
    {
        'nvim-tree/nvim-web-devicons',
        config = function()
            require('config.web-devicons')
        end
    },

    {
        "echasnovski/mini.nvim",
        version = false,
    },

    --Line for indentation
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    --Python Code Runner--
    {
        "hkupty/iron.nvim",
        config = function(plugins, opts)
            local iron = require("iron.core")

            iron.setup({
                config = {
                    -- Whether a repl should be discarded or not
                    scratch_repl = true,
                    -- Your repl definitions come here
                    repl_definition = {
                        python = {
                            -- Can be a table or a function that
                            -- returns a table (see below)
                            command = { "python" },
                        },
                    },
                    -- How the repl window will be displayed
                    -- See below for more information
                    repl_open_cmd = require("iron.view").right(60),
                },
                -- Iron doesn't set keymaps by default anymore.
                -- You can set them here or manually add keymaps to the functions in iron.core
                keymaps = {
                    send_motion = "<space>rc",
                    visual_send = "<space>rc",
                    send_file = "<space>rf",
                    send_line = "<space>rl",
                    send_mark = "<space>rm",
                    mark_motion = "<space>rmc",
                    mark_visual = "<space>rmc",
                    remove_mark = "<space>rmd",
                    cr = "<space>r<cr>",
                    interrupt = "<space>r<space>",
                    exit = "<space>rq",
                    clear = "<space>rx",
                },
                -- If the highlight is on, you can change how it looks
                -- For the available options, check nvim_set_hl
                highlight = {
                    italic = true,
                },
                ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
            })

            -- iron also has a list of commands, see :h iron-commands for all available commands
            vim.keymap.set("n", "<space>rs", "<cmd>IronRepl<cr>")
            vim.keymap.set("n", "<space>rr", "<cmd>IronRestart<cr>")
            vim.keymap.set("n", "<space>rF", "<cmd>IronFocus<cr>")
            vim.keymap.set("n", "<space>rh", "<cmd>IronHide<cr>")
        end,
    },

    --CSV Colorizer--
    {
        'cameron-wags/rainbow_csv.nvim',
        config = true,
        ft = {
            'csv',
            'tsv',
            'csv_semicolon',
            'csv_whitespace',
            'csv_pipe',
            'rfc_csv',
            'rfc_semicolon'
        },
        cmd = {
            'RainbowDelim',
            'RainbowDelimSimple',
            'RainbowDelimQuoted',
            'RainbowMultiDelim'
        }
    }
})
