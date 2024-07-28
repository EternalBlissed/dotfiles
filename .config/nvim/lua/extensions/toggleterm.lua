--[[
  File: toggleterm.lua
  Description: ToggleTerm plugin configuration
  See: https://github.com/akinsho/toggleterm.nvim
]]
local toggleterm = require('toggleterm')
toggleterm.setup({
	autochdir = true,
	open_mapping = [[<c-t>]],
})
