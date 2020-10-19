local commandHandler = require('../command')

--! Me when canada improve noob code

return {
    run = function(_, msg)
        msg:reply {
            embed = {
                title = 'Commands',
                description = table.concat(commandHandler.names, '\n')
            }
        }
    end,
    description = 'Returns a list of the commands.',
    aliases = {'cmds'}
}
