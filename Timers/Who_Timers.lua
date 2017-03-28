local Who_Timers = {}

local timers = {}
local sourceName = "Who_Timers"

local function whoItUp(args)
  send("who")

  timers.who = tempTimer(300
                        ,[[
                          local args = {}
                          Events.raiseEvent("whoTimerEvent", args)
                        ]])
end

local function setup(args)
  temp_timers = {}

  temp_timers.who = tempTimer(300
                              ,[[
                                local args = {}
                                Events.raiseEvent("whoTimerEvent", args)
                              ]])

  timers = temp_timers
  Events.addListener("whoTimerEvent", sourceName, whoItUp)
end

local function unsetup()
  Events.removeListener("whoTimerEvent", sourceName)
  for k,v in pairs(timers) do
    killTimer(v)
  end
end

local function resetup()
  setup()
  resetup()
end

Who_Timers = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Who_Timers
