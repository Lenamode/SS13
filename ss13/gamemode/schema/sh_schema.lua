SCHEMA.name = "Space Station 13"
SCHEMA.author = "Sixx"
SCHEMA.desc = "Sleep, eat, work, repeat."
SCHEMA.uniqueID = "SS13" 

nut.currency.SetUp("credit", "credits")
nut.config.mainColor = Color(255, 137, 0)
nut.util.Include("sv_hooks.lua")
nut.util.Include("sv_schema.lua")
nut.util.Include("sh_config.lua")
nut.util.Include("cl_hooks.lua")

nut.config.menuMusic = "song/space.mp3"