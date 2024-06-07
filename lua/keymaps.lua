-- define common options
local opts = {
    noremap = true, -- non-recursive
    silent = true,  -- do not show message
}

local wk = require("which-key")

-- Terminal
wk.register({
    v = { ":ToggleTerm size=80 direction=vertical<CR>", "Vertical Terminal" },
    h = { ":ToggleTerm size=20 direction=horizontal<CR>", "Horizontal Terminal" },
}, { prefix = "<leader>" })

-- Splitting
wk.register({
    z = { ":split<CR>", "Horizontal Split" },
    x = { ":vsplit<CR>", "Vertical Split" },
}, { prefix = "<leader>" })

-- Quick stuff
wk.register({
    ["<C-s>"] = { ":w<CR>", "Save" },
    ["<C-q>"] = { ":q<CR>", "Quit" },
})

-- Better window navigation
wk.register({
    ["<C-h>"] = { "<C-w>h", "Move Left" },
    ["<C-j>"] = { "<C-w>j", "Move Down" },
    ["<C-k>"] = { "<C-w>k", "Move Up" },
    ["<C-l>"] = { "<C-w>l", "Move Right" },
})

-- Resize with arrows
wk.register({
    ["<C-Up>"] = { ":resize -2<CR>", "Resize Up" },
    ["<C-Down>"] = { ":resize +2<CR>", "Resize Down" },
    ["<C-Left>"] = { ":vertical resize -2<CR>", "Resize Left" },
    ["<C-Right>"] = { ":vertical resize +2<CR>", "Resize Right" },
})

-- Visual mode
wk.register({
    ["<"] = { "<gv", "Indent Left" },
    [">"] = { ">gv", "Indent Right" },
}, { mode = "v" })

-- File Explorer
wk.register({
    a = { ":NvimTreeOpen<CR>", "Open File Explorer" },
    s = { ":NvimTreeToggle<CR>", "Toggle File Explorer" },
}, { prefix = "<leader>" })

-- Telescope
local builtin = require('telescope.builtin')
wk.register({
    ff = { builtin.find_files, "Find Files" },
    fg = { builtin.live_grep, "Live Grep" },
    fb = { builtin.buffers, "Buffers" },
    fh = { builtin.help_tags, "Help Tags" },
}, { prefix = "<leader>" })

-- Tabs
wk.register({
    ["<Tab>"] = { ':bnext<CR>', "Next Tab" },
    ["<S-Tab>"] = { ':bprevious<CR>', 'Previous Tab' }
}, { mode = "n" })
