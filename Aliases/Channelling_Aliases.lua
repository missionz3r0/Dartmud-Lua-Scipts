local Channelling_Aliases = {}

local aliases = {}

local function load()
  tempAliases = {}

  --Channelling alias
  tempAliases.channelling =
    tempAlias("\/channel (\w+)(?: (\w+))?"
              ,[[
                local power = tonumber(matches[2])
                local target = matches[3]

                raiseEvent("channellingEvent", power, target)
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
  reload()
end

Channelling_Aliases =
{
  load = load
  ,unload = unload
  ,reload = reload
}

return Channelling_Aliases
