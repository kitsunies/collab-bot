local names = {
	'Gay',
	'Simp',
	'Noob'
}

return {
    run = function(arg, msg)
       	local name = arg and arg:gsub('^.', string.upper) or names[math.random(#names)] 
       	msg:reply {
       		embed = {
       			title = name,
       			description = msg.author.name..' is '..math.random(1, 100)..'% '..name
       		}
       	}
    end, 
    description = 'Get your % of anything', 
    group = 'fun',
    aliases = {}
}
