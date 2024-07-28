--[[
  File: plugins.lua
  Description: This file is needed for loading plugin list into lazy.nvim and loading plugins
  Info: Use <zo> and <zc> to open and close foldings
  See: https://github.com/folke/lazy.nvim
]]

require('helpers/globals')

package.path = package.path
	.. ';'
	.. vim.fn.expand('$HOME')
	.. '/.luarocks/share/lua/5.1/?/init.lua'
package.path = package.path
	.. ';'
	.. vim.fn.expand('$HOME')
	.. '/.luarocks/share/lua/5.1/?.lua'

return {
	-- Mason {{{
	{
		'williamboman/mason.nvim',
		build = ':MasonUpdate',
		dependencies = {
			'williamboman/mason-lspconfig.nvim',
			'neovim/nvim-lspconfig',
		},
		config = function()
			require('extensions.mason')
		end,
	},
	-- }}}

	-- Which key {{{
	{
		'folke/which-key.nvim',
		event = 'VeryLazy',
		config = true,
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
	-- }}}

	-- Nvim-Tree {{{
	{
		'nvim-tree/nvim-tree.lua',
		version = '*',
		lazy = false,
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		config = function()
			require('extensions.nvim-tree')
		end,
	},
	-- }}}

	-- Alpha {{{
	{
		'goolord/alpha-nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		config = function()
			require('extensions.alpha')
		end,
	},
	-- }}}

	--- Lua Line {{{
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('extensions.lualine')
		end,
	},
	--- }}}

	-- Telescope {{{
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		lazy = false,
		dependencies = {
			'nvim-lua/plenary.nvim',
			'ahmedkhalf/project.nvim',
		},
		config = function()
			require('extensions.telescope')
		end,
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
	},
	-- }}}

	-- CMP {{{
	{
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		dependencies = {
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-emoji',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			'hrsh7th/cmp-nvim-lua',
			'rafamadriz/friendly-snippets',
		},
		config = function()
			require('extensions.cmp')
		end,
	},
	-- }}}

	-- LSP Kind {{{
	{
		'onsails/lspkind-nvim',
		lazy = true,
		config = function()
			require('extensions.lspkind')
		end,
	},
	-- }}}

	-- Git Signs{{{
	{
		'lewis6991/gitsigns.nvim',
		lazy = false,
		config = function()
			require('extensions.gitsigns')
		end,
	},
	-- }}}

	-- Trouble {{{
	{
		'folke/trouble.nvim',
		dependencies = 'kyazdani42/nvim-web-devicons',
		config = function()
			require('extensions.trouble')
		end,
	},
	-- }}}

	-- Autopairs {{{
	{
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		config = function()
			require('extensions.autopairs')
		end,
	},
	-- }}}

	-- Comment {{{
	{
		'numToStr/Comment.nvim',
		config = function()
			require('extensions.comment')
		end,
	},
	-- }}}

	-- Autosave {{{
	{
		'0x00-ketsu/autosave.nvim',
		event = { 'InsertLeave', 'TextChanged' },
		config = function()
			require('extensions.autosave')
		end,
	},
	-- }}}

	-- Bufferline {{{
	{
		'akinsho/bufferline.nvim',
		version = '*',
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			require('extensions.bufferline')
		end,
	},
	-- }}}

	-- Indent Blankline {{{
	{
		'lukas-reineke/indent-blankline.nvim',
		main = 'ibl',
		config = function()
			require('extensions.blankline')
		end,
	},
	-- }}}

	-- Image {{{
	{
		'vhyrro/luarocks.nvim',
		priority = 1001, -- this plugin needs to run before anything else
		opts = {
			rocks = { 'magick' },
		},
	},
	{
		'3rd/image.nvim',
		dependencies = { 'luarocks.nvim' },
		config = function()
			require('extensions.image')
		end,
	},
	-- }}}

	-- ToggleTerm {{{
	{
		'akinsho/toggleterm.nvim',
		version = '*',
		config = function()
			require('extensions.toggleterm')
		end,
	},
	-- }}}

	-- Wilder {{{
	{
		'gelguy/wilder.nvim',
		config = function()
			require('extensions.wilder')
		end,
	},
	-- }}}

	-- Glow {{{
	{
		'ellisonleao/glow.nvim',
		config = true,
		cmd = 'Glow',
		config = function()
			require('extensions.glow')
		end,
	},
	-- }}}

	-- Discord Presence {{{
	{
	  'IogaMaster/neocord',
	  event = "VeryLazy",
	  config = function()
	  	require('extensions.neocord')
	  end
	},
	-- }}}

	-- Neo Scroll {{{
	{
		'karb94/neoscroll.nvim',
		config = function()
			require('extensions.neoscroll')
		end,
	},
	-- }}}

	-- Persistance {{{
	{
		'folke/persistence.nvim',
		event = 'BufReadPre',
		config = function()
			require('extensions.persistence')
		end,
	},
	-- }}}

	-- Project {{{
	{
		'ahmedkhalf/project.nvim',
		config = function()
			require('extensions.project')
		end,
	},

	-- TreeSitter {{{
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = ':TSUpdate',
		event = { 'BufReadPost', 'BufNewFile' },
		dependencies = {
			'nvim-treesitter/nvim-treesitter-context',
			'HiPhish/rainbow-delimiters.nvim',
		},
		config = function()
			require('extensions.treesitter')
		end,
	},
	-- }}}

	-- Fidget {{{
	{
		'j-hui/fidget.nvim',
		config = function()
			require('extensions.fidget')
		end,
	},
	-- }}}

	-- Scrollbar {{{
	{
		'petertriho/nvim-scrollbar',
		config = function()
			require('extensions.scrollbar')
		end,
	},
	-- }}}

	-- CopilotChat {{{
	{
		'zbirenbaum/copilot.lua',
		cmd = 'Copilot',
		event = 'InsertEnter',
		config = function()
			require('extensions.copilot')
		end,
	},
	{
		'CopilotC-Nvim/CopilotChat.nvim',
		branch = 'canary',
		dependencies = {
			{ 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
			{ 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
		},
		config = function()
			require('extensions.copilot')
		end,
	},
	{
		'zbirenbaum/copilot-cmp',
		config = function()
			require('cmp').setup()
		end,
	},
	{
		'AndreM222/copilot-lualine',
		config = function()
			require('lualine').setup()
		end,
	},
	-- }}}

	-- Theme: Gruvbox {{{
	{
		'ellisonleao/gruvbox.nvim',
		priority = 1000,
		config = function()
			require('extensions.colorscheme.gruvbox')
		end,
	},
	-- }}}
}

-- vim: tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
