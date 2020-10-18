local events = {}

function events.ready(client)
    client:setGame {
        type = 3, 
        name = idk.."help"
    }
end

function events.messageCreate(client, msg)
    -- ...
end


function events.messageDelete(client, msg)
    -- ...
end

return events
