local cfg = require('../../config')

return {
    run = function(arg, msg)
        if cfg.owners[msg.author.id] then
            msg:addReaction('✅')
            msg.client:stop()
        else
            msg:addReaction('❌')
        end
    end,
    description = "End's the bot's client",
    aliases = {'close'}
}
