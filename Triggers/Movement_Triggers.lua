--Movement
--This is another one where I don't really think there is a need to have
--specific movement events.

--Don't have them all yet.
local Movement = {}

local triggers = {}

local function load(args)
  local tempTriggers = {}

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

  triggers = tempTriggers
end

local function unload(args)
  for i,v in pairs(triggers) do
    killTrigger(v)
  end
  triggers = {}
end

local function reload(args)
  load(args)
  reload(args)
end

Movement = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Movement
