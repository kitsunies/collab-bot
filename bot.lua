local discordia = require('discordia')
local client = discordia.Client()

local cfg = require('./config')
local eventHandler = require('./modules/events')

for k, v in pairs(eventHandler) do
    client:on(k, function(...) 
        v(client, ...)
    end)
end

client:run('Bot '..cfg.token)
