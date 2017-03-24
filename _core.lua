local _Core = {}
local packageName = "dartmudlet"
local directory = getMudletHomeDir().."/"..packageName.."/"
local modules = {}
local sourceName = "core"

--These are the only system events we use. And since we can't un-make
--an anonymousEventHandler. We place it here so it's no remade on a reload.
registerAnonymousEventHandler("sysWindowResizeEvent", "Events.raiseEvent")
registerAnonymousEventHandler("sysDownloadError", "Events.raiseEvent")

local function load(args)
  print("Loading in!")
  local directory = args["directory"]
  local isFirstLoad = args["isFirstLoad"]

  dba = dofile(directory.."Scripts/dba.lua")

  modules.aliases  = dofile(directory.."Aliases/_Aliases.lua")
  modules.scripts  = dofile(directory.."Scripts/_Scripts.lua")
  modules.timers   = dofile(directory.."Timers/_timers.lua")
  modules.triggers = dofile(directory.."Triggers/_Triggers.lua")


  for k,v in pairs(modules) do
    v.load(args)
  end

  Events.addListener("loadEvent",sourceName,load)
  Events.addListener("unloadEvent", sourceName,unload)
  Events.addListener("reloadEvent", sourceName,reload)
end

local function unload(args)
  print("Unloading!")
  Events.removeListener("loadEvent",sourceName)
  Events.removeListener("unloadEvent", sourceName)
  Events.removeListener("reloadEvent", sourceName)

  for k,v in pairs(modules) do
    v.unload(args)
    v = nil
  end
end

local function reload(args)
  unload(args)
  load(args)
end

_Core = {
  load = load
  ,unload = unload
  ,reload = reload
}

return _Core
