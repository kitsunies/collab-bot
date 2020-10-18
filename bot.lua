local discordia = require('discordia')
local client = discordia.Client()

local cfg = require('./config')
local commandHandler = require('./modules/command')
local eventHandler = require('./modules/events')

commandHandler.load()

for k, v in pairs(eventHandler) do
    client:on(k, function(...) 
        v(client, ...)
    end)
end

client:run('Bot '..cfg.token)
