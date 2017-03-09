local _Aliases = {}

local modules = {}

local function load(args)
  local directory = args["directory"]
  directory = directory.."/Aliases/"

  modules.casting = dofile(directory.."Casting_Aliases.lua")
  modules.channelling = dofile(directory.."Channelling_Aliases.lua")
  modules.inscribing = dofile(directory.."Inscribing_Aliases.lua")
  modules.skill = dofile(directory.."Skill_Aliases.lua")

  for k,v in pairs(modules) do
    v.load(args)
  end
end

local function unload(args)
  for k,v in pairs(modules) do
    v.unload()
    v = nil
  end
end

local function reload(args)
  unload(args)
  load(args)
end

_Aliases = {
  load = load
  ,unload = unload
  ,reload = reload
}

return _Aliases
