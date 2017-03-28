local Announce_Aliases = {}

local aliases = {}

local function setup(args)
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

local function unsetup(args)
  for i,v in pairs(aliases) do
    killAlias(v)
  end
end

local function resetup(args)
  unsetup(args)
  setup(args)
end

Announce_Aliases =
{
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Announce_Aliases
