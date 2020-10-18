-- Demonstration Command

return {function(arg, msg)
        msg:reply 'pong!'
    end, 
    'Demonstration command for "Colab-Bot".', 
    {alias = {"pong"}}
}
