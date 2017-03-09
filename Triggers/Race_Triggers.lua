local Race = {}

local triggers = {}

local function load(args)
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

Race = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Race
