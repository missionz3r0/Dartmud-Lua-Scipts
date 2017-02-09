dba = require("dba")

package.path = package.path .. ";" .. getMudletHomeDir() .. "/scripts/Triggers/?.lua"

Triggers = require("_Triggers")
require("Handlers")
require("UI")

Triggers.load()
UI.load()
