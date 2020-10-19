return {
    run = function(arg, msg)
       	msg:reply{
            embed = {
                title = 'Nice cock bro',
                description = msg.author.name..'\'s pp:\n8'..string.rep('=', math.random(3, 16))..'D'
            }
        }
    end, 
    description = 'Get the size of your pp', 
    aliases = {'penis', 'ppsize'}
}
