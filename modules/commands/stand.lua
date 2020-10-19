local fw = "𝑨 𝑩 𝑪 𝑫 𝑬 𝑭 𝑮 𝑯 𝑰 𝑱 𝑲 𝑳 𝑴 𝑵 𝑶 𝑷 𝑸 𝑹 𝑺 𝑻 𝑼 𝑽 𝑾 𝑿 𝒀 𝒁"
local charMap, index = {}, 1
for c in fw:gmatch('(%S)%s+') do
	  charMap[64 + index] = { c:byte(1, 9) }
    index = index + 1
end

local function gen(str)
    return ('**『 '..str:upper()..' 』**'):gsub("%u", function(c) 
        return string.char(unpack(charMap[c:byte()]))
    end)
end

return {
    run = function(arg, msg)
        msg:reply(gen(arg))
    end,
    description = "Generates text surround by blocks.",
    aliases = {}
}
