local SoulAge = {}

local triggers = {}

local function load(args)
  local tempTriggers = {}
  tempTriggers.SoulAge =
    tempRegexTrigger("^(?:> )?Your soul's age is: (\\d+) years, (\\d+) months by the Common Reckoning"
                     ,[[
                        local years = matches[2]
                        local months = matches[3]
                        arguments = {years = years, months = months}

                        Events.raiseEvent("SoulAgeEvent", arguments)
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

SoulAge = {
  load = load
  ,unload = unload
  ,reload = reload
}

return SoulAge
