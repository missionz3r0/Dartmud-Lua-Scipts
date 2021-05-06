
local Inscribing = {}

local triggers = {}

local function setup(args)
  local tempTriggers = {}

  tempTriggers.inscriptionFinish =
    tempRegexTrigger("^(?:> )?As you inscribe the last word, power infuses the scroll!"
                     ,[[
                        local arguments = {}
                        Events.raiseEvent("finishedInscriptionEvent", arguments)
                        Events.raiseEvent("unblockEvent", arguments)
                      ]])

  tempTriggers.invocationFinish =
    tempRegexTrigger("^(?:> )?As you finish reading, the last words disappear\\."
                     ,[[
                        local arguments = {}
                        Events.raiseEvent("finishedInvokingEvent", arguments)
                        Events.raiseEvent("unblockEvent", arguments)
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

Inscribing = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Inscribing
