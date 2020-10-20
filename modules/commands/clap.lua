return {
    run = function(arg, msg)
       	if not arg then return msg:reply('Nothing to clapify') end
        msg:reply(arg:gsub('%S+', function(str) return ' 👏 '..str end))
    end, 
    description = 'Make 👏 text 👏 like 👏 this', 
    group = 'text',
    aliases = {}
}
