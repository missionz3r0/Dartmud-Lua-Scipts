--Hunger & Thirst, doesn't raise hunger specific events because
--I can't think of a time when you want a hunger/thirst specific event.
local Hunger = {}

local triggers = {}

local function load()
  local tempTriggers = {}

  tempTriggers.HungerAndThirst=
    tempRegexTrigger("^(?:> )?You are ([\s\S]+), and (?:[\s\S]+)\\."
                     ,[[
                        local hunger = matches[2]
                        raiseEvent("hungerEvent", hunger)
                      ]])


  tempTriggers.NotHungry =
    tempRegexTrigger("^(?:> )?You are (not hungry)\\."
                     ,[[
                        local hunger = matches[2]
                        raiseEvent("hungerEvent", hunger)
                      ]])

  tempTriggers.SlightlyHungry =
    tempRegexTrigger("^(?:> )?You are (slightly hungry)\\."
                     ,[[
                        local hunger = matches[2]
                        raiseEvent("hungerEvent", hunger)
                      ]])

  tempTriggers.Hungry =
    tempRegexTrigger("^(?:> )?You are (hungry)\\."
                     ,[[
                        local hunger = matches[2]
                        raiseEvent("hungerEvent", hunger)
                      ]])

  tempTriggers.Famished =
    tempRegexTrigger("^(?:> )?You are (famished)\\."
                     ,[[
                        local hunger = matches[2]
                        raiseEvent("hungerEvent", hunger)
                      ]])

  tempTriggers.FaintFromHunger =
    tempRegexTrigger("^(?:> )?You are (faint from hunger)\\."
                     ,[[
                        local hunger = matches[2]
                        raiseEvent("hungerEvent", hunger)
                      ]])

  tempTriggers.Starving =
    tempRegexTrigger("^(?:> )?You are (starving)\\."
                     ,[[
                        local hunger = matches[2]
                        raiseEvent("hungerEvent", hunger)
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

Hunger = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Hunger
