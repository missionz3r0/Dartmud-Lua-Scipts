local Inscribing_Aliases = {}

local aliases = {}

local function load()
  tempAliases = {}

  --Practice writing alias
tempAliases.practiceInscribing =
  tempAlias("\/inscribe ! (\w+)(?: @ (\d+))?"
            ,[[
              local spell = matches[2]
              local power = tonumber(matches[3]) or 100

              raiseEvent("practiceInscribingEvent", spell, power)
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
  reload()
end

Inscribing_Aliases =
{
  load = load
  ,unload = unload
  ,reload = reload
}

return Inscribing_Aliases
