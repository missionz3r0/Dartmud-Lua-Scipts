
local Inscribing = {}

local triggers = {}

local function load(args)
  local tempTriggers = {}

  tempTriggers.inscriptionFinish =
    tempRegexTrigger("^(?:> )?As you inscribe the last word, power infuses the scroll!"
                     ,[[
                        local arguments = {}
                        Events.raiseEvent("finishedInscriptionEvent", arguments)
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

Inscribing = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Inscribing
