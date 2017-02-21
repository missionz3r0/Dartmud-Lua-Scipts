local _Core = {}
local directory = getMudletHomeDir().."\\scripts\\"
local modules = {}
local sourceName = "core"

dba = dofile(directory.."Scripts\\dba.lua")
_Handlers = dofile(directory.."\\Handlers\\_Handlers.lua")


local function load()
  modules.aliases = dofile(directory.."Aliases\\_Aliases.lua")
  modules.scripts = dofile(directory.."Scripts\\_Scripts.lua")
  modules.timers = dofile(directory.."Timers\\_Timers.lua")
  modules.triggers = dofile(directory.."Triggers\\_Triggers.lua")

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

Handlers.addLoadListener(sourceName,load)
Handlers.addUnloadListener(sourceName,unload)
Handlers.addReloadListener(sourceName,reload)

raiseEvent("LoadEvent")

_Core = {
  load = load
  ,unload = unload
  ,reload = reload
}

return _Core
