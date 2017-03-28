local Blocking_Aliases = {}

local aliases = {}

local function setup(args)
  tempAliases = {}

  tempAliases.block =
    tempAlias("\/[Bb][Ll][Oo][Cc][Kk]"
              ,[[
                local arguments = {}

                Events.raiseEvent("blockEvent", arguments)
              ]])

  tempAliases.unblock =
    tempAlias("\/[Uu][Nn][Bb][Ll][Oo][Cc][Kk]"
              ,[[
                local arguments = {}

                Events.raiseEvent("unblockEvent", arguments)
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

Blocking_Aliases =
{
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Blocking_Aliases
