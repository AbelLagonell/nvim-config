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
            'nvim-tree/nvim-web-devicons'
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
                    enable_close = true,          -- Auto close tags
                    enable_rename = true,         -- Auto rename pairs of tags
                    enable_close_on_slash = false -- Auto close on trailing </
                },
                -- Also override individual filetype configs, these take priority.
                -- Empty by default, useful if one of the "opts" global settings
                -- doesn't work well in a specific filetype
                per_filetype = {
                    ["html"] = {
                        enable_close = false
                    }
                }
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

    --Line for indentation
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }

})
