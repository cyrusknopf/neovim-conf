-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- Load the Gleam language server, separate to Mason
require("lspconfig").gleam.setup({})
local nvim_lsp = require("lspconfig")

nvim_lsp.clangd.setup({
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp", "tpp", "h", "hpp" }, -- Add 'tpp' here
  root_dir = nvim_lsp.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
  settings = {
    clangd = {},
  },
})

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
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_view_general_viewer = "/opt/homebrew/bin/zathura"

-- Configure vimtex to use pdflatex
vim.g.vimtex_compiler_method = "latexmk"

-- Ensure vimtex is loaded
vim.g.vimtex_enabled = 1
vim.g.Tex_MultipleCompileFormats = "pdf,bib,pdf"

-- Disable pink lines? no
vim.g.vimtex_quickfix_mode = 0

-- Vimtex compiler hooks
vim.g.vimtex_compiler_hooks = {
  build_init = function() end,
  build_success = function() end,
}

-- Additional vimtex settings (optional)
vim.g.vimtex_compiler_progname = "neovim-remote" -- Use neovim-remote if using Neovim
