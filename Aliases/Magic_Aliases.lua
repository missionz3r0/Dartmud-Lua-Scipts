local Magic = {}

local aliases = {}

local function load()
  tempAliases = {}

  --Practice casting alias
  tempAliases.practiceCast =
    tempAlias("\/cast ! (\w+)(?: @ (\d+))(?: ([\w,\s]+))?"
              ,[[
                local spell = matches[2]
                local power = tonumber(matches[3])
                local arguments = matches[4] or ""

                raiseEvent("practiceCastEvent", spell, power, arguments)
              ]])

  --Channelling alias
  tempAliases.channelling =
    tempAlias("\/channel (\w+)(?: (\w+))?"
              ,[[
                local power = tonumber(matches[2])
                local target = matches[3]

                raiseEvent("channellingEvent", power, target)
              ]])

  --Practice writing alias
tempAliases.practiceInsribing =
  tempAlias("\/inscribe ! (\w+)(?: @ (\d+))?"
            ,[[
              local spell = matches[2]
              local power = tonumber(matches[3]) or 100

              raiseEvent("practiceInscribingEvent", spell, power)
            ]])

  --Repeat casting alias
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

Cast =
{
  load = load
  ,unload = unload
  ,reload = reload
}

return Magic