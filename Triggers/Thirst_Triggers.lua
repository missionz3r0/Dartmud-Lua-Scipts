--Hunger & Thirst, doesn't raise hunger specific events because
--I can't think of a time when you want a hunger/thirst specific event.
local Thirst = {}

local triggers = {}

local function load()
  local tempTriggers = {}

  tempTriggers.HungerAndThirst=
    tempRegexTrigger("^(?:> )?You are (?:[\s\S]+), and ([\s\S]+)\\."
                     ,[[
                        local thirst = matches[2]
                        raiseEvent("thirstEvent", thirst)
                      ]])


  tempTriggers.NotThirsty =
    tempRegexTrigger("^(?:> )?You are (not thirsty)\\."
                     ,[[
                        local thirst = matches[2]
                        raiseEvent("thirstEvent", thirst)
                      ]])

  tempTriggers.SlightlyThirsty =
    tempRegexTrigger("^(?:> )?You are (slightly thirsty)\\."
                     ,[[
                        local thirst = matches[2]
                        raiseEvent("thirstEvent", thirst)
                      ]])

  tempTriggers.Thirsty =
    tempRegexTrigger("^(?:> )?You are (thirsty)\\."
                     ,[[
                        local thirst = matches[2]
                        raiseEvent("thirstEvent", thirst)
                      ]])

  tempTriggers.Parched =
    tempRegexTrigger("^(?:> )?You are (parched)\\."
                     ,[[
                        local thirst = matches[2]
                        raiseEvent("thirstEvent", thirst)
                      ]])

  tempTriggers.FaintFromThirst =
    tempRegexTrigger("^(?:> )?You are (faint from thirst)\\."
                     ,[[
                        local thirst = matches[2]
                        raiseEvent("thirstEvent", thirst)
                      ]])

  tempTriggers.CompletelyDehydrated =
    tempRegexTrigger("^(?:> )?You are (completely dehydrated)\\."
                     ,[[
                        local thirst = matches[2]
                        raiseEvent("thirstEvent", thirst)
                      ]])

  tempTriggers.DyingOfThirst =
    tempRegexTrigger("^(?:> )?You are (dying of thirst)\\."
                     ,[[
                        local thirst = matches[2]
                        raiseEvent("thirstEvent", thirst)
                      ]])

  triggers = tempTriggers
end

local function unload()
  for i,v in pairs(triggers) do
    killTrigger(v)
  end
  triggers = {}
end

local function reload()
  load()
  reload()
end

Thirst = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Thirst
