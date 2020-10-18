local json = require('json')
local fs = require('fs')

local cfg = json.decode(fs.readFileSync('config.json'))
local prefix = cfg.prefix

-- TODO: Create better module management
local modules = {
    commands = require("./command")   
}

local events = {}

function events.ready(client)
    client:setGame {
        type = 3, 
        name = prefix.."help"
    }
end

function events.messageCreate(client, msg)
    modules.commands.create()
    -- ...
end


function events.messageDelete(client, msg)
    modules.commands.delete()
    -- ...
end

return events
