local Name = {}

local triggers = {}

local function load()
  local tempTriggers = {}

  tempTriggers.Name =
    tempRegexTrigger("^(?:> )?You are (\\w+) the (?:\\w+)?\\.  You are a (?:[\\s\\S]+)\\."
                     ,[[
                        local name = matches[2]
                        raiseEvent("nameEvent", name)
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

Name = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Name
