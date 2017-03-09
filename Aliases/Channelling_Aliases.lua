local Channelling_Aliases = {}

local aliases = {}

local function load(args)
  tempAliases = {}

  --Channelling alias
  tempAliases.channelling =
    tempAlias("\/channel (\w+)(?: (\w+))?"
              ,[[
                local power = tonumber(matches[2])
                local target = matches[3]
                local arguments = {power = power, target = target}

                Events.raiseEvent("channellingEvent", arguments)
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

Channelling_Aliases =
{
  load = load
  ,unload = unload
  ,reload = reload
}

return Channelling_Aliases
