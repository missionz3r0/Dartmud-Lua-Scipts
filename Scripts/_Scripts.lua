local _Scripts = {}

local modules = {}

local function load(args)
  local directory = args["directory"]
  directory = directory.."/Scripts/"

  modules.casting = dofile(directory.."Casting.lua")
  modules.channelling = dofile(directory.."Channelling.lua")
  modules.events = dofile(directory.."events.lua")
  modules.inscribing = dofile(directory.."Inscribing.lua")
  modules.skills = dofile(directory.."Skills.lua")
  modules.status = dofile(directory.."Status.lua")
  modules.ui = dofile(directory.."UI.lua")

  for k,v in pairs(modules) do
    v.load(args)
  end
end

local function unload(args)
  for k,v in pairs(modules) do
    v.unload(args)
    v = nil
  end
end

local function reload(args)
  load(args)
  unload(args)
end

_Scripts = {
  load = load
  ,unload = unload
  ,reload = reload
}

return _Scripts
