local _Core = {}
local packageName = "dartmudlet"
local directory = getMudletHomeDir().."/"..packageName.."/"
local modules = {}
local sourceName = "core"
local isFirstLoad = true

local function load(e, f, g)
  print("Loading!")
  modules = {}
  args = {}

  local aliases_directory = directory.."Aliases/"
  for file in lfs.dir(aliases_directory) do
    if lfs.attributes(aliases_directory..file,"mode") == "file" then
      table.insert(modules, dofile(aliases_directory..file))
    end
  end

  local scripts_directory = directory.."Scripts/"
  for file in lfs.dir(scripts_directory) do
    if lfs.attributes(scripts_directory..file,"mode") == "file" then
      table.insert(modules, dofile(scripts_directory..file))
    end
  end

  local timers_directory = directory.."Timers/"
  for file in lfs.dir(timers_directory) do
    if lfs.attributes(timers_directory..file,"mode") == "file" then
      table.insert(modules, dofile(timers_directory..file))
    end
  end

  local triggers_directory = directory.."Triggers/"
  for file in lfs.dir(triggers_directory) do
    if lfs.attributes(triggers_directory..file,"mode") == "file" then
      table.insert(modules, dofile(triggers_directory..file))
    end
  end

  for i,module in ipairs(modules) do
    if module.load then
      module.load({directory = directory, isFirstLoad = isFirstLoad})
    end
  end

  isFirstLoad = false
end

local function unload(e, f, g)
  if(not isFirstLoad) then
    resetProfile()
    args = {}
    args["directory"] = directory
    args["isFirstLoad"] = isFirstLoad

    print("Unloading!")
    Events.removeListener("loadEvent",sourceName)
    Events.removeListener("unloadEvent", sourceName)
    Events.removeListener("reloadEvent", sourceName)

    for k,module in pairs(modules) do
      if module.unload then
        module.unload({directory = directory, isFirstLoad = isFirstLoad})
        module = nil
      end
    end
    modules = {}
  end
end

local function reload(e, f, g)
  print("Reload!")
  unload(e, f, g)
  load(e, f, g)
end

_Core = {
  load = load
  ,unload = unload
  ,reload = reload
}

return _Core
