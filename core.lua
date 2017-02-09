dba = require("dba")

package.path = package.path .. ";" .. getMudletHomeDir() .. "/scripts/Triggers/?.lua"

require("_Triggers")
require("Handlers")
require("Skill")
require("UI")

Status.load()
UI.load()
