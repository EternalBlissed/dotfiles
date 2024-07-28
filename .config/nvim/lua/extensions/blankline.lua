--[[
  File: blankline.lua
  Description: Configuration of indent-blankline.nvim
  See: https://github.com/lukas-reineke/indent-blankline.nvim
]]

local ibl = require('ibl')
ibl.setup({
	indent = {
		smart_indent_cap = true,
		char = '|',
	},
	scope = {
		enabled = true,
		char = '|',
	},
})
