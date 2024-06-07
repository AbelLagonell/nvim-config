require('bufferline').setup {
    options = {
        hover = {
            enabled = true,
            delay = 100,
            reveal = { 'close' },
        },
        separator_style = "slant",
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            if context.buffer:current() then
                return ''
            end

            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
                separator = true,
            }
        }
    }
}
