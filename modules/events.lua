local json = require('json')
local fs = require('fs')

local cfg = require('../config')
local prefix = cfg.prefix

-- TODO: Create better module management
local modules = {
    commands = require('./command').events 
}

local events = {}

function events.ready(client)
    client:setGame {
        type = 3, 
        name = prefix..'help'
    }
end

function events.messageCreate(_, ...)
    modules.commands.create(...)
    -- ...
end


function events.messageDelete(_, ...)
    modules.commands.delete(...)
    -- ...
end

return events
