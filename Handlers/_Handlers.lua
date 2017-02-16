--Because of how anonymous event handlers are made in mudlet, it is difficult
--to load and unload the handlers. So for now they are going to break they
--mold of how I have everything else set up.

Handlers = {}

local modules = {}

modules.age = require("Age_Handlers")
modules.alignment = require("Alignment_Handlers")
modules.aura = require("Aura_Handlers")
modules.casting = require("Casting_Handlers")
modules.channelling = require("Channelling_Handlers")
modules.chat = require("Chat_Handlers")
modules.concentration = require("Concentration_Handlers")
modules.encumberance = require("Encumberance_Handlers")
modules.hunger = require("Hunger_Handlers")
modules.inscribing = require("Inscribing_Handlers")
modules.misc = require("Misc_Handlers")
modules.movement = require("Movement_Handlers")
modules.name = require("Name_Handlers")
modules.race = require("Race_Handlers")
modules.save = require("Save_Handlers")
modules.skill = require("Skill_Handlers")
modules.soulage = require("SoulAge_Handlers")
modules.thirst = require("Thirst_Handlers")
modules.ui = require("UI_Handlers")

local function load()
  --for k,v in pairs(modules) do
  --  v.load()
  --end
end

local function unload()
  --for k,v in pairs(modules) do
  --  v.unload()
  --end
end

local function reload()
  load()
  unload()
end

_Handlers = {
  load = load
  ,unload = unload
  ,reload = reload
}


return _Handlers
