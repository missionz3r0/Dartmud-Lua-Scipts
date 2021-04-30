local UI_Timers = {}

local timers = {}
local sourceName = "UI_Timers"

local function refreshUITimer()
  timers.refresh = tempTimer(1
                        ,[[
                          local args = {}
                          Events.raiseEvent("refreshUIEvent", args)
                        ]])
end

local function setup(args)
  temp_timers = {}

  temp_timers.refreshUI = tempTimer(1
                          ,[[
                            local args = {}
                            Events.raiseEvent("refreshUIEvent", args)
                          ]])

  timers = temp_timers
  Events.addListener("refreshUIEvent", sourceName, refreshUITimer)
end

local function unsetup()
  for k,v in pairs(timers) do
    killTimer(v)
  end
  Events.removeListener("refreshUIEvent", sourceName)
end

local function resetup()
  unsetup()
  setup()
end

UI_Timers = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return UI_Timers
