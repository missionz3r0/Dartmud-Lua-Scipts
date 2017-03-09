local Loader_Aliases = {}
local aliases = {}

local function load()
  local tempAliases = {}

  tempAliases.load = tempAlias('^\\/load',
                                  [[
                                    local arguments = {}
                                    Events.raiseEvent('loadEvent', arguments)
                                  ]])

  tempAliases.unload = tempAlias('^\\/unload',
                                  [[
                                    local arguments = {}
                                    Events.raiseEvent('unloadEvent', arguments)
                                  ]])

  tempAliases.reload = tempAlias('^\\/reload',
                                  [[
                                    local arguments = {}
                                    Events.raiseEvent('reloadEvent', arguments)
                                  ]])
  aliases = tempAliases
end

local function unload()
  for i,v in pairs(aliases) do
    killAlias(v)
  end
end

local function reload()
  unload()
  load()
end

Loader_Aliases =
{
  load = load
  ,unload = unload
  ,reload = reload
}

return Loader_Aliases
