local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1", "https://github.com/wbthomason/packer.nvim", install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
  use { "wbthomason/packer.nvim" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim" } -- Useful lua functions used by lots of plugins
  use { "nvim-tree/nvim-web-devicons" }
  use { "nvim-tree/nvim-tree.lua" }
  use { "akinsho/bufferline.nvim" }
  use { "akinsho/toggleterm.nvim" }
	use { "moll/vim-bbye" }
  use { "nvim-lualine/lualine.nvim" }
  use { "ahmedkhalf/project.nvim" }
  use { "lukas-reineke/indent-blankline.nvim" }
  use { "goolord/alpha-nvim" }
  use { "windwp/nvim-autopairs" }
  use { "folke/which-key.nvim" }

  -- Rust
  use { "simrat39/rust-tools.nvim" }

  -- DAP
  use { "mfussenegger/nvim-dap" }
  use { "mfussenegger/nvim-dap-python" }
  use { "rcarriga/nvim-dap-ui", requires = { "nvim-neotest/nvim-nio" } }

	-- Colorschemes
  use { "folke/tokyonight.nvim" }
  use { "lunarvim/darkplus.nvim" }
  use { "ellisonleao/gruvbox.nvim" }

	-- Cmp 
  use { "hrsh7th/nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp" }

	-- Snippets
  use { 'L3MON4D3/LuaSnip' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { "rafamadriz/friendly-snippets" }

	-- LSP
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }
  use { "neovim/nvim-lspconfig" }

	-- Telescope
	use { "nvim-telescope/telescope.nvim" }

	-- Treesitter
	use { "nvim-treesitter/nvim-treesitter" }

	-- Git
  use { "lewis6991/gitsigns.nvim" }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
