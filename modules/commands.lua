local json = require('json')
local fs = require('fs')

local cfg = json.decode(fs.readFileSync('config.json'))
local prefix = cfg.prefix

local cmds = {}

for k, v in pairs(fs.scandirSync('./commands')) do
    local name = k:match('(.*)%.lua')
    if v == 'file' and name then
        cmds[k] = require('./commands/' .. name)
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

local function create(msg)
    local cmd, arg = msg:match(prefix..'(%S+)%s+(.*)')
    if not cmds[cmd] then return end
    
    local suc, res = pcall(cmds[cmd][1], arg, msg)
    
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
