  
local fs = require('fs')

--! Me when steal section
local cmds = {}

for _, v in ipairs(fs.readdirSync('./modules/commands')) do
    local name = v:match('(.*)%.lua$')
    if name then
        cmds[name] = require('./'..name).description
    end
end

return {
    run = function(_, msg)
        local description = ''
        for k, v in pairs(cmds) do
            description = ('%s**%s**: %s\n'):format(description, k:upper(), v)
        end
        msg:reply {
            embed = {
                description = description
            }
        }
    end,
    description = 'Returns a list of the commands.',
    aliases = {}
}
