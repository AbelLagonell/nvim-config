-- define common options
local opts = {
    noremap = true, -- non-recursive
    silent = true,  -- do not show message
}

local wk = require("which-key")
local builtin = require('telescope.builtin')

wk.add({
    -- Terminal
    { "<leader>h", ":ToggleTerm size=20 direction=horizontal<CR>", desc = "Horizontal Terminal" },
    { "<leader>v", ":ToggleTerm size=80 direction=vertical<CR>",   desc = "Vertical Terminal" },


    -- Splitting
    { "<leader>x", ":vsplit<CR>",                                  desc = "Vertical Split" },
    { "<leader>z", ":split<CR>",                                   desc = "Horizontal Split" },

    -- Quick stuff
    { "<C-q>",     ":q<CR>",                                       desc = "Quit" },
    { "<C-s>",     ":w<CR>",                                       desc = "Save" },

    -- Better window navigation
    { "<C-h>",     "<C-w>h",                                       desc = "Move Left" },
    { "<C-j>",     "<C-w>j",                                       desc = "Move Down" },
    { "<C-k>",     "<C-w>k",                                       desc = "Move Up" },
    { "<C-l>",     "<C-w>l",                                       desc = "Move Right" },


    -- Resize with arrows
    { "<C-Down>",  ":resize +2<CR>",                               desc = "Resize Down" },
    { "<C-Left>",  ":vertical resize -2<CR>",                      desc = "Resize Left" },
    { "<C-Right>", ":vertical resize +2<CR>",                      desc = "Resize Right" },
    { "<C-Up>",    ":resize -2<CR>",                               desc = "Resize Up" },

    -- File Explorer
    { "<leader>a", ":NvimTreeOpen<CR>",                            desc = "Open File Explorer" },
    { "<leader>s", ":NvimTreeToggle<CR>",                          desc = "Toggle File Explorer" },

    -- Telescope
    {
        { "<leader>f",  group = "file" },
        { "<leader>fb", builtin.find_files, desc = "Buffers" },
        { "<leader>ff", builtin.live_grep,  desc = "Find Files" },
        { "<leader>fg", builtin.buffers,    desc = "Live Grep" },
        { "<leader>fh", builtin.help_tags,  desc = "Help Tags" },
    },

    --Tabs
    { "<S-Tab>", ":bprevious<CR>", desc = "Previous Tab" },
    { "<Tab>",   ":bnext<CR>",     desc = "Next Tab" },

    --Visual Mode
    {
        mode = { "v" },
        { "<", "<gv", desc = "Indent Left" },
        { ">", ">gv", desc = "Indent Right" },

    }
})
