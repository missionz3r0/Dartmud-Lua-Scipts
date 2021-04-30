--Hunger & Thirst, doesn't raise hunger specific events because
--I can't think of a time when you want a hunger/thirst specific event.
local Hunger = {}

local triggers = {}

local function setup(args)
  local tempTriggers = {}

  tempTriggers.HungerAndThirst=
    tempRegexTrigger("^(?:> )?You are (not hungry|slightly hungry|hungry|famished|faint from hunger|starving|starving to death), and ([\\s\\S]+)\\."
                     ,[[
                        local hunger = matches[2]
                        arguments = {hunger = hunger}

                        Events.raiseEvent("hungerEvent", arguments)

                        local thirst = matches[3]
                        local arguments = {thirst = thirst}

                        Events.raiseEvent("thirstEvent", arguments)
                      ]])


  tempTriggers.NotHungry =
    tempRegexTrigger("^(?:> )?You are (not hungry)\\."
                     ,[[
                        local hunger = matches[2]
                        arguments = {hunger = hunger}

                        Events.raiseEvent("hungerEvent", arguments)
                      ]])

  tempTriggers.SlightlyHungry =
    tempRegexTrigger("^(?:> )?You are (slightly hungry)\\."
                     ,[[
                        local hunger = matches[2]
                        arguments = {hunger = hunger}

                        Events.raiseEvent("hungerEvent", arguments)
                      ]])

  tempTriggers.Hungry =
    tempRegexTrigger("^(?:> )?You are (hungry)\\."
                     ,[[
                        local hunger = matches[2]
                        arguments = {hunger = hunger}

                        Events.raiseEvent("hungerEvent", arguments)
                      ]])

  tempTriggers.Famished =
    tempRegexTrigger("^(?:> )?You are (famished)\\."
                     ,[[
                        local hunger = matches[2]
                        arguments = {hunger = hunger}

                        Events.raiseEvent("hungerEvent", arguments)
                      ]])

  tempTriggers.FaintFromHunger =
    tempRegexTrigger("^(?:> )?You are (faint from hunger)\\."
                     ,[[
                        local hunger = matches[2]
                        arguments = {hunger = hunger}

                        Events.raiseEvent("hungerEvent", arguments)
                      ]])

  tempTriggers.Starving =
    tempRegexTrigger("^(?:> )?You are (starving)\\."
                     ,[[
                        local hunger = matches[2]
                        arguments = {hunger = hunger}

                        Events.raiseEvent("hungerEvent", arguments)
                      ]])

  tempTriggers.StarvingToDeath =
   tempRegexTrigger("^(?:> )?You are (starving to death)\\."
                    ,[[
                       local hunger = matches[2]
                       arguments = {hunger = hunger}

                       Events.raiseEvent("hungerEvent", arguments)
                     ]])

  triggers = tempTriggers
end

local function unsetup(args)
  for i,v in pairs(triggers) do
    killTrigger(v)
  end
  triggers = {}
end

local function resetup(args)
  unsetup(args)
  setup(args)
end

Hunger = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Hunger
