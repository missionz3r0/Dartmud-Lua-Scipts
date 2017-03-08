local _Scripts = {}

local modules = {}

local function load(directory)
  local directory = directory.."/Scripts/"

  modules.casting = dofile(directory.."Casting.lua")
  modules.channelling = dofile(directory.."Channelling.lua")
  modules.inscribing = dofile(directory.."Inscribing.lua")
  modules.skills = dofile(directory.."Skills.lua")
  modules.status = dofile(directory.."Status.lua")
  modules.ui = dofile(directory.."UI.lua")

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
  unload()
end

_Scripts = {
  load = load
  ,unload = unload
  ,reload = reload
}

return _Scripts
