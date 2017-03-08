--Because of how anonymous event handlers are made in mudlet, it is difficult
--to load and unload the handlers. So for now they are going to break they
--mold of how I have everything else set up.
local _Handlers = {}
local packageName = "dartmudlet"
local directory = getMudletHomeDir().."/"..packageName.."/Handlers/"
Handlers = {}

local modules = {}

modules.age = dofile(directory.."Age_Handlers.lua")
modules.alignment = dofile(directory.."Alignment_Handlers.lua")
modules.aura = dofile(directory.."Aura_Handlers.lua")
modules.casting = dofile(directory.."Casting_Handlers.lua")
modules.channelling = dofile(directory.."Channelling_Handlers.lua")
modules.chat = dofile(directory.."Chat_Handlers.lua")
modules.concentration = dofile(directory.."Concentration_Handlers.lua")
modules.encumberance = dofile(directory.."Encumberance_Handlers.lua")
modules.hunger = dofile(directory.."Hunger_Handlers.lua")
modules.inscribing = dofile(directory.."Inscribing_Handlers.lua")
modules.loader = dofile(directory.."Loader_Handlers.lua")
modules.login = dofile(directory.."Login_Handlers.lua")
modules.misc = dofile(directory.."Misc_Handlers.lua")
modules.movement = dofile(directory.."Movement_Handlers.lua")
modules.name = dofile(directory.."Name_Handlers.lua")
modules.race = dofile(directory.."Race_Handlers.lua")
modules.save = dofile(directory.."Save_Handlers.lua")
modules.skill = dofile(directory.."Skill_Handlers.lua")
modules.soulage = dofile(directory.."SoulAge_Handlers.lua")
modules.thirst = dofile(directory.."Thirst_Handlers.lua")
modules.ui = dofile(directory.."UI_Handlers.lua")

local function load(directory)
  local directory = directory.."/Handlers/"
  for k,v in pairs(modules) do
  end
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
