local Loader_Aliases = {}
local aliases = {}

local function load()
  local tempAliases = {}

  tempAliases.load = tempAlias('^\\/load',
                                  [[
                                    raiseEvent('loadEvent')
                                  ]])

  tempAliases.unload = tempAlias('^\\/unload',
                                  [[
                                    raiseEvent('unloadEvent')
                                  ]])

  tempAliases.reload = tempAlias('^\\/reload',
                                  [[
                                    raiseEvent('reloadEvent')
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
