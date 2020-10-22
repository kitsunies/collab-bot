local charMap = {
    A = '𝑨',
    B = '𝑩',
    C = '𝑪',
    D = '𝑫',
    E = '𝑬',
    F = '𝑭',
    G = '𝑮',
    H = '𝑯',
    I = '𝑰',
    J = '𝑱', 
    K = '𝑲',
    L = '𝑳',
    M = '𝑴',
    N = '𝑵',
    O = '𝑶',
    P = '𝑷',
    Q = '𝑸',
    R = '𝑹',
    S = '𝑺',
    T = '𝑻',
    U = '𝑼',
    V = '𝑽',
    W = '𝑾',
    X = '𝑿',
    Y = '𝒀',
    Z = '𝒁'
}

local function gen(str)
    return ('**『 '..str:upper()..' 』**'):gsub(".", charMap)
end

return {
    run = function(arg, msg)
        if not arg then return msg:reply('Theres nothing to stand') end
        msg:reply(gen(arg))
    end,
    description = "Generates text surround by blocks.",
    group = 'text',
    aliases = {}
}
