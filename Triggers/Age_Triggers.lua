local Youth = {}

local triggers = {}

local function load(args)
  local tempTriggers = {}

  tempTriggers.Youthfullness =
    tempRegexTrigger("^(?:> )?You are (?:\\w+) the (?:\\w+)?\\.  You are a ([\\s\\S]+)\\."
                     ,[[
                        local age =  matches[2]
                        local arguments = { age = age }
                        Events.raiseEvent("ageEvent", arguments)
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

Youth = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Youth
