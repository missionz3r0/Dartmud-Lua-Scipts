local AntiSpam_Aliases = {}

local aliases = {}

local function setup(args)
  tempAliases = {}

  tempAliases.AntiSpamOn =
    tempAlias("\/[Aa][Nn][Tt][Ii][Ss][Pp][Aa][Mm] [Oo][Nn]"
              ,[[
                local arguments = {}

                Events.raiseEvent("antiSpamOnEvent", arguments)
              ]])

  tempAliases.AntiSpamOff =
    tempAlias("\/[Aa][Nn][Tt][Ii][Ss][Pp][Aa][Mm] [Oo][Ff][Ff]"
              ,[[
                local arguments = {}

                Events.raiseEvent("antiSpamOffEvent", arguments)
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

AntiSpam_Aliases =
{
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return AntiSpam_Aliases
