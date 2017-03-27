local Channelling_Aliases = {}

local aliases = {}

local function load(args)
  tempAliases = {}

  --Channelling alias
  tempAliases.channelling =
    tempAlias("\\/[Cc][Hh][Aa][Nn][Nn][Ee][Ll] (\\d+) (\\w+)"
              ,[[
                local power = tonumber(matches[2])
                local target = string.lower(matches[3])
                local arguments = {power = power, target = target}

                Events.raiseEvent("channellingEvent", arguments)
              ]])

  --Channelling commands
  tempAliases.channellingCommands =
    tempAlias("\\/[Cc][Hh][Aa][Nn][Nn][Ee][Ll](?: ([a-zA-Z]+))?"
              ,[[
                local command = matches[2]
                if command then
                  command = string.lower(command)
                end
                local arguments = {command = command}

                Events.raiseEvent("channellingCommandEvent", arguments)
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
