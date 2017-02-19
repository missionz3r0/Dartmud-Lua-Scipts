dba = require("dba")
require("_Handlers")

Aliases = dofile(getMudletHomeDir().."\\scripts\\_Aliases.lua")
Scripts = dofile(getMudletHomeDir().."\\scripts\\_Scripts.lua")
Timers = dofile(getMudletHomeDir().."\\scripts\\_Timers.lua")
Triggers = dofile(getMudletHomeDir().."\\scripts\\_Triggers.lua")

Aliases.load()
Scripts.load()
Timers.load()
Triggers.load()
