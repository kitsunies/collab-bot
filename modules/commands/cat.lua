local http = require('coro-http')
local json = require('json')

return {
    run = function()
    	local _, body = http.request('GET', 'https://api.thecatapi.com/v1/images/search')
    	local data = assert(json.decode(body), 'Bad JSON')

    	msg:reply {
    		embed = {
    			title = 'Cute Cat(s)',
    			image = {
    				url = data[1].url
    			}
    		}
    	}
    end, 
    description = 'Gets pictures of cats from [The Cat Api](https://thecatapi.com)', 
    aliases = {}
}
