local _Triggers = {}

local modules = {}

modules.age = require("Age_Triggers")
modules.alignment = require("Alignment_Triggers")
modules.aura = require("Aura_Triggers")
modules.chat = require("Chat_Triggers")
modules.concentration = require("Concentration_Triggers")
modules.encumberance = require("Encumberance_Triggers")
modules.hunger = require("Hunger_Triggers")
modules.movement = require("Movement_Triggers")
modules.name = require("Name_Triggers")
modules.race = require("Race_Triggers")
modules.skill = require("Skill_Triggers")
modules.soulage = require("SoulAge_Triggers")
modules.thirst = require("Thirst_Triggers")

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
