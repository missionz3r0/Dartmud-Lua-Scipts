package.path = package.path .. ";" .. getMudletHomeDir() .. "/scripts/Triggers/?.lua"
package.path = package.path .. ";" .. getMudletHomeDir() .. "/scripts/Scripts/?.lua"
package.path = package.path .. ";" .. getMudletHomeDir() .. "/scripts/Scripts/Handlers/?.lua"

dba = require("dba")
Triggers = require("_Triggers")
require("_Handlers")
require("UI")

Triggers.load()
UI.load()
