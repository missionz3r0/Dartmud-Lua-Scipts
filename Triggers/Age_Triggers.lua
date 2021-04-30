local Youth = {}

local triggers = {}

local function setup(args)
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

Youth = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Youth
