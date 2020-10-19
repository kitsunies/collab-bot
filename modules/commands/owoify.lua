local vowels  = {'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'}
local smileys = {';;w;;', '^w^', '>w<', 'UwU', '(・`ω´・)', '(´・ω・`)'}

--! From https://github.com/kitsunies/OwOify.lua (not a plug I swear)

local function owoify(text)
    assert(type(text) == 'string', "oopsie whoopsie you made a fucky wucky, you didn't pass a stwing >w<")
    text = text:lower():gsub(".", {
        ["l"]  = 'w', ["r"] = 'w', ["?"] = '? owo',
        ["!"]  = '! ' .. smileys[math.random(#smileys)],
        ["%."] = '. ' .. smileys[math.random(#smileys)]
    })
    for i, v in ipairs(vowels) do
        text = text:gsub(('.%s'):format(v), {
            ["n"..v] = 'ny' .. v,
            ["N"..v] = 'N' .. v == v:upper() and 'Y' or 'y' .. v
        })
    end
    return text
end

return {
    run = function(arg, msg)
        if not arg then return msg:reply('There is nothing to OwOify idiot') end
       	msg:reply {
            embed = {
                title = 'OwOification Success!~',
                description = owoify(arg)
            }
        }
    end, 
    description = 'Converts text to OwOspeak', 
    aliases = {'owo', 'uwuify', 'uwu'}
}
