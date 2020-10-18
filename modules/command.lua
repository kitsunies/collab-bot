local json = require('json')
local fs = require('fs')

local cfg = json.decode(fs.readFileSync('config.json'))
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

cmds['command'] = {function()
        -- ...
    end, 
    "description", 
    {
        alias = {"cmd", "exec", ...},
        ...
    }
}

--]]

local function getFunction(cmd)
    return cmds[cmd] and cmds[cmd].run or aliases[cmd] and aliases[cmd].run
end

local function create(msg)
    local cmd, arg = msg:match(prefix..'(%S+)%s+(.*)')
    local run = getFunction(cmd)
    
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
