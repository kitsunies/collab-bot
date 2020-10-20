local commandHandler = require('../command')
local helpEmbed = {title = 'Commands', fields = {}}

return {
    run = function(_, msg)
        if not helpEmbed.fields[1] then
            for group, cmds in pairs(commandHandler.names) do
                group = group:gsub('^.', string.upper)
                table.insert(helpEmbed.fields, {name = group, value = table.concat(cmds, '\n')})
            end
        end
        msg:reply{embed = helpEmbed}
    end,
    description = 'Returns a list of the commands.',
    group = 'utility',
    aliases = {'cmds'}
}
