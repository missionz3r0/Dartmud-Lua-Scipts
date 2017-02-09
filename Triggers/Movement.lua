--Movement
--This is another one where I don't really think there is a need to have
--specific movement events.

--Don't have them all yet.
local Movement = {}

local triggers = {}

local function load()
  local tempTriggers = {}

    tempTriggers.MovementHyperBypass =
      tempRegexTrigger("^(?:> )?(?:Movement: )?(Who needs a hyperspacial bypass\\?)"
                       ,[[
                          local movement = matches[2]
                          raiseEvent("movementEvent", movement)
                        ]])

    tempTriggers.MovementTeleport =
      tempRegexTrigger("^(?:> )?(?:Movement: )?(Who needs a teleport spell\\?)"
                       ,[[
                          local movement = matches[2]
                          raiseEvent("movementEvent", movement)
                        ]])

    tempTriggers.MovementHorse =
      tempRegexTrigger("^(?:> )?(?:Movement: )?(Who needs a horse\\?)"
                       ,[[
                          local movement = matches[2]
                          raiseEvent("movementEvent", movement)
                        ]])

  triggers = tempTriggers
end

local function unload()
  for i,v in pairs(triggers) do
    killTrigger(v)
  end
end

local function reload()
  load()
  reload()
end

Movement = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Movement
