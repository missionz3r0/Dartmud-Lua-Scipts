package.path = package.path .. ";" .. getMudletHomeDir() .. "/scripts/Aliases/?.lua"
package.path = package.path .. ";" .. getMudletHomeDir() .. "/scripts/Handlers/?.lua"
package.path = package.path .. ";" .. getMudletHomeDir() .. "/scripts/Scripts/?.lua"
package.path = package.path .. ";" .. getMudletHomeDir() .. "/scripts/Timers/?.lua"
package.path = package.path .. ";" .. getMudletHomeDir() .. "/scripts/Triggers/?.lua"


require("dba")
require("_Handlers")

Aliases = require("_Aliases")
Timers = require("_Timers")
Triggers = require("_Triggers")
Status = require("Status")
UI = require("UI")

Aliases.load()
Status.load()
Timers.load()
Triggers.load()
UI.load()
