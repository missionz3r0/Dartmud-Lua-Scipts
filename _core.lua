local _Core = {}
local packageName = "dartmudlet"
local directory = getMudletHomeDir().."/"..packageName.."/"
local modules = {}
local sourceName = "core"

local function setup(e, f, g)
  print("Setup!")
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
    if module.setup then
      module.setup({directory=directory})
    end
  end

  isFirstLoad = false

  _Core.load()
end

local function load()
  print("Loading!")
  for i,module in ipairs(modules) do
    if module.load then
      module.load()
    end
  end
end

local function unsetup(e, f, g)
  if(not isFirstLoad) then
    resetProfile()
    args = {}
    args["directory"] = directory

    print("Unsetup!")

    for k,module in pairs(modules) do
      if module.unsetup then
        module.unsetup({directory = directory, isFirstLoad = isFirstLoad})
        module = nil
      end
    end
    modules = {}
  end
end

local function resetup(e, f, g)
  print("resetup!")
  unsetup(e, f, g)
  setup(e, f, g)
end

_Core = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
  ,load = load
}

return _Core
