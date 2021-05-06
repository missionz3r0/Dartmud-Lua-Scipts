local Casting = {}

local triggers = {}

local function setup(args)
  local tempTriggers = {}

  tempTriggers.finishPracticing =
    tempRegexTrigger("^(?:> )?You finish practicing\\."
                     ,[[
                        arguments = {}
                        Events.raiseEvent("finishPracticingEvent", arguments)
                        Events.raiseEvent("unblockEvent", {})
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

Casting = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Casting
