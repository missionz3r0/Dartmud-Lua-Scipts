local _Triggers = {}

local modules = {}

modules.age = require("Age")
modules.alignment = require("Alignment")
modules.aura = require("Aura")
modules.concentration = require("Concentration")
modules.encumberance = require("Encumberance")
modules.hunger = require("Hunger")
modules.movement = require("Movement")
modules.name = require("Name")
modules.race = require("Race")
modules.skill = require("Skill")
modules.thirst = require("Thirst")
modules.youth = require("Youth")

local function load()
  for k,v in pairs(modules) do
    v.load()
  end
end

local function unload()
  for k,v in pairs(modules) do
    v.unload()
  end
end

local function reload()
  load()
  reload()
end

_Triggers = {
  load = load
  ,unload = unload
  ,reload = reload
}

return _Triggers
