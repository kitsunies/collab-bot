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

local function getFunction()
   for k in cmds do
        if k == cmd then
            return cmds[k][1]
        end
        for _, v in ipairs(cmds[k].alias) do
            if v == cmd then
                return cmds[v][1]
            end
        end
    end 
end

local function create(msg)
    local cmd, arg, run = msg:match(prefix..'(%S+)%s+(.*)'), 
    local run = getFunction()
    
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
