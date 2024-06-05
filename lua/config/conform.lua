local options = {
    formatters_by_ft = {
        lua = {"sytlua"},
        css = {"prettier"},
        html = {"prettier"},
        rust = {"codelldb"},
    },

    format_on_save ={
        timeout_ms = 500,
        lsp_fallback = true,
    }
}

require("conform").setup(options)
