local Announce_Aliases = {}

local aliases = {}

local function load(args)
  tempAliases = {}

  tempAliases.announceOn =
    tempAlias("\/[Aa][Nn][Nn][Oo][Uu][Nn][Cc][Ee] [Oo][Nn]"
              ,[[
                local arguments = {}

                Events.raiseEvent("announceOnEvent", arguments)
              ]])

  tempAliases.announceVerbose =
    tempAlias("\/[Aa][Nn][Nn][Oo][Uu][Nn][Cc][Ee] [Vv][Ee][Rr][Bb][Oo][Ss][Ee]"
              ,[[
                local arguments = {}

                Events.raiseEvent("announceVerboseEvent", arguments)
              ]])

  tempAliases.announceOff =
    tempAlias("\/[Aa][Nn][Nn][Oo][Uu][Nn][Cc][Ee] [Oo][Ff][Ff]"
              ,[[
                local arguments = {}

                Events.raiseEvent("announceOffEvent", arguments)
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

Announce_Aliases =
{
  load = load
  ,unload = unload
  ,reload = reload
}

return Announce_Aliases
