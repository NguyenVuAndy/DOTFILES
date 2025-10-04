-- ~/.config/nvim/lua/plugins.lua

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

-- List of plugins
require("lazy").setup({
  -- Theme
  { "morhetz/gruvbox" },

  -- LSP + completion
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/vim-vsnip" },
  { "ray-x/lsp_signature.nvim" },

  -- Syntax highlighting
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- UI
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "windwp/nvim-autopairs" },
  { "tpope/vim-surround" },
  { "tpope/vim-commentary" },
  { "tpope/vim-fugitive" },
  { "junegunn/fzf" },
  { "junegunn/fzf.vim" },

  -- Optional extras
  { "easymotion/vim-easymotion" },
  { "ntpeters/vim-better-whitespace" },
  { "neovimhaskell/haskell-vim" },
  { "rust-lang/rust.vim" },
  { "mfussenegger/nvim-jdtls" },
})

