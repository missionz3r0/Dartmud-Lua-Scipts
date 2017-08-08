local Who_Aliases = {}

local aliases = {}

local function setup(args)
  tempAliases = {}

  tempAliases.whoOn =
    tempAlias("\/[Ww][Hh][Oo] [Oo][Nn]"
              ,[[
                local arguments = {}

                Events.raiseEvent("whoOnEvent", arguments)
              ]])

  tempAliases.whoOff =
    tempAlias("\/[Ww][Hh][Oo] [Oo][Ff][Ff]"
              ,[[
                local arguments = {}

                Events.raiseEvent("whoOffEvent", arguments)
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

Who_Aliases =
{
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Who_Aliases
