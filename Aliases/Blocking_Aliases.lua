local Blocking_Aliases = {}

local aliases = {}

local function load(args)
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

local function unload(args)
  for i,v in pairs(aliases) do
    killAlias(v)
  end
end

local function reload(args)
  unload(args)
  load(args)
end

Blocking_Aliases =
{
  load = load
  ,unload = unload
  ,reload = reload
}

return Blocking_Aliases
