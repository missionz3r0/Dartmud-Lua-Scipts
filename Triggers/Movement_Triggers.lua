--Movement
--This is another one where I don't really think there is a need to have
--specific movement events.

--Don't have them all yet.
local Movement = {}

local triggers = {}

local function setup(args)
  local tempTriggers = {}

    tempTriggers.MovementTravelForever =
      tempRegexTrigger("^(?:> )?(?:Movement: )?(You can travel forever\\.)"
                       ,[[
                          local movement = matches[2]
                          arguments = {movement = movement}

                          Events.raiseEvent("movementEvent", arguments)
                        ]])

    tempTriggers.MovementHyperBypass =
      tempRegexTrigger("^(?:> )?(?:Movement: )?(Who needs a hyperspacial bypass\\?)"
                       ,[[
                          local movement = matches[2]
                          arguments = {movement = movement}

                          Events.raiseEvent("movementEvent", arguments)
                        ]])

    tempTriggers.MovementTeleport =
      tempRegexTrigger("^(?:> )?(?:Movement: )?(Who needs a teleport spell\\?)"
                       ,[[
                          local movement = matches[2]
                          arguments = {movement = movement}

                          Events.raiseEvent("movementEvent", arguments)
                        ]])

    tempTriggers.MovementHorse =
      tempRegexTrigger("^(?:> )?(?:Movement: )?(Who needs a horse\\?)"
                       ,[[
                          local movement = matches[2]
                          arguments = {movement = movement}

                          Events.raiseEvent("movementEvent", arguments)
                        ]])

    tempTriggers.MovementAwhile =
      tempRegexTrigger("^(?:> )?(?:Movement: )?(You can travel a while longer\\.)"
                       ,[[
                          local movement = matches[2]
                          arguments = {movement = movement}

                          Events.raiseEvent("movementEvent", arguments)
                        ]])

    tempTriggers.StepSpring =
      tempRegexTrigger("^(?:> )?(?:Movement: )?(You have spring in your step\\.)"
                       ,[[
                          local movement = matches[2]
                          arguments = {movement = movement}

                          Events.raiseEvent("movementEvent", arguments)
                        ]])
                        
    tempTriggers.MovementNotToMuch =
      tempRegexTrigger("^(?:> )?(?:Movement: )?(Not too much spring in your step\\.)"
                       ,[[
                          local movement = matches[2]
                          arguments = {movement = movement}

                          Events.raiseEvent("movementEvent", arguments)
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

Movement = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Movement
