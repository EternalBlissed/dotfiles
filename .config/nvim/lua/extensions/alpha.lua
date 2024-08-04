--[[
  File: alpha.lua
  Description: Configuration of alpha.nvim
  See: https://github.com/goolord/alpha-nvim

  BEWARE! THIS CONFIG IS FUCKED
]]

local alpha = require('alpha')

local if_nil = vim.F.if_nil

local num_plugins_loaded =
	#vim.fn.globpath(vim.fn.stdpath('data') .. '/lazy', '*', 0, 1)

local default_header = {
	type = 'text',
	val = {
		[[                                                ]],
		[[                                          _.oo. ]],
		[[                  _.u[[/;:,.         .odMMMMMM' ]],
		[[               .o888UU[[[/;:-.  .o@P^    MMM^   ]],
		[[              oN88888UU[[[/;::-.        dP^     ]],
		[[             dNMMNN888UU[[[/;:--.   .o@P^       ]],
		[[            ,MMMMMMN888UU[[/;::-. o@^           ]],
		[[            NNMMMNN888UU[[[/~.o@P^              ]],
		[[            888888888UU[[[/o@^-..               ]],
		[[           oI8888UU[[[/o@P^:--..                ]],
		[[        .@^  YUU[[[/o@^;::---..                 ]],
		[[      oMP     ^/o@P^;:::---..                   ]],
		[[   .dMMM    .o@^ ^;::---...                     ]],
		[[  dMMMMMMM@^`       `^^^^                       ]],
		[[ YMMMUP^                                        ]],
		[[  ^^                                            ]],
		[[                                                ]],
	},
	opts = {
		hl = 'AlphaHeader',
		position = 'center',
	},
}

local footer = {
	type = 'text',
	val = '',
	opts = {
		position = 'center',
		hl = 'Number',
	},
}

local leader = 'SPC'

local function button(sc, txt, keybind, keybind_opts)
	local sc_ = sc:gsub('%s', ''):gsub(leader, '<leader>')

	local opts = {
		position = 'center',
		shortcut = sc,
		cursor = 3,
		width = 50,
		align_shortcut = 'right',
		hl_shortcut = 'Keyword',
	}
	if keybind then
		keybind_opts =
			if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { 'n', sc_, keybind, keybind_opts }
	end

	local function on_press()
		local key = vim.api.nvim_replace_termcodes(
			keybind or sc_ .. '<Ignore>',
			true,
			false,
			true
		)
		vim.api.nvim_feedkeys(key, 't', false)
	end

	return {
		type = 'button',
		val = txt,
		on_press = on_press,
		opts = opts,
	}
end

local buttons = {
	type = 'group',
	val = {
		button('f', '  Find File', '<cmd>Telescope find_files<CR>'),
		button('n', '  New File', '<cmd>ene!<CR>'),
		button('r', '󰈚  Recent Files', '<cmd>Telescope oldfiles<CR>'),
		button('p', '  Recent Projects', '<cmd>Telescope projects<CR>'),
		button('g', '  Find Text', '<cmd>Telescope live_grep<CR>'),
		button(
			's',
			'  Restore Session',
			"<cmd>lua require('persistence').load()<CR>"
		),
		button('c', '󰢱  Configuration', '<cmd>e ~/.config/nvim/<CR>'),
		button('q', '  Quit Neovim', '<cmd>qa<CR>'),
	},
	opts = {
		spacing = 1,
	},
}

local footer = {
	type = 'text',
	val = {
		'',
		' ' .. num_plugins_loaded .. ' plugins loaded',
	},
	opts = {
		position = 'center',
		hl = 'Number',
	},
}

local section = {
	header = default_header,
	buttons = buttons,
	footer = footer,
}

local config = {
	layout = {
		{ type = 'padding', val = 4 },
		section.header,
		{ type = 'padding', val = 2 },
		section.buttons,
		section.footer,
	},
	opts = {
		margin = 5,
	},
}

alpha.setup(config)

return {
	button = button,
	section = section,
	config = config,
	leader = leader,
	opts = config,
}
