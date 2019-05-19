Who = {}

local sourceName = "who"

local timers = {}

local function whoItUp(args)
  send("who")

  timers.who = tempTimer(300
                        ,[[
                          local args = {}
                          Events.raiseEvent("whoTimerEvent", args)
                        ]])
end

function whoOff(args)
  Events.removeListener("whoTimerEvent", sourceName)
  cecho("<yellow>Who de-activated\n")
end

function whoOn(args)
  whoItUp(args)
  Events.addListener("whoTimerEvent", sourceName, whoItUp)
  cecho("<yellow>Who activated\n")
end

function setup(args)
  temp_timers = {}

  temp_timers.who = tempTimer(300
                              ,[[
                                local args = {}
                                Events.raiseEvent("whoTimerEvent", args)
                              ]])

  Events.addListener("whoTimerEvent", sourceName, whoItUp)
  Events.addListener("whoOnEvent", sourceName, whoOn)
  Events.addListener("whoOffEvent", sourceName, whoOff)
  timers = temp_timers
end

function unsetup(args)
  Events.removeListener("whoTimerEvent", sourceName)
  Events.removeListener("whoOnEvent", sourceName)
  Events.removeListener("whoOffEvent", sourceName)

  for k,v in pairs(timers) do
    killTimer(v)
  end
end

function resetup(args)
  unsetup(args)
  setup(args)
end

Who =
{
	setup = setup
	,unsetup = unsetup
	,resetup = resetup
}

return Who
