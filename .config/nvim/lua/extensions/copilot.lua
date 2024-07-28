--[[
  File: copilot.lua
  Description: Configuration of copilot.nvim
  See: https://github.com/zbirenbaum/copilot.lua
]]

local CopilotChat = require('CopilotChat')
local copilot = require('copilot')

copilot.setup({
	suggestion = { enabled = false },
	panel = { enabled = false },
})

CopilotChat.setup()
