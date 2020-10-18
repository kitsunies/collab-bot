local json = require('json')
local fs = require('fs')

local cfg = require('../config')
local prefix = cfg.prefix

local cmds = {}
local aliases = {}

for _, v in ipairs(fs.readdirSync('./modules/commands')) do
    local name = v:match('(.*)%.lua$')
    if name then
        local command = require('./commands/' .. name)
        cmds[name] = command
        for _, alias in ipairs(command.aliases) do
            aliases[alias] = setmetatable({}, {__index = command})
        end
    end
end

--[[

cmds['command'] = {
    run = function()
       	-- ...
    end, 
    description = 'description', 
    aliases = {'exec', 'lua', ...}
}

--]]

local function getFunction(cmd)
    if not cmd then return end
    cmd = string.lower(cmd)
    return cmds[cmd] and cmds[cmd].run or aliases[cmd] and aliases[cmd].run
end

local function create(msg)
    local cmd, arg = msg.cleanContent:match(prefix..'(%S+)%s*(.*)')
    local run = getFunction(cmd)
	
    if msg.author.bot then return end
    if not msg.guild then return end
    if not run then return end
    
    local suc, res = pcall(run, arg, msg)
    
    if suc then
        -- ...
    else
        print(res)
    end
end

local function delete(msg)
    -- ...
end

return {
    create = create,
    delete = delete
}
