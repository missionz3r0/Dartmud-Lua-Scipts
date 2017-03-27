local Casting_Aliases = {}

local aliases = {}

local function load(args)
  tempAliases = {}

  --Practice casting alias
  tempAliases.practiceCast =
    tempAlias("\\/[Cc][Aa][Ss][Tt] ! (\\w+)(?: @ (\\d+))(?: ([\\w,\\s]+))?"
              ,[[
                local spellName = matches[2]
                local power = tonumber(matches[3]) or 100
                local spellArguments = matches[4] or ""
                local arguments = {
                  spellName = spellName
                  ,power = power
                  ,spellArguments = spellArguments
                }

                Events.raiseEvent("practiceCastEvent", arguments)
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

Casting_Aliases =
{
  load = load
  ,unload = unload
  ,reload = reload
}

return Casting_Aliases
