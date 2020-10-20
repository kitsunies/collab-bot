local json = require('json')
local fs = require('fs')

local cfg = require('../config')
local prefix = cfg.prefix

local handler = {
    cmds = {},
    aliases = {},
    names = {},
    events = {}
}

function handler.load()
    for _, v in ipairs(fs.readdirSync('./modules/commands')) do
        local name = v:match('(.*)%.lua$')
        if name then
            local command = require('./commands/' .. name)

	    	handler.names[command.group] = handler.names[command.group] or {}
	    	table.insert(handler.names[command.group], '• '..name..' - '..command.description)

            handler.cmds[name] = command
            
            for _, alias in ipairs(command.aliases) do
                handler.aliases[alias] = setmetatable({}, {__index = command})
            end
        end
    end
end

--[[

cmds['command'] = {
    run = function()
       	-- ...
    end, 
    description = 'description',
    group = '' ,
    aliases = {'exec', 'lua', ...}
}

--]]

local function getFunction(cmd)
    if not cmd then return end
    cmd = string.lower(cmd)
    return handler.cmds[cmd] and handler.cmds[cmd].run or handler.aliases[cmd] and handler.aliases[cmd].run
end

function handler.events.create(msg)
    local cmd, arg = msg.cleanContent:match(prefix..'(%S+)%s*(.*)')
    local run = getFunction(cmd)
	
    if msg.author.bot then return end
    if not msg.guild then return end
    if not run then return end
    if #arg == 0 then arg = nil end
    
    local suc, res = pcall(run, arg, msg)
    
    if suc then
        -- ...
    else
        print(res)
    end
end

function handler.events.delete(msg)
    -- ...
end

return handler
