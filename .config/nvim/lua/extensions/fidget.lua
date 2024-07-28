--[[
  File: fidget.lua
  Description: Configuration of fidget.nvim
  See: https://github.com/j-hui/fidget.nvim
]]

local fidget = require('fidget')

fidget.setup({
	progress = {
		poll_rate = 0.5,
		suppress_on_insert = true,
		ignore_done_already = true,
	},
})
