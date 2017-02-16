local SoulAge = {}

local triggers = {}

local function load()
  local tempTriggers = {}
  tempTriggers.SoulAge =
    tempRegexTrigger("^(?:> )?Your soul's age is: (\\d+) years, (\\d+) months by the Common Reckoning"
                     ,[[
                        local years = matches[2]
                        local months = matches[3]
                        raiseEvent("SoulAgeEvent", years, months)
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

SoulAge = {
  load = load
  ,unload = unload
  ,reload = reload
}

return SoulAge