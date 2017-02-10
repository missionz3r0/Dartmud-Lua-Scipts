local Race = {}

local triggers = {}

local function load()
  local tempTriggers = {}

  tempTriggers.Race =
    tempRegexTrigger("^(?:> )?You are (?:\\w+) the (\\w+)?\\.  You are a ([\\s\\S]+)\\."
                     ,[[
                        local race = matches[2]
                        raiseEvent("raceEvent", race)
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

Race = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Race
