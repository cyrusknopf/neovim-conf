-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- Load the Gleam language server, separate to Mason
require("lspconfig").gleam.setup({})

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

-- Disable pink lines? no
vim.g.vimtex_quickfix_mode = 0

-- Custom function to clean up auxiliary files
function CleanAuxFiles()
  -- List of auxiliary files to remove
  local aux_files = {
    "*.aux",
    "*.log",
    "*.out",
    "*.toc",
    "*.fls",
    "*.fdb_latexmk",
    "*.synctex.gz",
  }

  -- Command to delete the files
  for _, file_pattern in ipairs(aux_files) do
    local cmd = "rm " .. file_pattern
    print("Executing: " .. cmd) -- Debug message
    os.execute(cmd)
  end
end

-- Vimtex compiler hooks
vim.g.vimtex_compiler_hooks = {
  build_init = function()
    CleanAuxFiles()
  end,
  build_success = function()
    CleanAuxFiles()
  end,
}

-- Additional vimtex settings (optional)
vim.g.vimtex_compiler_progname = "neovim-remote" -- Use neovim-remote if using Neovim
