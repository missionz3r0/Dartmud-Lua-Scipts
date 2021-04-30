local Race = {}

local triggers = {}

local function setup(args)
  local tempTriggers = {}

  tempTriggers.Race =
    tempRegexTrigger("^(?:> )?You are (?:\\w+) the (\\w+)?\\.  You are a ([\\s\\S]+)\\."
                     ,[[
                        local race = matches[2]
                        arguments = {race = race}

                        Events.raiseEvent("raceEvent", arguments)
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

Race = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Race
