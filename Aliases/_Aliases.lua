local _Aliases = {}

local modules = {}
local directory = getMudletHomeDir().."\\scripts\\Aliases\\"

local function load()
  modules.casting = dofile(directory.."Casting_Aliases.lua")
  modules.channelling = dofile(directory.."Channelling_Aliases.lua")
  modules.inscribing = dofile(directory.."Inscribing_Aliases.lua")
  modules.skill = dofile(directory.."Skill_Aliases.lua")

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
  unload()
  load()
end

_Aliases = {
  load = load
  ,unload = unload
  ,reload = reload
}

return _Aliases
