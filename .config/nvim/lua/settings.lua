--[[
  File: settings.lua
  Description: Base settings for neovim
  Info: Use <zo> and <zc> to open and close foldings
]]

require('helpers/globals')

-- Set associating between turned on plugins and filetype
cmd([[filetype plugin on]])

-- Faster completion
opt.updatetime = 100

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Split preferences
opt.splitbelow = true
opt.splitright = true

-- Scrolling
opt.scrolloff = 4

-- Conceal level
opt.conceallevel = 2

-- Indentation
opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2

-- Clipboard
opt.clipboard = 'unnamedplus'

-- Search
opt.ignorecase = true
opt.incsearch = true
opt.smartcase = true
opt.wildmode = 'list:longest'

-- Files
opt.swapfile = false
opt.undofile = true

-- Colors
opt.termguicolors = true -- Assuming you want true color support

-- Default Plugins {{{
local disabled_built_ins = {
	'netrw',
	'netrwPlugin',
	'netrwSettings',
	'netrwFileHandlers',
	'gzip',
	'zip',
	'zipPlugin',
	'tar',
	'tarPlugin',
	'getscript',
	'getscriptPlugin',
	'vimball',
	'vimballPlugin',
	'2html_plugin',
	'logipat',
	'rrhelper',
	'spellfile_plugin',
	'matchit',
}

for _, plugin in pairs(disabled_built_ins) do
	g['loaded_' .. plugin] = 1
end
-- }}}

-- vim: tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=1
