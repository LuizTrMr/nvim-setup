-- Explorer
vim.cmd([[
let g:coc_explorer_global_presets = {
	\   '.vim': {
	\     'root-uri': '~/.vim',
	\   },
	\   'tab': {
	\     'position': 'tab',
	\     'quit-on-open': v:true,
	\   },
	\   'floating': {
	\     'position': 'floating',
	\     'open-action-strategy': 'sourceWindow',
	\   },
	\   'floatingTop': {
	\     'position': 'floating',
	\     'floating-position': 'center-top',
	\     'open-action-strategy': 'sourceWindow',
	\   },
	\   'floatingLeftside': {
	\     'position': 'floating',
	\     'floating-position': 'left-center',
	\     'floating-width': 50,
	\     'open-action-strategy': 'sourceWindow',
	\   },
	\   'floatingRightside': {
	\     'position': 'floating',
	\     'floating-position': 'right-center',
	\     'floating-width': 50,
	\     'open-action-strategy': 'sourceWindow',
	\   },
	\   'simplify': {
	\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
	\   }
	\ }
]])


vim.g.slime_target = 'tmux'
