local SoulAge = {}

local triggers = {}

local function setup(args)
  local tempTriggers = {}
  tempTriggers.SoulAge =
    tempRegexTrigger("^(?:> )?Your soul's age is: (\\d+) years(?:, (\\d+) months?)? by the Common Reckoning"
                     ,[[
                        local years = matches[2]
                        local months = matches[3]

                        if not months then
                          months = 0
                        end

                        arguments = {years = years, months = months}

                        Events.raiseEvent("SoulAgeEvent", arguments)
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

SoulAge = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return SoulAge
