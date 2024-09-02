require('fine-cmdline').setup({
	cmdline = {
		enable_keymaps = true,
		smart_history = true,
		prompt = ' '
	},
	popup = {
		position = {
			row = '95%',
			col = '80%',
		},
		size = {
			width = '20%',
		},
		border = {
			style = {
				top_left    = "╭", top    = "─",    top_right = "╮",
				left        = "",                      right = "│",
				bottom_left = "╰", bottom = "─", bottom_right = "╯",
			},
		},
		win_options = {
			winhighlight = 'Normal:Normal,FloatBorder:FloatBorder'
		}
	}
})
