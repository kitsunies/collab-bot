local http = require('coro-http')

return {
    run = function(arg, msg)
        local _, body = http.request('GET', 'https://icanhazdadjoke.com/', {{'Accept','text/plain'}})
        msg:reply(body or 'There was an error with the api')
    end, 
    description = 'Get a hilarious joke from [Dad Joke Api](https://icanhazdadjoke.com/)', 
    group = 'fun',
    aliases = {'joke'}
}
