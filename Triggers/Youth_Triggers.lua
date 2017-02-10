local Youth = {}

local triggers = {}

local function load()
  local tempTriggers = {}

  tempTriggers.Youthfullness =
    tempRegexTrigger("^(?:> )?You are (?:\\w+) the (?:\\w+)?\\.  You are a ([\\s\\S]+)\\."
                     ,[[
                        local youthfullness = matches[2]
                        raiseEvent("youthfullnessEvent", youthfullness)
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

Youth = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Youth
