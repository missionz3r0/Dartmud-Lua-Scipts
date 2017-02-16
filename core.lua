package.path = package.path .. ";" .. getMudletHomeDir() .. "/scripts/Aliases/?.lua"
package.path = package.path .. ";" .. getMudletHomeDir() .. "/scripts/Handlers/?.lua"
package.path = package.path .. ";" .. getMudletHomeDir() .. "/scripts/Scripts/?.lua"
package.path = package.path .. ";" .. getMudletHomeDir() .. "/scripts/Timers/?.lua"
package.path = package.path .. ";" .. getMudletHomeDir() .. "/scripts/Triggers/?.lua"


require("dba")
require("_Handlers")

Aliases = require("_Aliases")
Scripts = require("_Scripts")
Timers = require("_Timers")
Triggers = require("_Triggers")

Aliases.load()
Scripts.load()
Timers.load()
Triggers.load()
