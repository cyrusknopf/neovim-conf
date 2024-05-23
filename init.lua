-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

-- Set text wrapping
vim.o.wrap = true
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.showbreak = "↪ "

-- macOS PDF viewer settings
vim.g.vimtex_view_method = "sioyek"
vim.g.vimtex_view_general_viewer = "sioyek"
vim.g.vimtex_view_general_options = "--reuse-instance -n -s @line @tex"
vim.g.vimtex_view_general_options_latexmk = "--reuse-instance -n -s @line @tex"
-- Disable pink lines
vim.g.vimtex_quickfix_mode = 0
