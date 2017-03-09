--Hunger & Thirst don't raise hunger specific events because
--I can't think of a time when you want a hunger/thirst specific event.
local Thirst = {}

local triggers = {}

local function load()
  local tempTriggers = {}

  tempTriggers.HungerAndThirst=
    tempRegexTrigger("^(?:> )?You are (?:[\s\S]+), and ([\s\S]+)\\."
                     ,[[
                        local thirst = matches[2]
                        local arguments = {thirst = thirst}

                        Events.raiseEvent("thirstEvent", arguments)
                      ]])


  tempTriggers.NotThirsty =
    tempRegexTrigger("^(?:> )?You are (not thirsty)\\."
                     ,[[
                        local thirst = matches[2]
                        local arguments = {thirst = thirst}

                        Events.raiseEvent("thirstEvent", arguments)
                      ]])

  tempTriggers.SlightlyThirsty =
    tempRegexTrigger("^(?:> )?You are (slightly thirsty)\\."
                     ,[[
                        local thirst = matches[2]
                        local arguments = {thirst = thirst}

                        Events.raiseEvent("thirstEvent", arguments)
                      ]])

  tempTriggers.Thirsty =
    tempRegexTrigger("^(?:> )?You are (thirsty)\\."
                     ,[[
                        local thirst = matches[2]
                        local arguments = {thirst = thirst}

                        Events.raiseEvent("thirstEvent", arguments)
                      ]])

  tempTriggers.Parched =
    tempRegexTrigger("^(?:> )?You are (parched)\\."
                     ,[[
                        local thirst = matches[2]
                        local arguments = {thirst = thirst}

                        Events.raiseEvent("thirstEvent", arguments)
                      ]])

  tempTriggers.FaintFromThirst =
    tempRegexTrigger("^(?:> )?You are (faint from thirst)\\."
                     ,[[
                        local thirst = matches[2]
                        local arguments = {thirst = thirst}

                        Events.raiseEvent("thirstEvent", arguments)
                      ]])

  tempTriggers.CompletelyDehydrated =
    tempRegexTrigger("^(?:> )?You are (completely dehydrated)\\."
                     ,[[
                        local thirst = matches[2]
                        local arguments = {thirst = thirst}

                        Events.raiseEvent("thirstEvent", arguments)
                      ]])

  tempTriggers.DyingOfThirst =
    tempRegexTrigger("^(?:> )?You are (dying of thirst)\\."
                     ,[[
                        local thirst = matches[2]
                        local arguments = {thirst = thirst}

                        Events.raiseEvent("thirstEvent", arguments)
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
