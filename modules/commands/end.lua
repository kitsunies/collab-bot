local cfg = require('../../config')

local owners = {}
for _, v in pairs(cfg.owners) do
    owners[v] = true
end

return {
    run = function(arg, msg)
        if owners[msg.author.id] then
            msg:addReaction('✅')
            msg.client:stop()
        else
            msg:addReaction('❌')
        end
    end,
    description = "End's the bot's client",
    aliases = {'close'}
}
