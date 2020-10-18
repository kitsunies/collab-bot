local discordia = require("discordia")
local client = discordia.Client()

local eventHandler = require('./modules/events')

for k, v in pairs(eventHandler) do
    client:on(k, function(...) 
        v(client, ...)
    end)
end

client:run("Bot SECRETSTUFF")
