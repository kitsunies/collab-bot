local discordia = require("discordia")
local client = discordia.Client()

local prefix = "idk "

client:on("messageCreate", function(msg)
    -- Do stuff later 
end)

client:on("ready", function()
  client:setGame{type = 3, name = idk.."help"}
end)

client:run("Bot SECRETSyUFF")
