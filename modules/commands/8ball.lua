local responses = {
    'Yes',
    'No',
    'I don\'t know',
    'Maybe',
    'Ask again later',
    'Definitely',
    'Most Likely',
    'Probably Not',
    'Definitely Not',
    'Unlikely'
}

return {
    run = function(arg, msg)
        if not arg then return msg:reply('You didn\'t ask anything idiot') end
        msg:reply(responses[math.random(#responses)])   
    end, 
    description = 'Ask a yes or no question and get an answer', 
    group = 'fun',
    aliases = {'ask'}
}
