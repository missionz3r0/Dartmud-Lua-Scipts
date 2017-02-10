package.path = package.path .. ";" .. getMudletHomeDir() .. "/scripts/Aliases/?.lua"
package.path = package.path .. ";" .. getMudletHomeDir() .. "/scripts/Handlers/?.lua"
package.path = package.path .. ";" .. getMudletHomeDir() .. "/scripts/Scripts/?.lua"
package.path = package.path .. ";" .. getMudletHomeDir() .. "/scripts/Timers/?.lua"
package.path = package.path .. ";" .. getMudletHomeDir() .. "/scripts/Triggers/?.lua"


Aliases = require("_Aliases")
require("dba")
require("_Handlers")
Timers = require("_Timers")
Triggers = require("_Triggers")
UI = require("UI")

Aliases.load()
Timers.load()
Triggers.load()

UI.load()
