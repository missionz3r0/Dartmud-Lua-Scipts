local _Triggers = {}

local modules = {}
local directory = getMudletHomeDir().."/scripts/Triggers/"

local function load()
  modules.age = dofile(directory.."Age_Triggers.lua")
  modules.alignment = dofile(directory.."Alignment_Triggers.lua")
  modules.aura = dofile(directory.."Aura_Triggers.lua")
  modules.chat = dofile(directory.."Chat_Triggers.lua")
  modules.concentration = dofile(directory.."Concentration_Triggers.lua")
  modules.encumberance = dofile(directory.."Encumberance_Triggers.lua")
  modules.hunger = dofile(directory.."Hunger_Triggers.lua")
  modules.login = dofile(directory.."Login_Triggers.lua")
  modules.movement = dofile(directory.."Movement_Triggers.lua")
  modules.name = dofile(directory.."Name_Triggers.lua")
  modules.race = dofile(directory.."Race_Triggers.lua")
  modules.skill = dofile(directory.."Skill_Triggers.lua")
  modules.soulage = dofile(directory.."SoulAge_Triggers.lua")
  modules.thirst = dofile(directory.."Thirst_Triggers.lua")
  for k,v in pairs(modules) do
    v.load()
  end
end

local function unload()
  for k,v in pairs(modules) do
    v.unload()
    v = nil
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
