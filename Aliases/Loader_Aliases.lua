local Loader_Aliases = {}
local aliases = {}

local function load(args)
  local tempAliases = {}

  tempAliases.load = tempAlias('^\\/load',
                                  [[
                                    local directory = getMudletHomeDir().."/dartmudlet/"
                                    local isFirstLoad = false
                                    local arguments = {isFirstLoad = isFirstLoad, directory = directory}
                                    Events.raiseEvent('loadEvent', arguments)
                                  ]])

  tempAliases.unload = tempAlias('^\\/unload',
                                  [[
                                    local directory = getMudletHomeDir().."/dartmudlet/"
                                    local isFirstLoad = false
                                    local arguments = {isFirstLoad = isFirstLoad, directory = directory}
                                    Events.raiseEvent('unloadEvent', arguments)
                                  ]])

  tempAliases.reload = tempAlias('^\\/reload',
                                  [[
                                    local directory = getMudletHomeDir().."/dartmudlet/"
                                    local isFirstLoad = false
                                    local arguments = {isFirstLoad = isFirstLoad, directory = directory}
                                    Events.raiseEvent('reloadEvent', arguments)
                                  ]])
  aliases = tempAliases
end

local function unload(args)
  for i,v in pairs(aliases) do
    killAlias(v)
  end
end

local function reload(args)
  unload(args)
  load(args)
end

Loader_Aliases =
{
  load = load
  ,unload = unload
  ,reload = reload
}

return Loader_Aliases
