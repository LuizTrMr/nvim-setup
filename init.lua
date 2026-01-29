require('plugins')
require('mappings')
require('settings')
require('globals')

require('barbar_config')

function _G.reload(name, configs)
	package.loaded[name] = nil
	local new = require(name)
	new.setup(configs)
	return new
end
