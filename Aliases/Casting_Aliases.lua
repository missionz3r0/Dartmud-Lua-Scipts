local Casting_Aliases = {}

local aliases = {}

local function load()
  tempAliases = {}

  --Practice casting alias
  tempAliases.practiceCast =
    tempAlias("\/cast ! (\w+)(?: @ (\d+))(?: ([\w,\s]+))?"
              ,[[
                local spellName = matches[2]
                local power = tonumber(matches[3]) or 100
                local arguments = matches[4] or ""

                raiseEvent("practiceCastEvent", spellName, power, arguments)
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
  load()
end

Casting_Aliases =
{
  load = load
  ,unload = unload
  ,reload = reload
}

return Casting_Aliases
