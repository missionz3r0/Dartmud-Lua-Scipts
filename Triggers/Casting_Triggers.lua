local Casting = {}

local triggers = {}

local function load(args)
  local tempTriggers = {}

  tempTriggers.finishPracticing =
    tempRegexTrigger("^(?:> )?You are (?:\\w+) the (?:\\w+)?\\.  You are a ([\\s\\S]+)\\."
                     ,[[
                        arguments = {}
                        Events.raiseEvent("finishPracticingEvent", arguments)
                        Events.raiseEvent("unblockEvent", {})
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

Casting = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Casting
