-- Demonstration Command

return {
	run = function(arg, msg)
		msg:reply('Pong!')
	end,
	description = 'Ping Pong',
	group = 'utility',
	aliases = {'pong'}
}
