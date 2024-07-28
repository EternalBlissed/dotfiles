--[[
  File: project.lua
  Description: Configuration of nvim-tree.lua
  See: https://github.com/ahmedkhalf/project.nvim
]]
local project_nvim = require('project_nvim')
project_nvim.setup()
require('telescope').load_extension('projects')
