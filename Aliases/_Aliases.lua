local _Aliases = {}

local modules = {}

local function load()
  modules.casting = dofile(getMudletHomeDir().."\\aliases\\Casting_Aliases.lua")
  modules.channelling = dofile(getMudletHomeDir().."\\aliases\\Channelling_Aliases.lua")
  modules.inscribing = dofile(getMudletHomeDir().."\\aliases\\Inscribing_Aliases.lua")
  modules.skill = dofile(getMudletHomeDir().."\\aliases\\Skill_Aliases.lua")

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
