local api = vim.api
local buf, win

local function center(str)
	local width = api.nvim_win_get_width(0)
	local shift = math.floor(width / 2) - math.floor(string.len(str) / 2 )
	return string.rep(' ', shift) .. str
end

local function open_window()
	buf = api.nvim_create_buf(false, true)

	api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

	-- Get dimensions
	local width = api.nvim_get_option('columns')
	local height = api.nvim_get_option('lines')

	local win_width = math.ceil(width * 0.8)
	local win_height = math.ceil(height * 0.8 - 4)
	
	local col = math.ceil((width - win_width) / 2)
	local row = math.ceil((height - win_height) / 2 - 1)

	local opts = {
		style = 'minimal',
		relative = 'editor',
		width = win_width,
		height = win_height,
		col = col,
		row = row,
	}

	win = api.nvim_open_win(buf, true, opts)

	api.nvim_buf_set_lines(buf, 0, -1, false, {center('Tetris')})
	api.nvim_buf_add_highlight(buf, -1, 'TetrisHeader', 0, 0, -1)
end

local function update_view()
	api.nvim_buf_set_option(buf, 'modifiable', true)

	api.nvim_buf_set_option(buf, 'modifiable', false)
end

local function tetris()
	open_window()
	update_view()
end

return {
	tetris = tetris
}
