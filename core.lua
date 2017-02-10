package.path = package.path .. ";" .. getMudletHomeDir() .. "/scripts/Aliases/?.lua"
package.path = package.path .. ";" .. getMudletHomeDir() .. "/scripts/Handlers/?.lua"
package.path = package.path .. ";" .. getMudletHomeDir() .. "/scripts/Scripts/?.lua"
package.path = package.path .. ";" .. getMudletHomeDir() .. "/scripts/Timers/?.lua"
package.path = package.path .. ";" .. getMudletHomeDir() .. "/scripts/Triggers/?.lua"

dba = require("dba")
require("_Handlers")

Aliases = require("_Aliases")
Triggers = require("_Triggers")
require("UI")

Triggers.load()
UI.load()
